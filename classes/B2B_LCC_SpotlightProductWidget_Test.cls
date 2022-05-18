/**
 * Created by andeville on 4/04/2022.
 */

    @IsTest
    public with sharing class B2B_LCC_SpotlightProductWidget_Test {

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
        public static void getSpotlightProductsByEffectiveAccountIdsSuccessTest() {
            B2B_UTL_GlobalConstants.webStoreId = B2B_UTL_DataFactory.getDefaultWebstoreId;
            B2B_UTL_RemoteActionResponse response = B2B_LCC_SpotlightProductWidget.getSpotlightProductsByEffectiveAccountIds(
                    B2B_UTL_DataFactory.effectiveAccounts[0].Id
            );

            Test.startTest();
            System.assertEquals(response.isSuccess, true);
            System.assertEquals(((List<B2B_WR_SpotlightProduct>)response.response).size(), 2);
            Test.stopTest();
        }

        @IsTest
        public static void getSpotlightProductsByEffectiveAccountIdsIsNotSuccessTest() {
            UTL_SObjectUnitOfWork uow = new UTL_SObjectUnitOfWork(B2B_UTL_GlobalConstants.SOBJECTS_DML_DEPENDENCIES);
            B2B_UTL_GlobalConstants.webStoreId = B2B_UTL_DataFactory.getDefaultWebstoreId;

            WebStore webStore = [SELECT Id, B2B_IsSpotlightProductFeatureEnabled__c FROM WebStore LIMIT 1];

            webStore.B2B_IsSpotlightProductFeatureEnabled__c = false;

            uow.registerUpsert(webStore);
            uow.commitWork();

            B2B_UTL_RemoteActionResponse response = B2B_LCC_SpotlightProductWidget.getSpotlightProductsByEffectiveAccountIds(
                    B2B_UTL_DataFactory.effectiveAccounts[0].Id
            );

            Test.startTest();
            System.assertEquals(response.isSuccess, false);
            Test.stopTest();
        }

        @IsTest
        public static void getSpotlightProductsByEffectiveAccountIdsNoSpotlightProducts() {
            UTL_SObjectUnitOfWork uow = new UTL_SObjectUnitOfWork(B2B_UTL_GlobalConstants.SOBJECTS_DML_DEPENDENCIES);
            B2B_UTL_GlobalConstants.webStoreId = B2B_UTL_DataFactory.getDefaultWebstoreId;

            List<B2B_SpotlightProduct__c> spotlightProducts = [SELECT Id, B2B_IsSpotlightProductEnabled__c FROM B2B_SpotlightProduct__c WHERE B2B_Maison__c = 'CA'];

            for(Integer i = 0; i < spotlightProducts.size(); i++) {
                spotlightProducts[i].B2B_IsSpotlightProductEnabled__c = false;
            }

            uow.registerUpsert(spotlightProducts);
            uow.commitWork();

            B2B_UTL_RemoteActionResponse response = B2B_LCC_SpotlightProductWidget.getSpotlightProductsByEffectiveAccountIds(
                    B2B_UTL_DataFactory.effectiveAccounts[0].Id
            );

            Test.startTest();
            System.assertEquals(((List<B2B_WR_SpotlightProduct>)response.response).size(), 0);
            Test.stopTest();
        }
    }


