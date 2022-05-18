/**
 * Created by andeville on 31/03/2022.
 */

    public with sharing class B2B_WR_SpotlightProduct {
        @AuraEnabled public Id id;
        @AuraEnabled public String name;
        @AuraEnabled public String url;

        public B2B_WR_SpotlightProduct(B2B_SpotlightProduct__c spotlightProduct, Map<Id, Map<String, Object>> productDetails) {
            this.id = spotlightProduct.B2B_RelatedProduct__r.Id;
            this.name = spotlightProduct.B2B_RelatedProduct__r.Name;
            this.url = productDetails.get(spotlightProduct.B2B_RelatedProduct__r.Id)
                    .get('defaultImage') != null ? ((B2B_WR_ProductAssetDetails)productDetails
                    .get(spotlightProduct.B2B_RelatedProduct__r.Id)
                    .get('defaultImage')).url : null;
        }
    }

