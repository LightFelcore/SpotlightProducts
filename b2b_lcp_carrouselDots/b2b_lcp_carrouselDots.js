/**
 * Created by andeville on 8/04/2022.
 */
import { LightningElement, api, wire } from 'lwc';

import { subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext } from 'lightning/messageService';
import carrouselItemsMessageChannel from '@salesforce/messageChannel/B2B_CarrouselItemsChannel__c';

export default class B2BLcpCarrouselDots extends LightningElement {

    showLeftDot;
    showRightDot;

    carrouselLength;
    enhancements = {};
    dotsDataOnLoad = {};
    dotsDataOnResize = {};

    moreThanThreeCarouselItems;
    hideDots;
    dotsAmount;

    state = {
        prev: "prev",
        next: "next"
    }

    @api slideCount;
    @api activeDot = 0;

    @api
    get parentDataOnLoad() {
        return this.dotsDataOnLoad;
    }
    set parentDataOnLoad(value) {
        this.dotsDataOnLoad = value;
    }

    // Wired properties and functions
    @wire(MessageContext) messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
        if(this.dotsDataOnLoad.statusDotsSection) {
            this.carrouselLength = this.dotsDataOnLoad.carrouselLength;
            this.setDotsAmount(this.carrouselLength);
        }
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
                   this.onSlideChange(eventContext.data.slideCount, eventContext.data.state);
               },
               { scope: APPLICATION_SCOPE }
           );
       }
    }

    unsubscribeToMessageChannel() {
       unsubscribe(this.subscription);
       this.subscription = null;
    }

    onSlideChange(slideCount = 0, state) {
        this.showLeftDot = false;
        this.showRightDot = false;
        if(state == this.state.next) {
            if(this.moreThanThreeCarouselItems) {
                this.showLeftDot = false;
                this.showRightDot = true;
                if(slideCount != 0) {
                    if(slideCount < 3) {
                        this.activeDot = slideCount;
                        this.animateDotSliding(slideCount);
                    } else {
                        this.activeDot = 2;
                        this.showLeftDot = true;
                        if(slideCount < this.carrouselLength - 1) {
                            this.showRightDot = true;
                        } else {
                            this.showRightDot = false;
                        }
                        this.animateDotSliding(this.activeDot);
                    }
                } else {
                    this.activeDot = 0;
                    this.animateDotSliding(slideCount);
                }
            } else {
                if(slideCount < this.carrouselLength) {
                    this.activeDot = slideCount;
                } else {
                    this.activeDot = 2;
                }
                this.animateDotSliding(slideCount);
            }
        } else {
            if(this.moreThanThreeCarouselItems) {
                this.showLeftDot = true;
                this.showRightDot = false;
                if(slideCount < this.carrouselLength - 1) {
                    this.showRightDot = true;
                    if(slideCount < 3){
                        this.activeDot = slideCount;
                        this.showLeftDot = false;
                        this.animateDotSliding(slideCount);
                    } else {
                        this.activeDot = 2;
                        this.animateDotSliding(this.activeDot);
                    }
                }
                else {
                    this.activeDot = 2;
                    this.animateDotSliding(this.activeDot);
                }
            } else {
                if(slideCount < this.carrouselLength - 1) {
                    this.activeDot = slideCount;
                } else {
                    this.activeDot = 0;
                }
                this.animateDotSliding(slideCount)
            }
        }
    }

    onDotClick(e) {
        // Determine the difference between active slide and selected slide
        let slideIndex = e.target.dataset.id - this.activeDot;
        // Send difference and state to parent
        this.dispatchEvent(new CustomEvent('dotclick', {
            detail: {
                state: slideIndex < 0 ? this.state.prev : this.state.next,
                slideIndex: Math.abs(slideIndex)
            }
        }))
    }

    @api
    animateDotSliding(slideCount) {
        let pxBetweenDot = 19;
        this.template.querySelector('[data-indicator="indicator"]').style.left = (pxBetweenDot * slideCount) + 'px';
    }

    // Function in order to set the right amount of dots
    @api
    setDotsAmount(carrouselItemsAmount) {
        this.showLeftDot = false;
        this.showRightDot = false;
        if(carrouselItemsAmount > 0) {
            if(carrouselItemsAmount > 3) {
                // Show 3 dots and 2 little dots
                this.moreThanThreeCarouselItems = true;
                this.showLeftDot = false;
                this.showRightDot = true;
                this.dotsAmount = new Array(3).fill(1);
            } else {
                this.moreThanThreeCarouselItems = false;
                this.dotsAmount = new Array(carrouselItemsAmount).fill(1);
            }
        } else {
            this.hideDots = true;
        }
    }

    @api
    setCarrouselLength(length) {
        this.carrouselLength = length;
    }
}