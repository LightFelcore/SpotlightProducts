/**
 * Created by andeville on 31/03/2022.
 */

    @IsTest
    public with sharing class B2B_SpotlightProduct_Sel_Test {
        @TestSetup
        public static void testDataSetup() {
            UTL_SObjectUnitOfWork uow = new UTL_SObjectUnitOfWork(B2B_UTL_GlobalConstants.SOBJECTS_DML_DEPENDENCIES);
            List<Product2> products = B2B_UTL_DataFactory.createProductsWithDefaultValues(uow);
            B2B_UTL_DataFactory.createSpotlightProductsWithDefaultValues(uow, products);
            uow.commitWork();
        }

        @IsTest
        public static void getAllSpotlightProductsForMaisonTest() {
            Test.startTest();
            List<B2B_SpotlightProduct__c> spotlightProducts = B2B_SpotlightProduct_Sel.getAllSpotlightProductsForMaison('CA');
            Test.stopTest();

            System.assertEquals(spotlightProducts.size(), 2);
        }
    }


