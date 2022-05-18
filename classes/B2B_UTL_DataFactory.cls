/**
 * Created by mdesmedt on 3/02/2021.
 */
@isTest
public with sharing class B2B_UTL_DataFactory {

    public static List<String> spotlightProductIds = new List<String> {
            'SP_CRHPI01158', 'SP_MBHPI01251', 'SP_CRHPI08898'
    };

    public static List<B2B_SpotlightProduct__c> createSpotlightProductsWithDefaultValues(UTL_SObjectUnitOfWork uow, List<Product2> products) {
        String simpleSpotlightProductName1 = 'Panthère de Cartier bracelet';
        Map<String, Object> additionalFieldValuesProduct1 = new Map<String, Object> {
                'B2B_IsSpotlightProductEnabled__c' => true,
                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => spotlightProductIds[0]
        };

        String simpleSpotlightProductName2 = 'Les Oiseaux Libérés bracelet';
        Map<String, Object> additionalFieldValuesProduct2 = new Map<String, Object> {
                'B2B_IsSpotlightProductEnabled__c' => true,
                'B2B_Maison__c' => 'MB',
                'B2B_ExternalId__c' => spotlightProductIds[1]
        };

        String simpleSpotlightProductName3 = '#LOVE# bracelet, diamond-paved';
        Map<String, Object> additionalFieldValuesProduct3 = new Map<String, Object> {
                'B2B_IsSpotlightProductEnabled__c' => true,
                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => spotlightProductIds[2]
        };

        List<B2B_SpotlightProduct__c> spotlightProducts = new List<B2B_SpotlightProduct__c>();
        spotlightProducts.add(UTL_DataFactory.createSpotlightProduct(simpleSpotlightProductName1, additionalFieldValuesProduct1, false));
        spotlightProducts.add(UTL_DataFactory.createSpotlightProduct(simpleSpotlightProductName2, additionalFieldValuesProduct2, false));
        spotlightProducts.add(UTL_DataFactory.createSpotlightProduct(simpleSpotlightProductName3, additionalFieldValuesProduct3, false));

        uow.registerNew(spotlightProducts);

        uow.registerRelationship(spotlightProducts[0], B2B_SpotlightProduct__c.B2B_RelatedProduct__c, products[0]);
        uow.registerRelationship(spotlightProducts[1], B2B_SpotlightProduct__c.B2B_RelatedProduct__c, products[1]);
        uow.registerRelationship(spotlightProducts[2], B2B_SpotlightProduct__c.B2B_RelatedProduct__c, products[2]);

        return spotlightProducts;
    }
}
