/**
 * Created by andeville on 4/04/2022.
 */
    @IsTest
    public with sharing class B2B_SpotlightProduct_Srv_Test {
        @TestSetup
        public static void testDataSetup() {
            UTL_SObjectUnitOfWork uow = new UTL_SObjectUnitOfWork(B2B_UTL_GlobalConstants.SOBJECTS_DML_DEPENDENCIES);
            List<WebStore> webStores = B2B_UTL_DataFactory.createWebStoresWithDefaultValues(uow);
            List<B2B_Localisation__c> localisations = B2B_UTL_DataFactory.createLocalisationWithParentLocalisation(uow);
            List<Account> accounts = B2B_UTL_DataFactory.createAccountsWithDefaultValuesAndLocalisation(uow, localisations[0]);
            List<Product2> products = B2B_UTL_DataFactory.createProductsWithDefaultValues(uow);
            B2B_UTL_DataFactory.createSpotlightProductsWithDefaultValues(uow, products);
            uow.commitWork();
        }

        @IsTest
        public static void getSpotlightProductsTest() {
            B2B_UTL_GlobalConstants.webStoreId = B2B_UTL_DataFactory.getDefaultWebstoreId;

            B2B_CommerceServiceFactory commerceServiceFactory = B2B_CommerceServiceFactory.getNewInstance(B2B_UTL_DataFactory.effectiveAccounts[0].Id);
            B2B_SpotlightProduct_Srv spotlightProductService = (B2B_SpotlightProduct_Srv) commerceServiceFactory.getNewCommerceService(B2B_SpotlightProduct_Srv.class);

            Map<Id, B2B_WR_SpotlightProduct> spotlightProductTestMap = spotlightProductService.getSpotlightProducts();

            Test.startTest();
            System.assertEquals('Tank Solo watch', spotlightProductTestMap.values()[0].name);
            System.assertEquals(spotlightProductTestMap.values().size(), 2);
            Test.stopTest();
        }
    }

