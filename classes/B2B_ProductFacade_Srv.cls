public with sharing class B2B_ProductFacade_Srv {
     /*******************************************************************************************************************
     * @author Anthony Deville <tmahieu@deloitte.com>
     * @date 20/04/2022
     * @description generate a summary of product data results to be used on the Spotlight Product Widget.
     * @param webstoreId Id: the id of the webstore.
     * @param productIds List<Id>: List of product ids that are in scope. For this facade to work properly you should add
     *                   all the product ids that this function needs to generate a product summary for.
     * @param effectiveAccountId Id: The effective account Id that we are generating data for.
     * @param language String: the user's language code.
     * @return Map<Id, Map<String, Object>>: Map of the product Id connected to the product summary. The product summary
     *         is of type: Map<String, Object> to dynamically adjust it with the required options in scope. This object
     *         should be treated as a wrapper for product summary. The structure of the wrapper is comparable to the
     *         structure provide by Salesforce's out-of-the-box product summary in search results. By default it contains
     *         "id", "name", and "productClass". The other options are generated using the default values needed for the
     *         product detail page. See also:
     *         https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_responses_product_summary.htm
     ******************************************************************************************************************/
    public static Map<Id, Map<String, Object>> generateProductSummariesForSpotlightProducts(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('SPOTLIGHTPRODUCT'), webstoreId, productIds, effectiveAccountId, language);
    }


     /*******************************************************************************************************************
     * Register a service to handle a field in the product summary. (@note)
     ******************************************************************************************************************/
    private static Map<String,Type> registeredServiceForReturnOption = new Map<String,Type> {
            'modelStock' => B2B_ProductModelStock_Srv.class,
            'modelStockConfig' => B2B_ProductModelStockDisplay_Srv.class,
            'fields' => B2B_ProductFields_Srv.class,
            'productAssets' => B2B_ProductAssets_Srv.class,
            'defaultImage' => B2B_ProductDefaultImage_Srv.class,
            'prices' => B2B_ProductPrices_Srv.class,
            'productAvailability' => B2B_ProductAvailability_Srv.class, 
			'replacement' => B2B_ProductReplacement_Srv.class,
            'orderType' => B2B_OrderType_Srv.class,
			'attributes' => B2B_ProductAttributes_Srv.class,
            'posStockInfo' => B2B_ProductPosStockInfo_Srv.class,
            'history' => B2B_ProductHistory_Srv.class,
            'spotlightProduct' => B2B_SpotlightProduct_Srv.class,
            'orders' => B2B_ProductOrders_Srv.class,
            'cfsProductEligibility' => B2B_CFSProductEligibility_Srv.class
            //'stockMovement' => B2B_StockMovement_Srv.class
    };


    /*******************************************************************************************************************
     * Default field requirements for certain pages.
     * (@note: Add the fields that you require on a certain page here.)
     ******************************************************************************************************************/
    public static final Map<String,Set<String>> returnOptionsByPage = new Map<String,Set<String>> {
            'PDP' => new Set<String> {
                    'modelStock', 'fields', 'defaultImage', 'productAssets', 'productAvailability',
                    'prices', 'replacement', 'attributes', 'orderType', 'orders', 'modelStockConfig'
            },
            'PLP' => new Set<String> {
                    'modelStock', 'fields', 'productAvailability', 'prices',
                    'replacement', 'orderType', 'cfsProductEligibility'
            },
            'SPOTLIGHTPRODUCT' => new Set<String> {
                    'fields', 'defaultImage'
            },
            'CART' => new Set<String>{
                    'modelStock', 'fields', 'productAvailability', 'orderType'
            },
            'ORDER' => new Set<String> {
                    'modelStock', 'fields', 'replacement', 'history'
            },
            'STOCK' => new Set<String> {
                    'posStockInfo', 'modelStock', 'fields', 'replacement', 'productAvailability',
                    'orders', 'modelStockConfig'
            },
			'SNHISTORY' => new Set<String> {
					'fields'
			},
			'SELLOUTDETAIL' => new Set<String> {
					'fields', 'defaultImage'
			},
            'STOCKMOVEMENT' => new Set<String> {
                    'fields'
            },
            'CONS.TRANS' => new Set<String> {
                    'fields'
            }
    };
}
