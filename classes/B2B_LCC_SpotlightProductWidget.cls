/**
 * Created by andeville on 31/03/2022.
 */

    public with sharing class B2B_LCC_SpotlightProductWidget {
        /*******************************************************************************************************************
        * @author Anthony Deville
        * @date 31/03/2022
        * @description Get spotlight product data for a certain account.
        * @param effectiveAccountId (Id): The id of the logged in account.
        * @return (B2B_UTL_RemoteActionResponse): response with result of spotlight product data.
        ******************************************************************************************************************/
        @AuraEnabled
        public static B2B_UTL_RemoteActionResponse getSpotlightProductsByEffectiveAccountIds(Id effectiveAccountId) {
            B2B_UTL_RemoteActionResponse response = new B2B_UTL_RemoteActionResponse();
            try {
                B2B_CommerceServiceFactory commerceServiceFactory = B2B_CommerceServiceFactory.getNewInstance(effectiveAccountId);
                B2B_SpotlightProduct_Srv spotlightProductSrv = (B2B_SpotlightProduct_Srv) commerceServiceFactory.getNewCommerceService(B2B_SpotlightProduct_Srv.class);
                response.isSuccess = true;
                response.response = spotlightProductSrv.getSpotlightProducts().values();
            } catch (Exception e) {
                response = new B2B_UTL_RemoteActionResponse(false, null, e);
            }
            return response;
        }
    }

