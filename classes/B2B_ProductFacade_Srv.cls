/***********************************************************************************************************************
* @author         Tom Mahieu <tmahieu@deloitte.com>
* @description    Get Product Results with the expected enrichments of the product data
***********************************************************************************************************************/
public with sharing class B2B_ProductFacade_Srv {

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 2/03/2021
     * @description Generate a summary of product data results.
     * @param returnOptions Set<String>: The different fields in the product object that we want to see in the product summary.
     * @param webstoreId Id: the id of the webstore.
     * @param productIds List<Id>: List of product ids that are in scope. For this facade to work properly you should add
     *                   all the product ids that this function needs to generate a product summary for.
     * @param effectiveAccountId Id: The effective account Id that we are generating data for.
     * @param language String: the user's language code.
     * @return Map<Id, Map<String, Object>>: Map of the product Id connected to the product summary. The product summary
     *         is of type: Map<String, Object> to dynamically adjust it with the required options in scope. This object
     *         should be treated as a wrapper for product summary. The structure of the wrapper is comparable to the
     *         structure provide by Salesforce's out-of-the-box product summary in search results. By default it contains
     *         "id", "name", and "productClass". The other options are generated when provided in this function. See also:
     *         https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_responses_product_summary.htm
     ******************************************************************************************************************/
    public static Map<Id, Map<String, Object>> generateProductSummaries(Set<String> returnOptions, Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {

        initialiseScopeData(webstoreId, productIds, new List<Id>{effectiveAccountId}, language);
        Map<Id, Map<String, Object>> productSummaryCollection = new Map<Id, Map<String, Object>>();

        List<Product2> productList = B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel.productsById.values();
        if (returnOptions.contains('orders')) {
            addReplacements(productIds);
        }
        if (returnOptions.contains('posStockInfo') || returnOptions.contains('history') || returnOptions.contains('orders')) {
            addProductHistory(productIds);
        }

        for (Product2 product : productList) {
            Map<String, Object> productResult = new Map<String, Object>();

            productResult.put('id', product.Id);
            productResult.put('name', product.Name);
            Product2DataTranslation trans = B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel.productTranslationsByProductId.get(product.Id);
            if(trans != null){
                productResult.put('name', trans.Name);
            }
            productResult.put('productClass', product.ProductClass);

            for (String option : returnOptions) {
                if (!registeredServiceForReturnOption.containsKey(option)) {
                    continue;
                }
                Type optionType = registeredServiceForReturnOption.get(option);
                B2B_UTL_ProductGeneratorInterface generator = generatorPool.getGeneratorInstance(optionType);
                productResult.put(option, generator.generateDataForProductById(product.Id, effectiveAccountId));
            }
            productSummaryCollection.put(product.Id, productResult);

		}
        return productSummaryCollection;
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 2/03/2021
     * @description generate a summary of product data results to be used on the product list page.
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
     *         product list page. See also:
     *         https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_responses_product_summary.htm
     ******************************************************************************************************************/
    public static Map<Id, Map<String, Object>> generateProductSummariesForPLP(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        Map<Id, Map<String, Object>> productSummaries = generateProductSummaries(returnOptionsByPage.get('PLP'), webstoreId, productIds, effectiveAccountId, language);
        return processProductServicesInfo(productSummaries);
    }

    /*******************************************************************************************************************
    * @author       Kürsad Görgülü (kgorgulu@deloitte.com)
    * @description  Process the product services info
    * @date         September 2021
    * @param        productSummaries : map of the product summaries to be processed
    * @return       Map<Id, Map<String, Object>> enriched product summaries
    *******************************************************************************************************************/
    public static Map<Id, Map<String, Object>> processProductServicesInfo(Map<Id, Map<String, Object>> productSummaries){
        for(Id product : productSummaries.keySet()){
            if(product != null){
                Boolean canBeAddedToCart = true;
                B2B_WR_OrderType orderType = productSummaries.get(product).containsKey('orderType')? (B2B_WR_OrderType) productSummaries.get(product).get('orderType') : null;
                B2B_WR_ProductFields productFields = productSummaries.get(product).containsKey('fields')? (B2B_WR_ProductFields) productSummaries.get(product).get('fields') : null;
                B2B_WR_ProductReplacement productReplacement = productSummaries.get(product).containsKey('replacement')? (B2B_WR_ProductReplacement) productSummaries.get(product).get('replacement') : null;
                B2B_WR_ProductPrices productPrices = productSummaries.get(product).containsKey('prices')? (B2B_WR_ProductPrices) productSummaries.get(product).get('prices') : null;

                canBeAddedToCart = !(
                        (orderType != null && !orderType.consignmentOrder && !orderType.firmOrder && !orderType.standardOrder) ||
                        (productFields != null && !productFields.isOrderable) ||
                        productReplacement != null ||
                        (productPrices != null && productPrices.unitPrice == null)
                ) ;

                productSummaries.get(product).put('canBeAddedToCart', canBeAddedToCart);
            }
        }

        return productSummaries;
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 2/03/2021
     * @description generate a summary of product data results to be used on the product detail page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForPDP(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        B2B_ProductPosStockInfo_Srv.isPdp = true;
        Map<Id, Map<String, Object>> productSummaries = generateProductSummaries(returnOptionsByPage.get('PDP'), webstoreId, productIds, effectiveAccountId, language);
        return processProductServicesInfo(productSummaries);
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 2/03/2021
     * @description generate a summary of product data results to be used on the product detail page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForCartPage(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return processProductServicesInfo(
                generateProductSummaries(returnOptionsByPage.get('CART'), webstoreId, productIds, effectiveAccountId, language)
        );
    }

    /*******************************************************************************************************************
     * @author          Lennart Schelfhout <lschelfhout@deloitte.com>
     * @date            April 2021
     * @description     generate a summary of product data results to be used on the product detail page.
     * @param           webstoreId Id: the id of the webstore.
     * @param           productIds List<Id>: List of product ids that are in scope. For this facade to work properly you
     *                  should add all the product ids that this function needs to generate a product summary for.
     * @param           effectiveAccountId Id: The effective account Id that we are generating data for.
     * @param           language String: the user's language code.
     * @return          Map<Id, Map<String, Object>>: Map of the product Id connected to the product summary.
     *                  The product summary is of type: Map<String, Object> to dynamically adjust it with the required
     *                  options in scope. This object should be treated as a wrapper for product summary. The structure
     *                  of the wrapper is comparable to the structure provide by Salesforce's out-of-the-box product
     *                  summary in search results. By default it contains "id", "name", and "productClass".
     *                  The other options are generated using the default values needed for the product detail page. See also:
     *                  https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_responses_product_summary.htm
 ******************************************************************************************************************/
    public static Map<Id, Map<String, Object>> generateProductSummariesForOrderPage(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('ORDER'), webstoreId, productIds, effectiveAccountId, language);
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 13/07/2021
     * @description generate a summary of product data results to be used on the POS Stock page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForPosStockPage(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('STOCK'), webstoreId, productIds, effectiveAccountId, language);
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 18/01/2022
     * @description generate a summary of product data results to be used on the Consignment Transfer page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForConsignedTransfer(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('CONS.TRANS'), webstoreId, productIds, effectiveAccountId, language);
    }

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
     * @author Loïc Turbang <lturbang@deloitte.com>
     * @date 20/12/2021
     * @description generate a summary of product data results to be used on the Stock Movement page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForStockMovement(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('STOCKMOVEMENT'), webstoreId, productIds, effectiveAccountId, language);
    }

	/*******************************************************************************************************************
     * @author Raffaele Fioratto <rfioratto@deloitte.it>
     * @date September 2021
     * @description generate a summary of product data results to be used on the Serial Number History page
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
	public static Map<Id, Map<String, Object>> generateProductSummariesForSNHistory(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('SNHISTORY'), webstoreId, productIds, effectiveAccountId, language);
	}
	
	/*******************************************************************************************************************
     * @author Francesco Ciccarelli <fciccarelli@deloitte.it>
     * @date 29/09/2021
     * @description generate a summary of product data results to be used on the sellout item detail page.
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
    public static Map<Id, Map<String, Object>> generateProductSummariesForSellOutItemDetail(Id webstoreId, List<Id> productIds, Id effectiveAccountId, String language) {
        return generateProductSummaries(returnOptionsByPage.get('SELLOUTDETAIL'), webstoreId, productIds, effectiveAccountId, language);
    }

    /**********************************************PRIVATE METHODS/PROPERTIES******************************************/

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

    @TestVisible
    private static B2B_ProductGeneratorPool_Srv generatorPool = new B2B_ProductGeneratorPool_Srv();

    public static B2B_ProductGeneratorPool_Srv getGeneratorPool() {
        return generatorPool;
    }

    @TestVisible
    private static void initialiseScopeData(Id webstoreId, List<Id> productIds, List<Id> accountIds, String language) {
        B2B_ProductInfoSingleton_Srv.getInstance().webstoreId = webstoreId;
        B2B_ProductInfoSingleton_Srv.getInstance().languageKey = language;
        try {
            Boolean initialisedProducts = B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel != null;
        } catch (B2B_ProductInfoSingleton_Srv.PropertyNeverInitialisedException e) {
            B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel = B2B_Product_XDomSel.getNewInstance(productIds);
        }

        try {
            Boolean initialisedAccounts = B2B_ProductInfoSingleton_Srv.getInstance().accountXDomSel != null;
        } catch (B2B_ProductInfoSingleton_Srv.PropertyNeverInitialisedException e) {
            B2B_ProductInfoSingleton_Srv.getInstance().accountXDomSel = B2B_Account_XDomSel.getNewInstance(accountIds);
        }

    }

    private static void addReplacements(List<Id> productIds) {
        if (productIds == null) {
            return;
        }
        B2B_ProductReplacement_Srv replacementSrv = (B2B_ProductReplacement_Srv) B2B_ProductFacade_Srv.getGeneratorPool().getGeneratorInstance(B2B_ProductReplacement_Srv.class);
        Set<Id> replacedProductIds = new Set<Id>(productIds);
        for (Id productId : productIds) {
            replacedProductIds.addAll(replacementSrv.getReplacementForProductId(productId));
        }
        B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel = B2B_Product_XDomSel.getNewInstance(new List<Id>(replacedProductIds));
    }

    private static void addProductHistory(List<Id> productIds) {
        if (productIds == null) {
            return;
        }
        B2B_ProductHistory_Srv historySrv = (B2B_ProductHistory_Srv) B2B_ProductFacade_Srv.getGeneratorPool().getGeneratorInstance(B2B_ProductHistory_Srv.class);
        Set<Id> replacedProductIds = new Set<Id>(productIds);
        replacedProductIds.addAll(historySrv.getHistoricalProductIds());
        B2B_ProductInfoSingleton_Srv.getInstance().productXDomSel = B2B_Product_XDomSel.getNewInstance(new List<Id>(replacedProductIds));
    }

}