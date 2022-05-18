/**
 * Created by andeville on 28/04/2022.
 */

// Standard imports
import { LightningElement, api, wire, track } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';

// Controller Apex
import getSpotlightProducts from '@salesforce/apex/B2B_LCC_SpotlightProductWidget.getSpotlightProductsByEffectiveAccountIds';

import carrouselItemsMessageChannel from '@salesforce/messageChannel/B2B_CarrouselItemsChannel__c';

export default class B2BLcpSpotlightProductsContainer extends LightningElement {

    showSpotlightProductWidget = false;
    showSpinner = true;
    isDataLoaded = false;

    spotlightProductsData = [];

    enhancements;

    @api effectiveAccountId;
    @api imagesPerSlide;
    @api statusHeaderTitleSection;
    @api statusHeaderArrowsSection;
    @api statusSideArrowsSection;
    @api statusInformationSection;
    @api statusDotsSection;
    @api autoplay;

    connectedCallback() {
        this.enhancements = {
            imagesPerSlide: this.imagesPerSlide,
            statusHeaderTitleSection: this.statusHeaderTitleSection,
            statusHeaderArrowsSection: this.statusHeaderArrowsSection,
            statusSideArrowsSection: this.statusSideArrowsSection,
            statusInformationSection: this.statusInformationSection,
            statusDotsSection: this.statusDotsSection,
            autoplay: this.autoplay
        }
        // Call Controller
        getSpotlightProducts({effectiveAccountId: this.effectiveAccountId})
            .then((data, error) => {
                // check if data exists and the length is greater than 0
                if(data.isSuccess && data.response.length > 0) {
                    this.spotlightProductsData = data.response;
                    // If the amount of slides per view is set higher then the amount of spotlight products in the carousel
                    if(this.enhancements.imagesPerSlide > this.spotlightProductsData.length) {
                        this.enhancements.imagesPerSlide = this.spotlightProductsData.length;
                    }
                    this.carrouselDataLoaded();
                } else {
                    this.showSpotlightProductWidget = false;
                    this.showSpinner = false;
                    console.error("No data retrieved or apexException occurred");
                }
            })
            .catch(error => {
                console.log(error);
            })
    }

    @wire(MessageContext) messageContext;
    renderedCallback() {
        if(this.isDataLoaded) {
            publish(this.messageContext, carrouselItemsMessageChannel, {
                data: {
                    carrouselData: this.spotlightProductsData,
                    enhancements: this.enhancements
                }
            });
        }
    }

    carrouselDataLoaded() {
        this.isDataLoaded = true;
        this.showSpotlightProductWidget = true;
        this.showSpinner = false;
    }
}