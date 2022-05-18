/**
 * Created by andeville on 28/04/2022.
 */

import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

// ICONS and IMAGES
import HEADER_ICONS from '@salesforce/resourceUrl/B2B_STR_HeaderIcons';

// Labels
import carrouselHeaderTitle from "@salesforce/label/c.B2B_SpotlightProductTitle";
import seeDetailsLabel from "@salesforce/label/c.B2B_Button_SeeDetailsText";
import brokenCarouselImageLabel from "@salesforce/label/c.B2B_BrokenCarrouselImage";

import { subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext, publish } from 'lightning/messageService';
import carrouselItemsMessageChannel from '@salesforce/messageChannel/B2B_CarrouselItemsChannel__c';

export default class B2BLcpCarrouselContent extends NavigationMixin(LightningElement) {

    carrouselContentData;

    arrowLeft = `${HEADER_ICONS}#arrow-left-s-icon`;
    arrowRight = `${HEADER_ICONS}#arrow-right-icon`;
    imagePlaceholder = `${HEADER_ICONS}#image-placeholder`;

    interval;
    carrousel;
    slidesLi;
    slidesUl;
    imagesPerSlide;
    slidesLeftToBeProcessed;

    hasOneImagePerSlide = false;
    isSpecialSliding = false;
    isPageResized = false;

    touchesInAction = {};
    slideChangeObject = {};
    enhancements = {};

    slideCount = 0;
    transformFactor = 0;

    state = {
        prev: "prev",
        next: "next"
    }

    labels = {
        carrouselHeaderTitle,
        seeDetailsLabel,
        brokenCarouselImageLabel
    }

    // Wired properties and functions
    @wire(MessageContext) messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    renderedCallback() {
        // Set the carrousel view upon rendering
        this.setCarrouselView(this.isPageResized = false);
        // Set the carrousel view upon resizing
        this.onScreenResize();
    }

    disconnectedCallback() {
        this.unsubscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
       if (!this.subscription) {
           this.subscription = subscribe(
               this.messageContext,
               carrouselItemsMessageChannel,
               // data from parent
               (eventContext) => {
                   this.carrouselContentData = eventContext.data.carrouselData;
                   this.enhancements = eventContext.data.enhancements;

                   // Cast imagesPerSlide from string to int and replace it in data
                   const { imagesPerSlide, ...tempData } = this.enhancements; // Remove current property in object
                   // concat new object to current with parsed string value to int
                   this.enhancements = {
                        ...this.enhancements,
                        ...{ imagesPerSlide: parseInt(eventContext.data.enhancements.imagesPerSlide) }
                    };

                   // Data is send to dots component upon loading of the component (needed for setting amount of dots). Linked to get/set functions in child component
                   this.dotsDataOnLoad = { ...this.enhancements, ...{
                           carrouselLength: this.isMobileView() || this.isTabletView() ?
                                 this.carrouselContentData.length :
                                 Math.ceil(this.carrouselContentData.length / this.enhancements.imagesPerSlide),
                           hasOneImagePerSlide: this.hasOneImagePerSlide,
                           enhancements: this.enhancements
                     } };

                   // Activate the automatic sliding process of the carrousel
                   if(this.enhancements.autoplay) {
                       this.automaticSliding();
                   }
               },
               { scope: APPLICATION_SCOPE }
           );
       }
    }

   unsubscribeToMessageChannel() {
       unsubscribe(this.subscription);
       this.subscription = null;
   }

   onScreenResize() {
       window.addEventListener('resize', () => {
          this.setCarrouselView(this.isPageResized = true);
       });
   }

   setCarrouselView() {
       this.carrousel = this.template.querySelector('[data-carrousel="carrousel"]');
       this.slidesUl = this.template.querySelectorAll('[data-carrousel-slides-container="carrousel-slides-container"]');
       this.slidesLi = this.template.querySelectorAll('[data-slide="slide"]');

       if(this.enhancements.imagesPerSlide != undefined) {
          let itemWidth = 100 / this.enhancements.imagesPerSlide + "%";
          for(let i = 0; i < this.slidesLi.length; i++) {
              // Check mobile || tablet view
              if(this.isMobileView() || this.isTabletView()) {
                  this.slidesLi[i].style.setProperty('--carrousel-image-width', "100%");
              } else {
                  this.slidesLi[i].style.setProperty('--carrousel-image-width', itemWidth);
              }
          }
       }

       // 33% must be changed --> EP
       this.hasOneImagePerSlide = this.enhancements.imagesPerSlide == 1;

       // Put 'Math.ceil(this.carrouselContentData.length / this.enhancements.imagesPerSlide)' in a function
       if(this.carrouselContentData != undefined && this.isPageResized) {
           if(this.isMobileView() || this.isTabletView()) {
               this.dotsDataOnResize = this.carrouselContentData.length;
           } else {
               this.dotsDataOnResize = Math.ceil(this.carrouselContentData.length / this.enhancements.imagesPerSlide);
           }
           // Set the slideCount = 0 and slide to first image
           this.resetCarrouselView(this.slideCount = 0);
           // Set the correct dots amount depending on the device view
           this.template.querySelector('c-b2b_lcp_carrousel-dots').setCarrouselLength(this.dotsDataOnResize);
           this.template.querySelector('c-b2b_lcp_carrousel-dots').setDotsAmount(this.dotsDataOnResize);

           this.isPageResized = false;
       }
   }

