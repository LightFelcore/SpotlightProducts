/**
 * Created by andeville on 30/03/2022.
 */

    public with sharing class B2B_SpotlightProduct_Srv extends B2B_CommerceService {
        // Custom Exception extends from Exception
        public class SpotlightProductDisabledException extends Exception {}

        public Map<Id, B2B_WR_SpotlightProduct> getSpotlightProducts() {


            if(!isSpotlightProductFeatureEnabled()) {
                throw new SpotlightProductDisabledException('Maison disabled the spotlight product feature');
            }

            Map<Id, B2B_WR_SpotlightProduct> spotlightProductDetailsMap = new Map<Id, B2B_WR_SpotlightProduct>();
            List<B2B_SpotlightProduct__c> spotlightProducts = B2B_SpotlightProduct_Sel.getAllSpotlightProductsForMaison(effectiveAccount.B2B_Maison__c);

            List<String> productReferences = new List<String>();
            for(B2B_SpotlightProduct__c s: spotlightProducts) {
                productReferences.add(s.B2B_RelatedProduct__r.B2B_GlobalReference__c);
            }

            B2B_Product_XDomSel productXDomSel = B2B_Product_XDomSel.getNewInstanceByGlobalReference(productReferences);
            Map<Id, Map<String, Object>> productDetails = B2B_ProductFacade_Srv.generateProductSummariesForSpotlightProducts(
                    null,
                    productXDomSel.productIds,
                    effectiveAccount.Id,
                    UserInfo.getLanguage()
            );
            for(B2B_SpotlightProduct__c spotlightProduct: spotlightProducts) {
                B2B_WR_SpotlightProduct spotlightProductWrapper = new B2B_WR_SpotlightProduct(spotlightProduct, productDetails);
                spotlightProductDetailsMap.put(spotlightProduct.B2B_RelatedProduct__r.Id, spotlightProductWrapper);
            }
            return spotlightProductDetailsMap;
        }

        private Boolean isSpotlightProductFeatureEnabled() {
            WebStore currentWebStore = B2B_UTL_GlobalConstants.currentWebStore;
            return currentWebStore != null ? currentWebStore.B2B_IsSpotlightProductFeatureEnabled__c : false;
        }
    }