   isMobileView() {
       return window.matchMedia('screen and (max-width: 425px)').matches;
   }
   isTabletView() {
       return window.matchMedia('screen and (min-width: 426px) and (max-width: 768px)').matches;
   }

    onNavArrowClick(e) {
        if(e.currentTarget.dataset.id == this.state.prev) {
            this.changeSlide(this.processSlideNumber(this.state.prev, 1));
        } else {
            this.changeSlide(this.processSlideNumber(this.state.next, 1));
        }
    }

    processSlideNumber(e, a) {
        this.isSpecialSliding = false;
        this.hasOneImagePerSlide = this.isMobileView() || this.isTabletView();
        if(e == this.state.next) {
            //Single image
            if(this.hasOneImagePerSlide) {
                if(this.slideCount == this.carrouselContentData.length - 1) {
                    this.slideCount = 0;
                } else {
                    this.slideCount = this.slideCount + a;
                }
            }
            // Multiple images
            else {
                let maxSlideCount = Math.ceil(this.carrouselContentData.length / this.enhancements.imagesPerSlide) - 1;
                if(this.slideCount == maxSlideCount) {
                    this.slideCount = 0;
                } else {
                    this.slideCount += a;
                    if(!this.checkCanSlideProperly()) {
                        this.isSpecialSliding = true;
                        this.transformFactor = (this.carrouselContentData.length / this.enhancements.imagesPerSlide - 1);
                    }
                }
            }
        } else {
            // Single Image
            if(this.hasOneImagePerSlide) {
                if(this.slideCount == 0) {
                    this.slideCount = this.carrouselContentData.length - 1;
                } else {
                    this.slideCount = this.slideCount - a;
                }
            }
            // Multiple Images
            else {
                let maxSlideCount = Math.ceil(this.carrouselContentData.length / this.enhancements.imagesPerSlide) - 1;
                if(this.slideCount == 0) {
                    this.isSpecialSliding = true;
                    this.slideCount = maxSlideCount;
                    this.transformFactor = (this.carrouselContentData.length / this.enhancements.imagesPerSlide - 1);
                } else {
                    this.slideCount -= a;
                }
            }
        }
        publish(this.messageContext, carrouselItemsMessageChannel, {
            data: {
                carrouselData: this.carrouselContentData,
                enhancements: this.enhancements,
                slideCount: this.slideCount,
                state: e
            }
        });

        return this.slideCount;
    }

    checkCanSlideProperly() {
        let slidesDone = (this.slideCount + 1) * this.enhancements.imagesPerSlide;
        this.slidesLeftToBeProcessed = this.carrouselContentData.length - slidesDone;
        return this.slidesLeftToBeProcessed >= 0;
    }

    // Change slide function
    changeSlide(currentSlide) {
        if(this.enhancements.autoplay) this.automaticSliding();
        for(let i = 0; i < this.slidesUl.length; i++) {
            if(this.isSpecialSliding) {
                this.slidesUl[i].style.setProperty('--current-slide', this.transformFactor);
            }
            else {
                this.slidesUl[i].style.setProperty('--current-slide', currentSlide);
            }
        }
    }

    automaticSliding() {
        clearInterval(this.interval);
        this.interval = setInterval(() => {
            this.changeSlide(this.processSlideNumber(this.state.next, 1));
        }, 3500);
    }

    handleDotClick(e) {
        clearInterval(this.interval);
        this.changeSlide(this.processSlideNumber(e.detail.state, e.detail.slideIndex));
    }

    onTouchStart(e) {
        clearInterval(this.interval);
        let touches = e.changedTouches;
        for(var j = 0; j < touches.length; j++) {
             this.touchesInAction[ "$" + touches[j].identifier ] = {
                identifier : touches[j].identifier,
                pageX : touches[j].pageX
             };
        }
    }

    onTouchEnd(e) {
        let touches = e.changedTouches;
        for(let i = 0; i < touches.length; i++) {
            this.touchesInAction["$" + touches[i].identifier].dx = touches[i].pageX - this.touchesInAction["$" + touches[i].identifier].pageX;
            if(this.touchesInAction["$" + touches[i].identifier].dx > 1) {
                this.changeSlide(this.processSlideNumber(this.state.previous, 1));
            } else if(this.touchesInAction["$" + touches[i].identifier].dx < 0) {
                this.changeSlide(this.processSlideNumber(this.state.next, 1));
            }
        }
    }

    onCarrouselItemClick(e) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                // Id of the related product id
                recordId: this.carrouselContentData[e.currentTarget.dataset.id].id,
                actionName: 'view'
            }
        });
    }

    resetCarrouselView(slideCount) {
        this.changeSlide(slideCount);
        this.template.querySelector('c-b2b_lcp_carrousel-dots').activeDot = 0;
        this.template.querySelector('c-b2b_lcp_carrousel-dots').animateDotSliding(slideCount);
    }
}