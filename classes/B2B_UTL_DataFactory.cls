/**
 * Created by mdesmedt on 3/02/2021.
 */
@isTest
public with sharing class B2B_UTL_DataFactory {

    //*****************************************PUBLIC VARIABLES**************************************************/
    public static List<String> productSKUs = new List<String>{
            'UT-CRW5200013', 'UT-CRWM505010', 'UT-MBB3041200', 'UT-CR40083069', 'UT-CRW69010Z4', 'UT-CRW5200014'
    };
    public static List<String> variantProductSKUs = new List<String>{
            'UT-VPM123434','UT-VPWM505010', 'UT-VPB3041200'
    };
    public static List<String> brandedPOSExternalIds = new List<String>{
            'UT-CA/02/06CA/0000100999', 'UT-MB/02/06MB/0000100999', 'UT-CA/02/06CA/0000100123', 'UT-CA/02/06CA/0000100124'
    };
    public static List<String> doorAccountExternalIds = new List<String>{
            'UT-CHAIN/BUCHERER','UT-GEMINI/100999'
    };
    public static List<String> brandedPOSExternalIds2 = new List<String>{
            'UT-UT100/100124/MB', 'UT-UT100/100125/CA', 'UT-UT100/100125/MB', 'UT-UT100/100126/CA', 'UT-UT100/100127/CA', 'UT-UT100/100127/MB', 'UT-UT100/100128/CA', 'UT-UT100/100128/MB'
    };
    public static List<String> doorAccountExternalIds2 = new List<String>{
            'UT-GEMINI/100123', 'UT-GEMINI/100124', 'UT-GEMINI/100125', 'UT-GEMINI/100126', 'UT-GEMINI/100127', 'UT-GEMINI/100128'
    };
    public static List<String> navigationMenuNames = new List<String>{
            'Default_Navigation', 'Montblanc_Navigation'
    };

    public static List<String> productCategories = new List<String>{
            'JMF', 'WMF'
    };
    public static List<String> webstoreExternalIds = new List<String>{
            'CA', 'MB'
    };
    public static List<String> localisationLevels = new List<String>{
            'Sales Org', 'Market/BU'
    };
    public static List<String> localisationChannels = new List<String>{
            '06'
    };
    public static List<String> productIds = new List<String>{
            '01t3O0000066u7FQAQ','01t3O0000066u7fQAA','01t3O0000066v32QAA'
    };
    public static List<String> spotlightProductIds = new List<String> {
            'SP_CRHPI01158', 'SP_MBHPI01251', 'SP_CRHPI08898'
    };

    public static Map<String, Integer> productSkuToAssetCount = new Map<String, Integer>{
            'UT-CRW5200013' => 3,
            'UT-CRWM505010' => 2,
            'UT-MBB3041200' => 3,
            'UT-CR40083069' => 2,
            'UT-CRW69010Z4' => 2,
			'UT-CRW5200014' => 2
    };

    public static Map<String, Integer> productSkuToAvailabilityCount = new Map<String, Integer>{
            'UT-CRW5200013' => 3,
            'UT-CRWM505010' => 3,
            'UT-MBB3041200' => 2
    };

	public static List<String> translationAttributes = new List<String>{
		'standardizedOrganizationCode',
		'Collection_standardizedName',
		'Materials_standardizedColor'
	};

	public static String selectedFilters = '{"InvoiceDateTo":[{"value":"' + Date.today().addDays(1) + '","filterId":"InvoiceDateTo","fieldDevName":"B2B_SellOut__r.B2B_InvoiceDate__c","type":"to","valueLabel":"InvoiceDateTo","isDate":true}], ' +
			'"InvoiceDateFrom":[{"value":"' + Date.today().addDays(-1) + '","filterId":"InvoiceDateFrom","fieldDevName":"B2B_SellOut__r.B2B_InvoiceDate__c","type":"from","valueLabel":"InvoiceDateFrom","isDate":true}]}';

	public static String selectedFiltersForDocuments = '{"ReturnDateTo":[{"value":"' + Date.today().addDays(1) + '","filterId":"InvoiceDateTo","fieldDevName":"B2B_ReturnDate__c","type":"to","valueLabel":"ReturnDateTo","isDate":true}], ' +
			'"ReturnDateFrom":[{"value":"' + Date.today().addDays(-1) + '","filterId":"ReturnDateFrom","fieldDevName":"B2B_ReturnDate__c","type":"from","valueLabel":"ReturnDateFrom","isDate":true}]}';

	public static List<String> externalIdsLocalisation = new List<String>{
				'06CA'
	};

    public static List<String> returnDocumentNames = new List<String>{
				'AF-3532425','RN-3532426'
	};
	
	public static final Id testId = '0013N00000nkgDLQAY';

    public static String posStockTransferRequestBody = '{"posCodeOrigin":"ES100:102048","posCodeDestination":"102049","articleCode":"CRW5200013","quantity":8}';
    public static String posStockTransferRequestBodyWithNoQuantity = '{"posCodeOrigin":"ES100:102048","posCodeDestination":"102049","articleCode":"CRW5200013","quantity":0}';
    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method get the webstores that can be used in the test data setup
    * @date         2021-02-08
    * @return       List<WebStore>
    **************************************************************************************************************************************************************************/
    public static B2B_WebStore_XDomSel webStoreXDomSel{
        get{
            if(webStoreXDomSel == null)
            {
                webStoreXDomSel = B2B_WebStore_XDomSel.getNewInstance();
            }
            return webStoreXDomSel;
        }
        private set;
    }

    public static Id getDefaultWebstoreId
    {
        get
        {
            if(getDefaultWebstoreId == null)
            {
                getDefaultWebstoreId = webStoreXDomSel.webstoreIdByBrandId.get(webstoreExternalIds[0]);
            }
            return getDefaultWebstoreId;
        }
        private set;
    }

	public static Map<String,Account> endcustomersByLastName{
        get{
            if(endcustomersByLastName==null) {
                endcustomersByLastName = new Map<String,Account>();
				for(Account a: [Select Id,LastName from Account where isPersonAccount=true]){
					endcustomersByLastName.put(a.LastName,a);
				}
            }
            return endcustomersByLastName;
        }
        public set;
    }

	public static List<Account> endCustomers {
		get {
			if (endCustomers == null) {
				endCustomers = [SELECT Id, B2B_ExternalId__c FROM Account WHERE IsPersonAccount = TRUE ORDER BY LastName ASC];
			}
			return endCustomers;
		}
		private set;
	}

	public static List<B2B_POSLocation__c> posLocations {
		get {
			posLocations = [SELECT Id, B2B_LocationCountry__c, B2B_City__c, B2B_PostalCode__c, B2B_StreetName__c, B2B_StreetNumber__c FROM B2B_POSLocation__c];
			return posLocations;
		}
		private set;
	}

	public static String orgCommunityDomain {
		get{
			if(orgCommunityDomain==null) {
				orgCommunityDomain = [SELECT Domain FROM Domain WHERE HttpsOption = 'Community' AND Id IN (SELECT DomainId FROM DomainSite) LIMIT 1][0].Domain;
			}
			return orgCommunityDomain;
		}
		public set;
	}

	public static Map<String,User> usersByUsername{
        get{
            if(usersByUsername==null) {
                usersByUsername = new Map<String,User>();
                List<User> usersList = [Select Id, Name, username, ContactId from User];
				for (User u : usersList) {
					usersByUsername.put(u.username, u);
				}
            }
            return usersByUsername;
        }
        public set;
    }
	// List<Account> posList = [SELECT id,Parent.Name, B2B_Maison__c FROM Account WHERE Parent.Name =:'Chain - Bucherer AG'];
	public static Map<String,List<Account>> accountByParentExternalId{
        get{
            if(accountByParentExternalId==null) {
                accountByParentExternalId = new Map<String,List<Account>>();
                List<Account> accountList = [Select Id, Parent.B2B_ExternalId__c, B2B_Maison__c from Account];
				for (Account u : accountList) {
					if (!accountByParentExternalId.containsKey(u.Parent.B2B_ExternalId__c)) {
						accountByParentExternalId.put(u.Parent.B2B_ExternalId__c, new List<Account>());
					}
					accountByParentExternalId.get(u.Parent.B2B_ExternalId__c).add(u);
				}
            }
            return accountByParentExternalId;
        }
        public set;
    }

    public static List<Account> effectiveAccounts{
        get{
            if(effectiveAccounts==null) {
                effectiveAccounts = new List<Account>();
                effectiveAccounts = B2B_Account_Sel.getAccountsByExternalId(new List<String>{B2B_UTL_DataFactory.brandedPOSExternalIds[0]});
            }
            return effectiveAccounts;
        }
        public set;
    }

    public static List<Product2> products{
        get{
            if(products==null) {
                products = new List<Product2>();
                products = [Select Id,Type, B2B_Maison__c from Product2];
            }
            return products;
        }
        public set;
    }

	  public static Map<String, Product2> productBySkus{
        get{
            if(productBySkus==null) {
                productBySkus = new Map<String, Product2>();
                List<Product2> products = [Select Id, B2B_WarehouseStock_CA__c, B2B_WarehouseStock_MB__c, B2B_CfsEligibility_CA__c, B2B_CfsEligibility_MB__c, B2B_GlobalReference__c from Product2];
				for (Product2 p : products) {
					productBySkus.put(p.B2B_GlobalReference__c, p);
				}
			}
            return productBySkus;
        }
        public set;
    }

    public static List<WebCart> carts{
        get{
            if(carts==null) {
                carts = new List<WebCart>();
                carts = [Select Id from WebCart];
            }
            return carts;
        }
        public set;
    }

    public static List<CartItem> cartItems{
        get{
            if(cartItems==null) {
                cartItems = new List<CartItem>();
                cartItems = [Select Id,CartDeliveryGroupId from CartItem];
            }
            return cartItems;
        }
        public set;
    }

    public static List<CartDeliveryGroup> cartDeliveryGroups{
        get{
            if(cartDeliveryGroups==null) {
                cartDeliveryGroups = new List<CartDeliveryGroup>();
                cartDeliveryGroups = [Select Id, CartId from CartDeliveryGroup];
            }
            return cartDeliveryGroups;
        }
        public set;
    }

    public static List<Order> orders{
        get{
            if(orders==null) {
                orders = new List<Order>();
                orders = [Select Id, AccountId, Account.B2B_Maison__c from Order WHERE PoNumber = 'PO-0000123'];
            }
            return orders;
        }
        public set;
    }

    public static List<OrderItem> orderItems {
        get {
            if (orderItems == null) {
                orderItems = new List<OrderItem>();
                orderItems = [SELECT OrderId FROM OrderItem];
            }
            return orderItems;
        }
        public set;
    }

    public static List<OrderDeliveryMethod> orderDeliveryMethods{
        get{
            if(orderDeliveryMethods==null) {
                orderDeliveryMethods = new List<OrderDeliveryMethod>();
                orderDeliveryMethods = [Select Id from OrderDeliveryMethod];
            }
            return orderDeliveryMethods;
        }
        public set;
    }
    public static List<PricebookEntry> pricebookEntries {
        get {
            if (pricebookEntries == null) {
                pricebookEntries = new List<PricebookEntry>();
                pricebookEntries = [Select Id, Name, Pricebook2Id, PriceBook2.Name from PricebookEntry];
            }
            return pricebookEntries;
        }
        public set;
    }

    public static List<B2B_CheckoutSettings__c> checkoutSettings {
        get {
            if (checkoutSettings == null) {
                checkoutSettings = new List<B2B_CheckoutSettings__c>();
                checkoutSettings = [Select Id from B2B_CheckoutSettings__c];
            }
            return checkoutSettings;
        }
        public set;
    }

	public static List<B2B_ProductSettings__c> productSettings {
        get {
            if (productSettings == null) {
                productSettings = new List<B2B_ProductSettings__c>();
                productSettings = [Select Id from B2B_ProductSettings__c];
            }
            return productSettings;
        }
        public set;
    }

    public static List<B2B_Localisation__c> localisations {
        get {
            if (localisations == null) {
                localisations = new List<B2B_Localisation__c>();
                localisations = [Select Id, B2B_Maison__c, B2B_LocalisationLevel__c, B2B_ExternalId__c from B2B_Localisation__c];
            }
            return localisations;
        }
        public set;
    }

	public static Map<String, Account> accountsByExternalId {
		get {
			if(accountsByExternalId==null) {
                accountsByExternalId = new Map<String,Account>();
                List<Account> accountList = [Select Id, B2B_POSCode__c, B2B_RecordTypeDevName__c, ShippingCity,
                        ShippingCountry, ShippingCountryCode, ShippingStateCode, ShippingPostalCode, ShippingState, ShippingStreet, Website,
                        B2B_TotalMaisonCommercialSurface__c, B2B_WatchesCommercialArea__c, B2B_ExternalId__c, B2B_Maison__c,
                        B2B_SharedStockLocation__c, Name, B2B_GlobalNetwork__c, B2B_OpeningDate__c, B2B_ClosingDate__c, 
						B2B_MallDeptStoreUnitNumber__c, B2B_FloorNumber__c, B2B_GPSLatitude__c, 
						B2B_GPSLongitude__c, B2B_LastVisitDate__c, B2B_SocialMedia__c, B2B_POSLegacyToBeDisplayed__c, 
						B2B_DistributionChannel__c, B2B_OpeningStatusStoreLife__c, B2B_TimeVallee__c, B2B_EPartnerProgram__c, 
						B2B_EPartnerLaunchDate__c, B2B_EPartnerScoring__c, B2B_GoogleBusiness__c, B2B_SEO__c, B2B_SubMarket__c
                    from Account];
				for (Account a : accountList) {
					accountsByExternalId.put(a.B2B_ExternalId__c, a);
				}
            }
            return accountsByExternalId;
		}
		public set;
	}

    public static List<B2B_ClickFromStorePOSEligibility__c> cfsStorePOSEligibilities {
        get {
            if (cfsStorePOSEligibilities == null) {
                cfsStorePOSEligibilities = new List<B2B_ClickFromStorePOSEligibility__c>();
                cfsStorePOSEligibilities = [Select Id, B2B_BrandedPOS__c, B2B_BusinessUnit__r.B2B_ExternalId__c, B2B_EligibleForClickFromStore__c, B2B_Maison__c, B2B_POSType__c
                                            from B2B_ClickFromStorePOSEligibility__c];
            }
            return cfsStorePOSEligibilities;
        }
        public set;
    }

    public static List<B2B_WR_AssortmentInput> assortmentCreation {
        get{
            if(assortmentCreation == null) {
                String assortmentCreationString = '[{"name": "Assortment PI/02/06PI/102048","articleCode": "UT-CRWM505010","quantity": 5,"autoReplenishment": false}, {"name": "Assortment PI/02/06PI/102048","articleCode": "UT-CRW5200013","quantity": 3,"autoReplenishment": true}]';
                assortmentCreation = (List<B2B_WR_AssortmentInput>) JSON.deserialize(assortmentCreationString, List<B2B_WR_AssortmentInput>.class);
            }
            return assortmentCreation;
        }
        public set;
    }

    public static B2B_WR_AssortmentRequestParameters requestParameters {
        get{
            if(requestParameters == null) {
                String requestParametersString = '{"brandId": "CA", "salesOrg": "06CA", "posCode": "102048"}';
                requestParameters = (B2B_WR_AssortmentRequestParameters) JSON.deserialize(requestParametersString, B2B_WR_AssortmentRequestParameters.class);
            }
            return requestParameters;
        }
        public set;
    }

    public static B2B_WR_Sellout.B2B_WR_SelloutInner selloutNotification {
        get{
            if(selloutNotification == null) {
                String selloutNotificationString = '{"erpSystem": "UT101", "brand": "CAR", "posCode": "UT100:102048:CA", "documentNumber": "123456", "documentDate": "2021-03-21", "saleRepresentativeEmails": [""],' +
                        '"saleId": "123456789", "customerId": "", "selloutItems": [{"articleCode": "UT-CRW5200013", "serialNumber": "123456", "quantity": 1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "12345"},' +
                        '{"articleCode": "UT-CRWM505010", "serialNumber": "1234567", "quantity": 1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "654321"}]}';
                selloutNotification = (B2B_WR_Sellout.B2B_WR_SelloutInner) JSON.deserialize(selloutNotificationString, B2B_WR_Sellout.B2B_WR_SelloutInner.class);
            }
            return selloutNotification;
        }
        public set;
	}

	public static B2B_WR_Sellout.B2B_WR_SelloutInner returnSelloutNotification {
        get{
            if(returnSelloutNotification == null) {
                String returnSelloutNotificationString = '{"erpSystem": "UT101", "brand": "CAR", "posCode": "UT100:102048:CA", "documentNumber": "1234567", "documentDate": "2021-03-22", "saleRepresentativeEmails": [""],' +
                        '"saleId": "1234567891", "customerId": "", "selloutItems": [{"articleCode": "UT-CRW5200013", "serialNumber": "123456", "quantity": -1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "123451", "originalSaleDetailId": "12345"}]}';
				returnSelloutNotification = (B2B_WR_Sellout.B2B_WR_SelloutInner) JSON.deserialize(returnSelloutNotificationString, B2B_WR_Sellout.B2B_WR_SelloutInner.class);
            }
            return returnSelloutNotification;
        }
        public set;
	}

	public static B2B_WR_Sellout.B2B_WR_SelloutInner deleteSellOutItemNotification {
        get{
            if(deleteSellOutItemNotification == null) {
                String deleteSellOutItemNotificationString = '{"erpSystem": "UT101", "brand": "CAR", "posCode": "UT100:102048:CA", "documentNumber": "123456", "documentDate": "2021-03-21", "saleRepresentativeEmails": [""],' +
                        '"saleId": "123456789", "customerId": "", "selloutItems": [{"articleCode": "UT-CRW5200013", "serialNumber": "123456", "quantity": 1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "12345"}]}';
				deleteSellOutItemNotification = (B2B_WR_Sellout.B2B_WR_SelloutInner) JSON.deserialize(deleteSellOutItemNotificationString, B2B_WR_Sellout.B2B_WR_SelloutInner.class);
            }
            return deleteSellOutItemNotification;
        }
        public set;
	}

	public static B2B_WR_Sellout.B2B_WR_SelloutInner deleteSellOutNotification {
        get{
            if(deleteSellOutNotification == null) {
                String deleteSellOutNotificationString = '{"erpSystem": "", "brand": "", "posCode": "", "documentNumber": "", "documentDate": "", "saleRepresentativeEmails": [""],' +
                        '"saleId": "123456789", "customerId": "", "selloutItems": null}';
						deleteSellOutNotification = (B2B_WR_Sellout.B2B_WR_SelloutInner) JSON.deserialize(deleteSellOutNotificationString, B2B_WR_Sellout.B2B_WR_SelloutInner.class);
            }
            return deleteSellOutNotification;
        }
        public set;
    }

    public static B2B_WR_Sellout.B2B_WR_SelloutInner selloutNotificationError {
        get{
            if(selloutNotificationError == null) {
                String selloutNotificationString = '{"erpSystem": "UT101", "brand": "CAR", "posCode": "UT100:102048:CA", "documentNumber": "123456", "documentDate": "2021-03-21", "saleRepresentativeEmails": [""],' +
                        '"saleId": "123456789", "customerId": "", "selloutItems": [{"articleCode": "BAB", "serialNumber": "123456", "quantity": 1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "12345"},' +
                        '{"articleCode": "BIB", "serialNumber": "1234567", "quantity": 1, "unitPrice": {"currencyIsoCode": "EUR", "value": 12999.99}, "saleDetailId": "654321"}]}';
                selloutNotificationError = (B2B_WR_Sellout.B2B_WR_SelloutInner) JSON.deserialize(selloutNotificationString, B2B_WR_Sellout.B2B_WR_SelloutInner.class);
            }
            return selloutNotificationError;
        }
        public set;
    }

    public static B2B_WR_SalesOrderNotificationRequest orderNotification {
        get{
            if(orderNotification == null) {
                String orderNotificationString = '{"orderIdERP": "201875946","erpSystem": "UT101","orderIdB2B": "B2B","shipToPosCode": "UT100:102048","brand": "CAR","reasonCode": "Y00","customerReference": "PO12345","source": "ERP","orderDate": "2021-03-23","notes": "Comment field",' +
                        '"shipTo": {"id": "4567890","name": "Matteo San A","type": "Ship To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},' +
                        '"salesRepresentative": {"id": "4567890","name": "Matteo San","country": "","city": "","postalCode": "","state": "","street": ""},"billTo": {"id": "4567890","name": "Matteo San B","type": "Bill To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},' +
                        '"soldTo": {"id": "4567890","name": "Matteo San C","type": "Sold To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},"orderItems": [{"lineNumber": "20","articleCode": "UT-CRW5200013",' +
                        '"quantity": "2","orderItemStatus": "B","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}},{"lineNumber": "40","articleCode": "UT-CRWM505010","quantity": "4","orderItemStatus": "C","unitNetAmount": {"currencyIsoCode": "EUR","value": 15000.00}}]}';
                orderNotification = (B2B_WR_SalesOrderNotificationRequest) JSON.deserialize(orderNotificationString, B2B_WR_SalesOrderNotificationRequest.class);
            }
            return orderNotification;
        }
        public set;
    }

	public static B2B_WR_SalesOrderNotificationRequest WCFSOrderNotification {
		get{
			if(WCFSOrderNotification == null) {
                String orderNotificationString = '{"source":"BOO2","shipToPosCode":"UT100:102048","reasonCode":"Y00","orderIdERP":"203472144","orderIdB2B":"00000151","orderDate":"2021-08-17","notes":null,"erpSystem":"ES100","customerReference":null,"brand":"CAR","orderType": "WCFS", "endCustomerBooster1Id": "blibableauzdsjal", "endCustomerDetails": {"title": "Mr.","firstName": "Lennart","lastName": "Schelfhout","email": "lennart@schelfhout.com","phone": "0032494781300","street": "aarbeienlaan","houseNumber": "123","building": "Appartment","additionalInfo": "some additional info","city": "Kowloon","postalCode": "","region": "LU","district": "LU","country": "Hong Kong"}, "shipTo": {"id": "4567890","name": "Matteo San A","type": "Ship To","country": "Hong Kong","city": "Kowloon","postalCode": "","state": "Vlaams-Brabant","street": "Rue de la gare"},"salesRepresentative": {"id": "4567890","name": "Matteo San","country": "Hong Kong","city": "Kowloon","postalCode": "","state": "","street": ""},"billTo": {"id": "4567890","name": "Matteo San B","type": "Bill To","country": "Hong Kong","city": "Kowloon","postalCode": "","state": "Vlaams-Brabant","street": "Rue de la gare"},"soldTo": {"id": "4567890","name": "Matteo San C","type": "Sold To","country": "Hong Kong","city": "Kowloon","postalCode": "","state": "Vlaams-Brabant","street": "Rue de la gare"},"orderItems": [{"lineNumber": "20","articleCode": "UT-CRW5200013","quantity": "2","orderItemStatus": "B","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}},{"lineNumber": "40","articleCode": "UT-CRWM505010","quantity": "4","orderItemStatus": "C","unitNetAmount": {"currencyIsoCode": "EUR","value": 15000.00}}]}';
                WCFSOrderNotification = (B2B_WR_SalesOrderNotificationRequest) JSON.deserialize(orderNotificationString, B2B_WR_SalesOrderNotificationRequest.class);
			}
			return WCFSOrderNotification;
		}
		public set;
	}

    public static B2B_WR_SalesOrderNotificationRequest orderNotificationError {
        get{
            if(orderNotificationError == null) {
                String orderNotificationString = '{"orderIdERP": "201875946","erpSystem": "UT101","orderIdB2B": "B2B","shipToPosCode": "UT100:102048","brand": "CAR","reasonCode": "Y00","customerReference": "PO12345","source": "ERP","orderDate": "2021-03-23","notes": "Comment field",' +
                        '"shipTo": {"id": "4567890","name": "Matteo San A","type": "Ship To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},' +
                        '"salesRepresentative": {"id": "4567890","name": "Matteo San","country": "","city": "","postalCode": "","state": "","street": ""},"billTo": {"id": "4567890","name": "Matteo San B","type": "Bill To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},' +
                        '"soldTo": {"id": "4567890","name": "Matteo San C","type": "Sold To","country": "Belgium","city": "Brussels","postalCode": "1000","state": "Vlaams-Brabant","street": "Rue de la gare"},"orderItems": [{"lineNumber": "20","articleCode": "UT-CRW5200013",' +
                        '"quantity": null,"orderItemStatus": "B","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}},{"lineNumber": "40","articleCode": "UT-CRWM505010","quantity": "4","orderItemStatus": "C","unitNetAmount": {"currencyIsoCode": "EUR","value": 15000.00}}]}';
                orderNotificationError = (B2B_WR_SalesOrderNotificationRequest) JSON.deserialize(orderNotificationString, B2B_WR_SalesOrderNotificationRequest.class);
            }
            return orderNotificationError;
        }
        public set;
    }

    public static B2B_WR_GoodsIssueNotificationRequest deliveryNote {
        get{
            if(deliveryNote == null) {
                String deliveryNoteString = '{"deliveryNoteId":"7031369733","erpSystem":"UT101","deliveryNoteDate":"2021-04-15","shipToPosCode":"UT101:102048","brand":"CAR","trackingInfo":{"url":"https://www.ric.com/tracking?oid=123456","trackingNumber":"123456","carrier":"DHL"},' +
                        '"deliveryItems":[{"deliveryItemId":"9000001","orderItem":{"orderIdERP":"201875946","lineNumber":20,"articleCode":"CRWJBB0033","strapSpeakingReference":"aDescribingCode","orderDate":"2021-03-25","unitNetAmount":{"currencyIsoCode":"EUR","value":12999.99}},"deliveredQuantity":3,' +
                        '"parentDeliveryNote":{"deliveryNoteId":"7031369799","deliveryNoteDate":"2021-04-23","deliveryItemId":"9000001"},"consignment":false,"sellable":true,"serialNumbers":["3682100129AX","3682100229AX","3682100329AX"]}]}';
                deliveryNote = (B2B_WR_GoodsIssueNotificationRequest) JSON.deserialize(deliveryNoteString, B2B_WR_GoodsIssueNotificationRequest.class);
            }
            return deliveryNote;
        }
        public set;
    }

	public static List<Account> doors {
		get {
			if (doors == null) {
				doors = [SELECT Id FROM Account WHERE B2B_RecordTypeDevName__c = 'B2B_Door'];
			}

			return doors;
		}	
		private set;
	}

    public static B2B_WR_OrderDocumentIdsRequest document {
        get{
            if(document == null) {
                String documentString = '{"documentId":"70313697312","documentType":"invoice/creditNote","documentDate":"2021-04-22","erpSystem":"UT101","shipToPosCode":"UT101:102048","brand":"CAR","documentItems":[{"documentItemId":"10","documentQuantity":3,"orderItem":{"orderIdERP":"201875946","deliveryNoteId":"7031369733","articleCode":"CRWJBB0033","strapSpeakingReference":"aDescribingCode","lineNumber":20,"orderDate":"2021-03-25","unitNetAmount":{"currencyIsoCode":"EUR","value":12999.99}},"consignment":false},{"documentItemId":"20","documentQuantity":2,"orderItem":{"orderIdERP":"201875946","deliveryNoteId":"7031369733","articleCode":"CRWJBB0099","strapSpeakingReference":"aDescribingCode","lineNumber":20,"orderDate":"2021-03-25","unitNetAmount":{"currencyIsoCode":"EUR","value":15999.99}},"consignment":true}]}';
                document = (B2B_WR_OrderDocumentIdsRequest) JSON.deserialize(documentString, B2B_WR_OrderDocumentIdsRequest.class);
            }
            return document;
        }
        public set;
    }

	public static List<B2B_OrderDeliveryItem__c> orderDeliveryItems {
		get{
			if(orderDeliveryItems == null) {
				orderDeliveryItems = new List<B2B_OrderDeliveryItem__c>();
				orderDeliveryItems = [SELECT Id, B2B_Status__c FROM B2B_OrderDeliveryItem__c];
			}
			return orderDeliveryItems;
		}
		public set;
	}

    public static List<B2B_POSCluster__c> posClusters {
        get {
            if(posClusters == null) {
                posClusters = new List<B2B_POSCluster__c>();
                posClusters = [Select Id, Name from B2B_POSCluster__c];
            }
            return posClusters;
        }
        public set;
    }

    public static B2B_UTL_AuthToken mockAuthToken(DateTime expTime, Map<String, String> refreshResult) {
        return (B2B_UTL_AuthToken) Test.createStub(B2B_UTL_AuthToken.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getAccessToken' => generateJwtWithExpirationDateTime(expTime),
                'refreshAccessToken' => refreshResult
        }));
	}

	public static B2B_UTL_Booster1Authentication mockBooster1Auth() {
		return (B2B_UTL_Booster1Authentication) Test.createStub(B2B_UTL_Booster1Authentication.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'getAccessToken' => 'access token'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeUpdate() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => 'Sellout has been updated'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeDelete() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => 'Sellout has been deleted'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeKOApplicative() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => new INT_Swagger.ApiException(400, 'BadRequest', new Map<String, String>(), '{ "responseStatus": { "errorCode": "BadRequest", "message": "1 or more errors were returned during your request, please check the errors list", "errors": [{ "errorCode": "123", "message": "The reference WB520004 with the serial number 3064458155XX is not in the stock"}]}}', null)
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeKOBadRequest() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => new INT_Swagger.ApiException(300, 'BadRequest', new Map<String, String>(), '{ "responseStatus": { "errorCode": "BadRequest", "message": "Bad request", "errors": [{ "errorCode": "123", "message": "Test error"}]}}', null)
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeDeleteEndCustomer() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => 'Customer has been deleted'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeCreateEndCustomer() {
		Map<String, Object> responseMap = new Map<String, Object>{
			'boosterCustomerId' => 1173407
		};
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.serialize(responseMap)
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeProductPicklists() {
		String jsonString = '{"size": 1,"totalSize": 1,"records": [{"attributes": {"type": "CustomField","url": "/services/data/v52.0/tooling/sobjects/CustomField/00N7Y000008Z877UAC"},"Id": "00N7Y000008Z877UAC","DeveloperName": "B2B_Status"}]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => jsonString
		}));
	}

	public static INT_SwagClient mockSwagClientInvokePicklistsDefinition() {
		String jsonString = '{"Id": "00N7Y000008Z877UAC","DeveloperName": "B2B_Status","Metadata": {"label": "Status","valueSet": {"valueSetDefinition": {"value": [{"label": "In Transit","valueName": "I"}]}},"visibleLines": null},"FullName": "Product2.B2B_Status__c"}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => jsonString
		}));
	}

    public static INT_SwagClient mockSwagClientInvokeConsignedTransferHistory() {
        String jsonString = '[{"transferRequestId":"xyz12345","status":"PEN","createdDate":"2021-12-06","posCodeFrom":"UT100:102048","posCodeTo":"UT100:POS_Account_1","articleCode":"UT-CRW5200013","quantity":2},{"transferRequestId":"abc12345","status":"COM","createdDate":"2021-12-03","posCodeFrom":"UT100:102048","posCodeTo":"UT100:102040","articleCode":"UT-CRWM505010","serialNumber":"1234567","quantity":1},{"transferRequestId":"abc12346","status":"REJ","createdDate":"2021-12-03","posCodeFrom":"UT100:102040","posCodeTo":"UT100:102048","articleCode":"UT-MBB3041200","serialNumber":"123456","quantity":1}]';
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => (List<B2B_WR_ConsignedTransferRequest>) JSON.deserialize(jsonString, List<B2B_WR_ConsignedTransferRequest>.class)
        }));
    }

    public static INT_SwagClient mockSwagClientInvokeUpdateConsignedTransfer() {
        String jsonString = 'Created';
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => jsonString
        }));
    }

	public static INT_SwagClient mockOpenOrdersOK() {
		String jsonString = '{"page":1,"items":100,"totalPages":5,"totalResults":485,"elements":[{"posCode":"ES100:123","posCodeToBeDisplayed":"123","erpOrderId":"12365","lineNumber":20,"orderDate":"2022-03-05","originOrderId":"BOO2-123","articleCode":"W123456","orderedQuantity":5,"openQuantity":3,"status":"B","netAmount":{"value":125.85,"currency":"EUR"},"customerReference":"cutomer PO free text","speakingArticleCode":"KD852554","expectedDeliveryDate":"2022-03-30","isStrapVipOrder":false,"orderType":"B2BCON"}]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(jsonString, B2B_WR_OpenOrdersResponse.class)
		}));
	}

	public static INT_SwagClient mockOpenOrdersOKNoOrders() {
		String jsonString = '{"page":1,"items":100,"totalPages":1,"totalResults":0,"elements":[]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(jsonString, B2B_WR_OpenOrdersResponse.class)
		}));
	}

	public static INT_SwagClient mockOpenOrdersOKNoOrderItem() {
		String jsonString = '{"page": 1,"items": 100,"totalPages": 1,"totalResults": 1,"elements": [{"posCode": "UT100:102048","posCodeToBeDisplayed": "102048","erpOrderId": "201875946","lineNumber": 20,"orderDate": "2022-03-05","originOrderId": "BOO2-123","articleCode": "' + productSKUs[0] + '","orderedQuantity": 10,"openQuantity": 7,"status": "B","netAmount": {"value": 125.85,"currency": "EUR"},"customerReference": "cutomer PO free text","speakingArticleCode": "KD852554","expectedDeliveryDate": "2022-03-30","isStrapVipOrder": false,"orderType": "B2BCON"}]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(jsonString, B2B_WR_OpenOrdersResponse.class)
		}));
	}

	public static INT_SwagClient mockOpenOrdersOKOrderItemLowerQtyOK() {
		String jsonString = '{"page": 1,"items": 100,"totalPages": 1,"totalResults": 1,"elements": [{"posCode": "UT100:102048","posCodeToBeDisplayed": "102048","erpOrderId": "201875946","lineNumber": 20,"orderDate": "2022-03-05","originOrderId": "BOO2-123","articleCode": "' + productSKUs[0] + '","orderedQuantity": 8,"openQuantity": 7,"status": "B","netAmount": {"value": 125.85,"currency": "EUR"},"customerReference": "cutomer PO free text","speakingArticleCode": "KD852554","expectedDeliveryDate": "2022-03-30","isStrapVipOrder": false,"orderType": "B2BCON"}]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(jsonString, B2B_WR_OpenOrdersResponse.class)
		}));
	}

	public static INT_SwagClient mockOpenOrdersOKOrderItemHigherQtyKO() {
		String jsonString = '{"page": 1,"items": 100,"totalPages": 1,"totalResults": 1,"elements": [{"posCode": "UT100:102048","posCodeToBeDisplayed": "102048","erpOrderId": "201875946","lineNumber": 20,"orderDate": "2022-03-05","originOrderId": "BOO2-123","articleCode": "' + productSKUs[0] + '","orderedQuantity": 12,"openQuantity": 7,"status": "B","netAmount": {"value": 125.85,"currency": "EUR"},"customerReference": "cutomer PO free text","speakingArticleCode": "KD852554","expectedDeliveryDate": "2022-03-30","isStrapVipOrder": false,"orderType": "B2BCON"}]}';
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(jsonString, B2B_WR_OpenOrdersResponse.class)
		}));
	}

	public static INT_SwagClient mockOpenOrdersKO() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => new INT_Swagger.ApiException(400, 'BadRequest', new Map<String, String>(), '{}', null)
		}));
	}

    public static String generateJwtWithExpirationDateTime(DateTime expTime) {
        B2B_WR_AzureJWT.Payload payload = new B2B_WR_AzureJWT.Payload();
        payload.sub = 'fake-sub';
        payload.email = 'fake-email';
        payload.exp = (expTime.getTime() / 1000.0).intValue();
        return EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(new Map<String, Object>{'typ' => 'JWT'}))) + '.' + EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(payload))) + '.signature';
    }

	public static String generateJwtWithClaimsOK(String kid, String issuer, String audience, String azp, String email) {
		Integer now = (Datetime.now().getTime() / 1000).intValue();
		B2B_WR_AzureJWT.Payload payload = new B2B_WR_AzureJWT.Payload();
		payload.nbf = now - 70;
		payload.iat = now - 5;
		payload.exp = now + 180;
		payload.iss = issuer;
		payload.aud = audience;
		payload.azp = azp;
		payload.email = email;
		B2B_WR_AzureJWT.Header header = new B2B_WR_AzureJWT.Header();
		header.type = 'JWT';
		header.alg = 'RS256';
		header.kid = kid;
		return EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(header))) + '.' + EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(payload))) + '.signature';
	}

	public static String generateJwtWithClaimsKO(String koType, String kid, String issuer, String audience, String azp) {
		Integer now = (Datetime.now().getTime() / 1000).intValue();
		B2B_WR_AzureJWT.Payload payload = new B2B_WR_AzureJWT.Payload();
		payload.nbf = koType == 'nbf' ? now + 180 : now - 70;
		payload.iat = koType == 'iat' ? now + 180 : now - 5;
		payload.exp = koType == 'exp' ? now - 180 : now + 180;
		payload.iss = issuer;
		payload.aud = audience;
		payload.azp = azp;
		B2B_WR_AzureJWT.Header header = new B2B_WR_AzureJWT.Header();
		header.type = 'JWT';
		header.alg = koType == 'alg' ? null : 'RS256';
		header.kid = kid;
		return EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(header))) + '.' + EncodingUtil.base64Encode(Blob.valueOf(JSON.serialize(payload))) + '.signature';
	}

    public static INT_SwagClient mockSwagNormEgonValidation() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getAuthentication' => B2B_AddressValidation_Srv.SWAG_CLIENT.getAuthentication('CustomHTTPHeadersAuth'),
                'invoke' => '{"SOG":[{"PAR":{"RAGSOC":"N","RGSRIC":"N","PARIVA":"N","CODFIS":"N","LIVFIS":"1","DATNAS":"N","LOCNAS":"N","DOCIDN":"N","INDRES":"S","LIVENOR":"2","ESTLPO":"N","EMAIL":"N","CNTTEL":"N","CNTCOD":"N","FLXZLM":"0","FLXCOM":"S","FLXMEM":"","CDXLST":"643","TIMSTP":"","CDXISO":"FRA","FLXCND":"N","FLXPTF":"S","INDCOO":"N","COOATL":"N","COONAV":"N","COODEF":"N","COOBES":"S","COOATT":"S","COOIDQ":"N","COOAPP":"S","MCZO91":"N","MCZO01":"N","MCZO11":"N","MCZAPP":"N","MCZPUN":"N","BESPRI":"A","NUMAPP":"99999","TPXMSU":"00001","FMTOUT":"C","LNGOUT":"","TPXOUT":"","WPUSER":"WPTC04RCMT02","WPPASW":"","__hashCodeCalc":false},"KII":{"__hashCodeCalc":false},"RGS_010":{"CDXISO":"ITA","TPXANA":"","FLXSEX":"","DSXFRENAM":"","DSXMIDNAM":"","DSXNOM":"","DSXTITACC":"","DSXPRENOM":"","DATNAS":"","TPXCDK":"","LOCNAS":{"DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIPNAS":"","__hashCodeCalc":false},"DOCIDN":{"DSXDATRIL":"","DSXDATNAS":"","DSXDATSCA":"","DSXPRORIL":"","DSXCOMRIL":"","TPXDOC":"","CDXDOC":"","DSXENTRIL":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_011":[{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false}],"INR_020":{"TP9IND":{"lValue":0},"TP9INDSOT":{"lValue":0},"CDXISO":"","TPXCDK":"","TPXTED":"","CDPLNG":{"lValue":0},"TPPOBJ":{"lValue":0},"CDPOBJ":{"lValue":0},"CDPCIV":{"lValue":0},"CDPPLC":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"DSXPLC":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"LYON","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIP":"","DSXST1":{"DSXDUG":"","DSXVIA":"RUE VOLTAIRE","NRPNUMCIV":{"lValue":0},"DSXESP":"2","__hashCodeCalc":false},"DSXST2":{"DSXDUG":"","DSXVIA":"","NRPNUMCIV":{"lValue":0},"DSXESP":"","__hashCodeCalc":false},"DSXPREINR":"","DSXBLD":"","DSXSUBBLD":"","DSXCPNINR":"","__hashCodeCalc":false},"TEL_035":{"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"TELUNI":{"CDXISOUNI":"","TELUNI":"","__hashCodeCalc":false},"__hashCodeCalc":false},"KIO":{"FLXDOP":"0","ELECLI":{"__hashCodeCalc":false},"__hashCodeCalc":false},"RGS_610":{"CDXISO":"","TPXANA":"6","FLXSEX":"0","DSXFRENAM":"","DSXCOG":"","DSXMIDNAM":"","DSXNOM":"","DSXSUFNAM":"","DSXTITACC":"","CDPTITACC":{"lValue":0},"DSXTITAC2":"","CDPTITAC2":{"lValue":0},"DSXFRENAMABB":"","DSXNOMABB":"","DSXGIUUFF":"","DSXGIUABB":"","CDPSPEGIU":{"lValue":0},"DATNAS":"","DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCNAS":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"ALTRO":{"DSXPRENOM":"","CDXMATCOD":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_611":[{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false}],"INR_620":{"TP9IND":{"lValue":1},"TP9INDSOT":{"lValue":1},"CDXISO":"FRA","DSXPLCUFF":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCUSR":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCABB":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCSIG":{"DSXCNY":"FRA","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCOBJ":{"CDPCNY":{"lValue":25000000001},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":25000000136},"CDPDPT":{"lValue":25000000102},"CDPCNL":{"lValue":25000127825},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"CDXPLCOBJ":{"CDXCNY":"FRNC 05","CDXSTA":"","CDXREG":"VRGNRNL18","CDXDPT":"RNO 04","CDXCNL":"LNIO 04","CDXDS1":"","CDXDS2":"","CDXDS3":"","__hashCodeCalc":false},"CDXSTAPLCOBJ":{"CDXREG":"84","CDXDPT":"69","CDXCNL":"69123","__hashCodeCalc":false},"FLXPLCOBJ":{"__hashCodeCalc":false},"LNGPLCCNY":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":250},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCSTA":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCREG":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDPT":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCCNL":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS3":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"MRE":{"TPPOBJMRE":{"lValue":0},"CDPOBJMRE":{"lValue":0},"LNGMRE":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"__hashCodeCalc":false},"TPPOBJPLC":{"lValue":0},"TPPOBJSTR":{"lValue":0},"CDXZIP":"69003","DSXUNIROW":"2 Rue Voltaire, Lyon, Rhône, Auvergne-Rhône-Alpes, 69003, France","DSXSTRUFF":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRUSR":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRABB":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"CDPSTRST1":{"CDPSTR":{"lValue":25002081366},"CDPDUG":{"lValue":34},"__hashCodeCalc":false},"CDPSTRST2":{"CDPSTR":{"lValue":0},"CDPDUG":{"lValue":0},"__hashCodeCalc":false},"CDXSTRST1":{"CDX":"RVLTR 10","__hashCodeCalc":false},"CDXSTRST2":{"CDX":"","__hashCodeCalc":false},"FLXSTRST1":{"__hashCodeCalc":false},"FLXSTRST2":{"__hashCodeCalc":false},"LNGSTRST1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGSTRST2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"CIVICOST1":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":2},"NRXNUMCIV":"2","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"CIVICOST2":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":0},"NRXNUMCIV":"","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"ALTRO":{"DSXCASPOS":"","DSXPREINR":"","DSXCPNINR":"","DSXEXTURB":"","CDXMATCOD":"2500012782525002081366000000002000000000","__hashCodeCalc":false},"DSXBLD":"","DSXSUBBLD":"","CDXSTA":[{"CDXISO":"FRA","TPXCOD":"50137","DSXCOD":"Rhône","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false},{"CDXISO":"FRA","TPXCOD":"30029","DSXCOD":"6999","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false}],"DSXLPOUFF":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOUSR":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOABB":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOSIG":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPLPOOBJ":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"LNGLPO":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"TPPOBJLPO":{"lValue":0},"NR9CND":{"lValue":0},"INRCND":[{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false}],"__hashCodeCalc":false},"COO_626":{"__hashCodeCalc":false},"MCZ_627":{"__hashCodeCalc":false},"TEL_635":{"NRZELE":{"lValue":0},"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"NOTE":"","__hashCodeCalc":false},"PTF":{"ROW1":"","ROW2":"","ROW3":"","ROW4":"2 RUE VOLTAIRE","ROW5":"","ROW6":"69003 LYON","ROW7":"FRANCE","__hashCodeCalc":false},"SEG":{"ERR_610_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_611_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_620_ELE":{"ERR_620":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"2","CDPSEG":{"lValue":501},"DSXSEG":"House Number not found","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false}],"__hashCodeCalc":false},"ERR_GEO_ELE":[{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false}],"ERR_635_ELE":[{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_PTF_ELE":{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false},"__hashCodeCalc":false}],"ERR":{"WP9STC":{"lValue":0},"DSXERR":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false}'
        }));
    }

	public static INT_SwagClient mockSwagNormEgonValidationKOLocality() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getAuthentication' => B2B_AddressValidation_Srv.SWAG_CLIENT.getAuthentication('CustomHTTPHeadersAuth'),
                'invoke' => '{"SOG":[{"PAR":{"RAGSOC":"N","RGSRIC":"N","PARIVA":"N","CODFIS":"N","LIVFIS":"1","DATNAS":"N","LOCNAS":"N","DOCIDN":"N","INDRES":"S","LIVENOR":"2","ESTLPO":"N","EMAIL":"N","CNTTEL":"N","CNTCOD":"N","FLXZLM":"0","FLXCOM":"S","FLXMEM":"","CDXLST":"643","TIMSTP":"","CDXISO":"FRA","FLXCND":"N","FLXPTF":"S","INDCOO":"N","COOATL":"N","COONAV":"N","COODEF":"N","COOBES":"S","COOATT":"S","COOIDQ":"N","COOAPP":"S","MCZO91":"N","MCZO01":"N","MCZO11":"N","MCZAPP":"N","MCZPUN":"N","BESPRI":"A","NUMAPP":"99999","TPXMSU":"00001","FMTOUT":"C","LNGOUT":"","TPXOUT":"","WPUSER":"WPTC04RCMT02","WPPASW":"","__hashCodeCalc":false},"KII":{"__hashCodeCalc":false},"RGS_010":{"CDXISO":"ITA","TPXANA":"","FLXSEX":"","DSXFRENAM":"","DSXMIDNAM":"","DSXNOM":"","DSXTITACC":"","DSXPRENOM":"","DATNAS":"","TPXCDK":"","LOCNAS":{"DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIPNAS":"","__hashCodeCalc":false},"DOCIDN":{"DSXDATRIL":"","DSXDATNAS":"","DSXDATSCA":"","DSXPRORIL":"","DSXCOMRIL":"","TPXDOC":"","CDXDOC":"","DSXENTRIL":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_011":[{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false}],"INR_020":{"TP9IND":{"lValue":0},"TP9INDSOT":{"lValue":0},"CDXISO":"","TPXCDK":"","TPXTED":"","CDPLNG":{"lValue":0},"TPPOBJ":{"lValue":0},"CDPOBJ":{"lValue":0},"CDPCIV":{"lValue":0},"CDPPLC":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"DSXPLC":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"LYON","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIP":"","DSXST1":{"DSXDUG":"","DSXVIA":"RUE VOLTAIRE","NRPNUMCIV":{"lValue":0},"DSXESP":"2","__hashCodeCalc":false},"DSXST2":{"DSXDUG":"","DSXVIA":"","NRPNUMCIV":{"lValue":0},"DSXESP":"","__hashCodeCalc":false},"DSXPREINR":"","DSXBLD":"","DSXSUBBLD":"","DSXCPNINR":"","__hashCodeCalc":false},"TEL_035":{"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"TELUNI":{"CDXISOUNI":"","TELUNI":"","__hashCodeCalc":false},"__hashCodeCalc":false},"KIO":{"FLXDOP":"0","ELECLI":{"__hashCodeCalc":false},"__hashCodeCalc":false},"RGS_610":{"CDXISO":"","TPXANA":"6","FLXSEX":"0","DSXFRENAM":"","DSXCOG":"","DSXMIDNAM":"","DSXNOM":"","DSXSUFNAM":"","DSXTITACC":"","CDPTITACC":{"lValue":0},"DSXTITAC2":"","CDPTITAC2":{"lValue":0},"DSXFRENAMABB":"","DSXNOMABB":"","DSXGIUUFF":"","DSXGIUABB":"","CDPSPEGIU":{"lValue":0},"DATNAS":"","DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCNAS":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"ALTRO":{"DSXPRENOM":"","CDXMATCOD":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_611":[{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false}],"INR_620":{"TP9IND":{"lValue":1},"TP9INDSOT":{"lValue":1},"CDXISO":"FRA","DSXPLCUFF":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCUSR":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCABB":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCSIG":{"DSXCNY":"FRA","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCOBJ":{"CDPCNY":{"lValue":25000000001},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":25000000136},"CDPDPT":{"lValue":25000000102},"CDPCNL":{"lValue":25000127825},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"CDXPLCOBJ":{"CDXCNY":"FRNC 05","CDXSTA":"","CDXREG":"VRGNRNL18","CDXDPT":"RNO 04","CDXCNL":"LNIO 04","CDXDS1":"","CDXDS2":"","CDXDS3":"","__hashCodeCalc":false},"CDXSTAPLCOBJ":{"CDXREG":"84","CDXDPT":"69","CDXCNL":"69123","__hashCodeCalc":false},"FLXPLCOBJ":{"__hashCodeCalc":false},"LNGPLCCNY":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":250},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCSTA":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCREG":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDPT":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCCNL":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS3":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"MRE":{"TPPOBJMRE":{"lValue":0},"CDPOBJMRE":{"lValue":0},"LNGMRE":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"__hashCodeCalc":false},"TPPOBJPLC":{"lValue":0},"TPPOBJSTR":{"lValue":0},"CDXZIP":"69003","DSXUNIROW":"2 Rue Voltaire, Lyon, Rhône, Auvergne-Rhône-Alpes, 69003, France","DSXSTRUFF":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRUSR":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRABB":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"CDPSTRST1":{"CDPSTR":{"lValue":25002081366},"CDPDUG":{"lValue":34},"__hashCodeCalc":false},"CDPSTRST2":{"CDPSTR":{"lValue":0},"CDPDUG":{"lValue":0},"__hashCodeCalc":false},"CDXSTRST1":{"CDX":"RVLTR 10","__hashCodeCalc":false},"CDXSTRST2":{"CDX":"","__hashCodeCalc":false},"FLXSTRST1":{"__hashCodeCalc":false},"FLXSTRST2":{"__hashCodeCalc":false},"LNGSTRST1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGSTRST2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"CIVICOST1":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":2},"NRXNUMCIV":"2","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"CIVICOST2":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":0},"NRXNUMCIV":"","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"ALTRO":{"DSXCASPOS":"","DSXPREINR":"","DSXCPNINR":"","DSXEXTURB":"","CDXMATCOD":"2500012782525002081366000000002000000000","__hashCodeCalc":false},"DSXBLD":"","DSXSUBBLD":"","CDXSTA":[{"CDXISO":"FRA","TPXCOD":"50137","DSXCOD":"Rhône","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false},{"CDXISO":"FRA","TPXCOD":"30029","DSXCOD":"6999","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false}],"DSXLPOUFF":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOUSR":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOABB":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOSIG":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPLPOOBJ":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"LNGLPO":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"TPPOBJLPO":{"lValue":0},"NR9CND":{"lValue":0},"INRCND":[{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false}],"__hashCodeCalc":false},"COO_626":{"__hashCodeCalc":false},"MCZ_627":{"__hashCodeCalc":false},"TEL_635":{"NRZELE":{"lValue":0},"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"NOTE":"","__hashCodeCalc":false},"PTF":{"ROW1":"","ROW2":"","ROW3":"","ROW4":"2 RUE VOLTAIRE","ROW5":"","ROW6":"69003 LYON","ROW7":"FRANCE","__hashCodeCalc":false},"SEG":{"ERR_610_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_611_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_620_ELE":{"ERR_620":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"2","CDPSEG":{"lValue":202},"DSXSEG":"Locality not found","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false}],"__hashCodeCalc":false},"ERR_GEO_ELE":[{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false}],"ERR_635_ELE":[{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_PTF_ELE":{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false},"__hashCodeCalc":false}],"ERR":{"WP9STC":{"lValue":0},"DSXERR":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false}'
        }));
    }

	public static INT_SwagClient mockSwagNormEgonValidationKOStreet() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getAuthentication' => B2B_AddressValidation_Srv.SWAG_CLIENT.getAuthentication('CustomHTTPHeadersAuth'),
                'invoke' => '{"SOG":[{"PAR":{"RAGSOC":"N","RGSRIC":"N","PARIVA":"N","CODFIS":"N","LIVFIS":"1","DATNAS":"N","LOCNAS":"N","DOCIDN":"N","INDRES":"S","LIVENOR":"2","ESTLPO":"N","EMAIL":"N","CNTTEL":"N","CNTCOD":"N","FLXZLM":"0","FLXCOM":"S","FLXMEM":"","CDXLST":"643","TIMSTP":"","CDXISO":"FRA","FLXCND":"N","FLXPTF":"S","INDCOO":"N","COOATL":"N","COONAV":"N","COODEF":"N","COOBES":"S","COOATT":"S","COOIDQ":"N","COOAPP":"S","MCZO91":"N","MCZO01":"N","MCZO11":"N","MCZAPP":"N","MCZPUN":"N","BESPRI":"A","NUMAPP":"99999","TPXMSU":"00001","FMTOUT":"C","LNGOUT":"","TPXOUT":"","WPUSER":"WPTC04RCMT02","WPPASW":"","__hashCodeCalc":false},"KII":{"__hashCodeCalc":false},"RGS_010":{"CDXISO":"ITA","TPXANA":"","FLXSEX":"","DSXFRENAM":"","DSXMIDNAM":"","DSXNOM":"","DSXTITACC":"","DSXPRENOM":"","DATNAS":"","TPXCDK":"","LOCNAS":{"DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIPNAS":"","__hashCodeCalc":false},"DOCIDN":{"DSXDATRIL":"","DSXDATNAS":"","DSXDATSCA":"","DSXPRORIL":"","DSXCOMRIL":"","TPXDOC":"","CDXDOC":"","DSXENTRIL":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_011":[{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false}],"INR_020":{"TP9IND":{"lValue":0},"TP9INDSOT":{"lValue":0},"CDXISO":"","TPXCDK":"","TPXTED":"","CDPLNG":{"lValue":0},"TPPOBJ":{"lValue":0},"CDPOBJ":{"lValue":0},"CDPCIV":{"lValue":0},"CDPPLC":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"DSXPLC":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"LYON","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDXZIP":"","DSXST1":{"DSXDUG":"","DSXVIA":"RUE VOLTAIRE","NRPNUMCIV":{"lValue":0},"DSXESP":"2","__hashCodeCalc":false},"DSXST2":{"DSXDUG":"","DSXVIA":"","NRPNUMCIV":{"lValue":0},"DSXESP":"","__hashCodeCalc":false},"DSXPREINR":"","DSXBLD":"","DSXSUBBLD":"","DSXCPNINR":"","__hashCodeCalc":false},"TEL_035":{"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"TELUNI":{"CDXISOUNI":"","TELUNI":"","__hashCodeCalc":false},"__hashCodeCalc":false},"KIO":{"FLXDOP":"0","ELECLI":{"__hashCodeCalc":false},"__hashCodeCalc":false},"RGS_610":{"CDXISO":"","TPXANA":"6","FLXSEX":"0","DSXFRENAM":"","DSXCOG":"","DSXMIDNAM":"","DSXNOM":"","DSXSUFNAM":"","DSXTITACC":"","CDPTITACC":{"lValue":0},"DSXTITAC2":"","CDPTITAC2":{"lValue":0},"DSXFRENAMABB":"","DSXNOMABB":"","DSXGIUUFF":"","DSXGIUABB":"","CDPSPEGIU":{"lValue":0},"DATNAS":"","DSXPLCNAS":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCNAS":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"ALTRO":{"DSXPRENOM":"","CDXMATCOD":"","__hashCodeCalc":false},"__hashCodeCalc":false},"COD_611":[{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false},{"ELECOD":{"CDXISO":"","TPXCOD":"","DSXCOD":"","__hashCodeCalc":false},"VLPBON":{"lValue":0},"__hashCodeCalc":false}],"INR_620":{"TP9IND":{"lValue":1},"TP9INDSOT":{"lValue":1},"CDXISO":"FRA","DSXPLCUFF":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCUSR":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCABB":{"DSXCNY":"France","DSXSTA":"","DSXREG":"Auvergne-Rhône-Alpes","DSXDPT":"Rhône","DSXCNL":"Lyon","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXPLCSIG":{"DSXCNY":"FRA","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPPLCOBJ":{"CDPCNY":{"lValue":25000000001},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":25000000136},"CDPDPT":{"lValue":25000000102},"CDPCNL":{"lValue":25000127825},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"CDXPLCOBJ":{"CDXCNY":"FRNC 05","CDXSTA":"","CDXREG":"VRGNRNL18","CDXDPT":"RNO 04","CDXCNL":"LNIO 04","CDXDS1":"","CDXDS2":"","CDXDS3":"","__hashCodeCalc":false},"CDXSTAPLCOBJ":{"CDXREG":"84","CDXDPT":"69","CDXCNL":"69123","__hashCodeCalc":false},"FLXPLCOBJ":{"__hashCodeCalc":false},"LNGPLCCNY":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":250},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCSTA":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCREG":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDPT":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCCNL":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGPLCDS3":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"MRE":{"TPPOBJMRE":{"lValue":0},"CDPOBJMRE":{"lValue":0},"LNGMRE":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"__hashCodeCalc":false},"TPPOBJPLC":{"lValue":0},"TPPOBJSTR":{"lValue":0},"CDXZIP":"69003","DSXUNIROW":"2 Rue Voltaire, Lyon, Rhône, Auvergne-Rhône-Alpes, 69003, France","DSXSTRUFF":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRUSR":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"DSXSTRABB":{"DSXADD":"2 Rue Voltaire","DSXST1":{"DSXSTR":"Rue Voltaire","DSXDUG":"Rue","DSXVIA":"Voltaire","__hashCodeCalc":false},"DSXST2":{"DSXSTR":"","DSXDUG":"","DSXVIA":"","__hashCodeCalc":false},"__hashCodeCalc":false},"CDPSTRST1":{"CDPSTR":{"lValue":25002081366},"CDPDUG":{"lValue":34},"__hashCodeCalc":false},"CDPSTRST2":{"CDPSTR":{"lValue":0},"CDPDUG":{"lValue":0},"__hashCodeCalc":false},"CDXSTRST1":{"CDX":"RVLTR 10","__hashCodeCalc":false},"CDXSTRST2":{"CDX":"","__hashCodeCalc":false},"FLXSTRST1":{"__hashCodeCalc":false},"FLXSTRST2":{"__hashCodeCalc":false},"LNGSTRST1":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"LNGSTRST2":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"CIVICOST1":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":2},"NRXNUMCIV":"2","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"CIVICOST2":{"CDPCIV":{"lValue":0},"NRPNUMCIV":{"lValue":0},"NRXNUMCIV":"","DSXESP":"","DSXCOM":"","__hashCodeCalc":false},"ALTRO":{"DSXCASPOS":"","DSXPREINR":"","DSXCPNINR":"","DSXEXTURB":"","CDXMATCOD":"2500012782525002081366000000002000000000","__hashCodeCalc":false},"DSXBLD":"","DSXSUBBLD":"","CDXSTA":[{"CDXISO":"FRA","TPXCOD":"50137","DSXCOD":"Rhône","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false},{"CDXISO":"FRA","TPXCOD":"30029","DSXCOD":"6999","TPXRNK":"","TPXCHK":"","__hashCodeCalc":false}],"DSXLPOUFF":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOUSR":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOABB":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"DSXLPOSIG":{"DSXCNY":"","DSXSTA":"","DSXREG":"","DSXDPT":"","DSXCNL":"","DSXDS1":"","DSXDS2":"","DSXDS3":"","__hashCodeCalc":false},"CDPLPOOBJ":{"CDPCNY":{"lValue":0},"CDPSTA":{"lValue":0},"CDPREG":{"lValue":0},"CDPDPT":{"lValue":0},"CDPCNL":{"lValue":0},"CDPDS1":{"lValue":0},"CDPDS2":{"lValue":0},"CDPDS3":{"lValue":0},"__hashCodeCalc":false},"LNGLPO":{"TPPLNG":{"lValue":0},"CDPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"__hashCodeCalc":false},"TPPOBJLPO":{"lValue":0},"NR9CND":{"lValue":0},"INRCND":[{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false},{"TPPCND":{"lValue":0},"CDPCND":{"lValue":0},"LNGCND":{"__hashCodeCalc":false},"__hashCodeCalc":false}],"__hashCodeCalc":false},"COO_626":{"__hashCodeCalc":false},"MCZ_627":{"__hashCodeCalc":false},"TEL_635":{"NRZELE":{"lValue":0},"ELETEL":[{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false},{"CDXISO":"","TPXTEL":"","USOTEL":"","PFXOPR":"","PFXINT":"","PFXNAZ":"","NR9TEL":"","__hashCodeCalc":false}],"NOTE":"","__hashCodeCalc":false},"PTF":{"ROW1":"","ROW2":"","ROW3":"","ROW4":"2 RUE VOLTAIRE","ROW5":"","ROW6":"69003 LYON","ROW7":"FRANCE","__hashCodeCalc":false},"SEG":{"ERR_610_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_611_ELE":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_620_ELE":{"ERR_620":[{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},{"FLXSEG":"2","CDPSEG":{"lValue":302},"DSXSEG":"Street not found","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"__hashCodeCalc":false}],"__hashCodeCalc":false},"ERR_GEO_ELE":[{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false},{"__hashCodeCalc":false}],"ERR_635_ELE":[{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false},{"FLXSEG":"","CDPSEG":{"lValue":0},"DSXSEG":"","__hashCodeCalc":false}],"ERR_PTF_ELE":{"FLXSEG":"0","CDPSEG":{"lValue":0},"DSXSEG":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false},"__hashCodeCalc":false}],"ERR":{"WP9STC":{"lValue":0},"DSXERR":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false}'
        }));
    }

    public static INT_SwagClient mockSwagLstEgonValidation() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getAuthentication' => B2B_AddressValidation_Srv.SWAG_CLIENT.getAuthentication('CustomHTTPHeadersAuth'),
                'invoke' => '{"LOC_AREA_OUT":{"NR9LOC":{"lValue":30},"LOC":[{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000011},"DSXOBJDPT":"Antwerpen","DSXABBDPT":"Antwerpen","DSXSGXDPT":"VAN","CDPOBJCNL":{"lValue":5600001074},"DSXOBJCNL":"Antwerpen","DSXABBCNL":"Antwerpen","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"2000","FLXSYN":"1","DSXSYN":"ANTWERPEN","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":513654},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600000991},"DSXOBJCNL":"Gent","DSXABBCNL":"Gent","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9000","FLXSYN":"1","DSXSYN":"GENT","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":251659},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000015},"DSXOBJDPT":"Hainaut","DSXABBDPT":"Hainaut","DSXSGXDPT":"WHT","CDPOBJCNL":{"lValue":5600000518},"DSXOBJCNL":"Charleroi","DSXABBCNL":"Charleroi","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"6000","FLXSYN":"1","DSXSYN":"CHARLEROI","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":203495},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000008},"DSXOBJDPT":"Liège","DSXABBDPT":"Liège","DSXSGXDPT":"WLG","CDPOBJCNL":{"lValue":5600001150},"DSXOBJCNL":"Liège","DSXABBCNL":"Liège","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"4000","FLXSYN":"1","DSXSYN":"LIEGE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":197858},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000002},"DSXOBJREG":"Brussel","DSXABBREG":"Brussel","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000009},"DSXOBJDPT":"Brussel","DSXABBDPT":"Brussel","DSXSGXDPT":"BRU","CDPOBJCNL":{"lValue":5600001741},"DSXOBJCNL":"Bruxelles","DSXABBCNL":"Bruxelles","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"1000","FLXSYN":"1","DSXSYN":"BRUXELLES","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":171811},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000007},"DSXOBJDPT":"West-Vlaanderen","DSXABBDPT":"West-Vlaanderen","DSXSGXDPT":"VWV","CDPOBJCNL":{"lValue":5600001318},"DSXOBJCNL":"Brugge","DSXABBCNL":"Brugge","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"8000","FLXSYN":"1","DSXSYN":"BRUGGE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":117831},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000006},"DSXOBJDPT":"Namur","DSXABBDPT":"Namur","DSXSGXDPT":"WNA","CDPOBJCNL":{"lValue":5600001187},"DSXOBJCNL":"Namur","DSXABBCNL":"Namur","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"5000","FLXSYN":"1","DSXSYN":"NAMUR","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":111257},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000010},"DSXOBJDPT":"Vlaams Brabant","DSXABBDPT":"Vlaams Brabant","DSXSGXDPT":"VBR","CDPOBJCNL":{"lValue":5600000398},"DSXOBJCNL":"Leuven","DSXABBCNL":"Leuven","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"3000","FLXSYN":"1","DSXSYN":"LEUVEN","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":98509},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000015},"DSXOBJDPT":"Hainaut","DSXABBDPT":"Hainaut","DSXSGXDPT":"WHT","CDPOBJCNL":{"lValue":5600001969},"DSXOBJCNL":"Mons","DSXABBCNL":"Mons","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"7000","FLXSYN":"1","DSXSYN":"MONS","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":95237},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600000325},"DSXOBJCNL":"Aalst","DSXABBCNL":"Aalst","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9300","FLXSYN":"1","DSXSYN":"AALST","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":83604},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000011},"DSXOBJDPT":"Antwerpen","DSXABBDPT":"Antwerpen","DSXSGXDPT":"VAN","CDPOBJCNL":{"lValue":5600001087},"DSXOBJCNL":"Mechelen","DSXABBCNL":"Mechelen","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"2800","FLXSYN":"1","DSXSYN":"MECHELEN","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":83418},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000015},"DSXOBJDPT":"Hainaut","DSXABBDPT":"Hainaut","DSXSGXDPT":"WHT","CDPOBJCNL":{"lValue":5600000914},"DSXOBJCNL":"La Louvière","DSXABBCNL":"La Louvière","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"7100","FLXSYN":"1","DSXSYN":"LA LOUVIERE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":80313},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000014},"DSXOBJDPT":"Limburg","DSXABBDPT":"Limburg","DSXSGXDPT":"VLI","CDPOBJCNL":{"lValue":5600001809},"DSXOBJCNL":"Hasselt","DSXABBCNL":"Hasselt","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"3500","FLXSYN":"1","DSXSYN":"HASSELT","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":76133},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000007},"DSXOBJDPT":"West-Vlaanderen","DSXABBDPT":"West-Vlaanderen","DSXSGXDPT":"VWV","CDPOBJCNL":{"lValue":5600001685},"DSXOBJCNL":"Kortrijk","DSXABBCNL":"Kortrijk","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"8500","FLXSYN":"1","DSXSYN":"KORTRIJK","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":75544},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600000995},"DSXOBJCNL":"Sint-Niklaas","DSXABBCNL":"Sint-Niklaas","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9100","FLXSYN":"1","DSXSYN":"SINT NIKLAAS","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":74131},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000007},"DSXOBJDPT":"West-Vlaanderen","DSXABBDPT":"West-Vlaanderen","DSXSGXDPT":"VWV","CDPOBJCNL":{"lValue":5600000954},"DSXOBJCNL":"Oostende","DSXABBCNL":"Oostende","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"8400","FLXSYN":"1","DSXSYN":"OOSTENDE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":70621},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000015},"DSXOBJDPT":"Hainaut","DSXABBDPT":"Hainaut","DSXSGXDPT":"WHT","CDPOBJCNL":{"lValue":5600001297},"DSXOBJCNL":"Tournai","DSXABBCNL":"Tournai","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"7500","FLXSYN":"1","DSXSYN":"TOURNAI","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":69958},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000014},"DSXOBJDPT":"Limburg","DSXABBDPT":"Limburg","DSXSGXDPT":"VLI","CDPOBJCNL":{"lValue":5600001814},"DSXOBJCNL":"Genk","DSXABBCNL":"Genk","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"3600","FLXSYN":"1","DSXSYN":"GENK","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":65487},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000008},"DSXOBJDPT":"Liège","DSXABBDPT":"Liège","DSXSGXDPT":"WLG","CDPOBJCNL":{"lValue":5600001153},"DSXOBJCNL":"Seraing","DSXABBCNL":"Seraing","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"4100","FLXSYN":"1","DSXSYN":"SERAING","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":64324},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000007},"DSXOBJDPT":"West-Vlaanderen","DSXABBDPT":"West-Vlaanderen","DSXSGXDPT":"VWV","CDPOBJCNL":{"lValue":5600001343},"DSXOBJCNL":"Roeselare","DSXABBCNL":"Roeselare","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"8800","FLXSYN":"1","DSXSYN":"ROESELARE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":60116},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000015},"DSXOBJDPT":"Hainaut","DSXABBDPT":"Hainaut","DSXSGXDPT":"WHT","CDPOBJCNL":{"lValue":5600002722},"DSXOBJCNL":"Mouscron","DSXABBCNL":"Mouscron","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"7700","FLXSYN":"1","DSXSYN":"MOUSCRON","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":56628},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000004},"DSXOBJREG":"Wallonie","DSXABBREG":"Wallonie","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000008},"DSXOBJDPT":"Liège","DSXABBDPT":"Liège","DSXSGXDPT":"WLG","CDPOBJCNL":{"lValue":5600000477},"DSXOBJCNL":"Verviers","DSXABBCNL":"Verviers","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"4800","FLXSYN":"1","DSXSYN":"VERVIERS","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":56030},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600001704},"DSXOBJCNL":"Beveren-Waas","DSXABBCNL":"Beveren-Waas","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9120","FLXSYN":"1","DSXSYN":"BEVEREN WAAS","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":47236},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600002402},"DSXOBJCNL":"Dendermonde","DSXABBCNL":"Dendermonde","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9200","FLXSYN":"1","DSXSYN":"DENDERMONDE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":44829},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000014},"DSXOBJDPT":"Limburg","DSXABBDPT":"Limburg","DSXSGXDPT":"VLI","CDPOBJCNL":{"lValue":5600000409},"DSXOBJCNL":"Beringen","DSXABBCNL":"Beringen","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"3580","FLXSYN":"1","DSXSYN":"BERINGEN","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":44280},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000011},"DSXOBJDPT":"Antwerpen","DSXABBDPT":"Antwerpen","DSXSGXDPT":"VAN","CDPOBJCNL":{"lValue":5600000691},"DSXOBJCNL":"Turnhout","DSXABBCNL":"Turnhout","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"2300","FLXSYN":"1","DSXSYN":"TURNHOUT","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":42443},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000010},"DSXOBJDPT":"Vlaams Brabant","DSXABBDPT":"Vlaams Brabant","DSXSGXDPT":"VBR","CDPOBJCNL":{"lValue":5600002106},"DSXOBJCNL":"Vilvoorde","DSXABBCNL":"Vilvoorde","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"1800","FLXSYN":"1","DSXSYN":"VILVOORDE","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":41902},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000011},"DSXOBJDPT":"Antwerpen","DSXABBDPT":"Antwerpen","DSXSGXDPT":"VAN","CDPOBJCNL":{"lValue":5600001076},"DSXOBJCNL":"Heist-op-den-Berg","DSXABBCNL":"Heist-op-den-Berg","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"2220","FLXSYN":"1","DSXSYN":"HEIST OP DEN BERG","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":41404},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000010},"DSXOBJDPT":"Vlaams Brabant","DSXABBDPT":"Vlaams Brabant","DSXSGXDPT":"VBR","CDPOBJCNL":{"lValue":5600001766},"DSXOBJCNL":"Dilbeek","DSXABBCNL":"Dilbeek","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"1700","FLXSYN":"1","DSXSYN":"DILBEEK","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":41075},"__hashCodeCalc":false},{"CDXISO":"BEL","TPPOBJPLC":{"lValue":5},"CDPOBJCNY":{"lValue":5600000001},"DSXOBJCNY":"Belgique","DSXABBCNY":"Belgique","DSXSGXCNY":"BE","CDPOBJSTA":{"lValue":0},"DSXOBJSTA":"","DSXABBSTA":"","DSXSGXSTA":"","CDPOBJREG":{"lValue":5600000003},"DSXOBJREG":"Vlaanderen","DSXABBREG":"Vlaanderen","DSXSGXREG":"","CDPOBJDPT":{"lValue":5600000013},"DSXOBJDPT":"Oost-Vlaanderen","DSXABBDPT":"Oost-Vlaanderen","DSXSGXDPT":"VOV","CDPOBJCNL":{"lValue":5600000634},"DSXOBJCNL":"Lokeren","DSXABBCNL":"Lokeren","DSXSGXCNL":"","CDPOBJDS1":{"lValue":0},"DSXOBJDS1":"","DSXABBDS1":"","DSXSGXDS1":"","CDPOBJDS2":{"lValue":0},"DSXOBJDS2":"","DSXABBDS2":"","DSXSGXDS2":"","CDPOBJDS3":{"lValue":0},"DSXOBJDS3":"","DSXABBDS3":"","DSXSGXDS3":"","FLXMULZIP":"0","CDXZIP":"9160","FLXSYN":"1","DSXSYN":"LOKEREN","CDPLNG":{"lValue":56},"TPPLNG":{"lValue":0},"NRPPRG":{"lValue":0},"NRPAMP":{"lValue":40379},"__hashCodeCalc":false}],"__hashCodeCalc":false},"LSTERR":{"WP9STC":{"lValue":0},"DSXERR":"Ok","__hashCodeCalc":false},"__hashCodeCalc":false}'
        }));
    }

    public static INT_SwagClient mockSwagClientGetPosCurrentStock() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => '[{"brand":"CAR","posCode":"UT100:102048","sharedStockLocation":{"name":"Bucherer Geneve","posCode":"UT100:102048","posCodeToBeDisplayed":"102048","country":"Belgium","city":"Brussels","postalCode":"1000","state":"Brussels","street":"Rue de la Loi 12"},"stockItems":[{"articleCode":"UT-CRW5200013","currentStockQuantity":3,"serialNumbers":["12341U321-21389-213o8","12341U321-21389-213x6","12341U321-21389-213x7"],"stockPositions": [{"quantity": 1,"serialNumber": "12341U321-21389-213o8","stockDate": "2020-12-31","loadedOnDate": "2020-12-31","type": "consignment","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}},{"quantity": 1,"serialNumber": "12341U321-21389-213x6","stockDate": "2020-12-31","type": "consignment","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}}]},{"articleCode":"CRW8000016","currentStockQuantity":3,"serialNumbers":["12341U321-21389-213o8","12341U321-21389-213x6"]},{"articleCode":"CRW8000017","currentStockQuantity":3}]}]'
        }));
    }

    public static INT_SwagClient mockSwagClientGetStockMovementHistory() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => '{"totalPages":3,"totalResults":3,"elements":[{"movementId":"12345679","posCode":"UT-CA/02/06CA/0000100999","posName":"Bucherer CAR Berlin Kudamm","CreatedBy":"Nicole Burch","movementDate":"2021-12-23","articleCode":"UT-CRW5200013","SerialNumber":"1234","Quantity":-1,"movementTypeId":"2","Comments":""}]}'
        }));
    }

	public static INT_SwagClient mockSwagClientGetPosStockDetails() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => '{"articleCode": "CRW8000015","brand": "CAR","posCode": "ES100:102048","currentStockQuantity": 2,"stockPositions": [{"quantity": 1,"serialNumber": "12341U321-21389-213o8","stockDate": "2020-12-31","loadedOnDate": "2020-12-31","type": "consignment","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}},{"quantity": 1,"serialNumber": "12341U321-21389-213x6","stockDate": "2020-12-31","type": "consignment","unitNetAmount": {"currencyIsoCode": "EUR","value": 12000.00}}]}'
        }));
    }

	public static INT_SwagClient mockSwagClientInvokeWarrantyStatusEndDate() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
				'invoke' => '{"services": [{"service": "asdasd","languageCode": "J"},{"service": "asdasdasd","languageCode": "J"}],"lastRepairDate": "2022-01-19","warrantyStatus": "Active","warrantyEndDate": "2022-01-19","warrantyStartDate": "2020-01-18","articleDescription": "WAT NEW PASHA 41MM STEEL LTH & BCT AUTO","serialNumber": "482948190X","articleCode": "' + productSKUs[0] + '","brand": "CAR"}'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeArticlesLookupFromSNOK() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
				'invoke' => '[{ "articleCode": "123456", "serialNumber": "987654" }]'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeArticlesLookupFromSNKO() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
				'invoke' => new INT_Swagger.ApiException(404, 'Not Found', null, '', null)
		}));
	}

    public static INT_SwagClient mockSwagClientGetAggregatedStock() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => JSON.deserialize(
                        '{"clusterCode":"12345","stockItems":[{"articleCode":"UT-CRW5200013","assetQuantity":34,"consignmentQuantity":12},{"articleCode":"UT-CRWM505010","assetQuantity":34,"consignmentQuantity":12}]}',
                        B2B_WR_PosStockAggregate.class
                )
        }));
    }

    public static INT_SwagClient mockSwagClientInvokeGetOtherPosStock() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
				'invoke' => '[{\n' +
                        '    "brandCode": "CAR",\n' +
                        '    "posCode": "ES100:102048",\n' +
                        '    "sharedStockLocation": {\n' +
                        '        "name": "Bucherer Geneve",\n' +
                        '        "posCode": "ES100:102049",\n' +
                        '        "posCodeToBeDisplayed": "102049",\n' +
                        '        "country": "Belgium",\n' +
                        '        "city": "Brussels",\n' +
                        '        "postalCode": "1000",\n' +
                        '        "state": "Brussels",\n' +
                        '        "street": "Rue de la Loi 12"\n' +
                        '    },\n' +
                        '    "stockItems": [{\n' +
                        '        "articleCode": "CRW1580001",\n' +
                        '        "currentStockQuantity": 3,\n' +
                        '        "serialNumbers": ["12341U321-21389-213o8", "12341U321-21389-213x6", "12341U321-21389-213x7"],\n' +
                                '"stockPositions": [' +
                                '{'+
                                '"quantity": 1,'+
                                '"serialNumber": "3170308725AX",'+
                                '"stockDate": "2020-12-22",'+
                                '"loadedOnDate": "2020-12-22",'+
                                '"type": "standard",'+
                                '"isConsignmentSellable": false,'+
                                '"unitNetAmount": {'+
                                '"currencyIsoCode": "CHF"'+
                        '}'+
                                '},'+
                                '{'+
                                '"quantity": 13,'+
                                '"serialNumber": "3170663009ZX",'+
                                '"stockDate": "2020-01-06",'+
                                '"loadedOnDate": "2020-01-06",'+
                                '"type": "standard",'+
                                '"isConsignmentSellable": true,'+
                                '"unitNetAmount": {'+
                                '"currencyIsoCode": "CHF"'+
                                '}'+
                                '}'+
                                ']'+
                        '    }]\n' +
                        '}, {\n' +
                        '    "brandCode": "CAR",\n' +
                        '    "posCode": "ES100:102044",\n' +
                        '    "sharedStockLocation": null,\n' +
                        '    "stockItems": [{\n' +
                        '        "articleCode": "CRW1580001",\n' +
                        '        "currentStockQuantity": 5,\n' +
                        '        "serialNumbers": ["12341U321-21389-21339"]\n' +
                        '    }],\n' +
                        '"stockPositions": [' +
                        '{' +
                        '"quantity": 1,' +
                        '"serialNumber": "3170308725AX",' +
                        '"stockDate": "2020-12-22",' +
                        '"loadedOnDate": "2020-12-22",' +
                        '"type": "standard",' +
                        '"isConsignmentSellable": false,' +
                        '"unitNetAmount": {' +
                        '"currencyIsoCode": "CHF"' +
                        '}' +
                        '},' +
                        '{' +
                        '"quantity": 1,' +
                        '"serialNumber": "3170663009ZX",' +
                        '"stockDate": "2020-01-06",' +
                        '"loadedOnDate": "2020-01-06",' +
                        '"type": "standard",' +
                        '"isConsignmentSellable": true,' +
                        '"unitNetAmount": {' +
                        '"currencyIsoCode": "CHF"' +
                        '}' +
                        '}' +
                        ']' +
                        '}, {\n' +
                        '    "brandCode": "CAR",\n' +
                        '    "posCode": "ES100:102045",\n' +
                        '    "sharedStockLocation": null,\n' +
                        '    "stockItems": [{\n' +
                        '        "articleCode": "CRW1580001",\n' +
                        '        "currentStockQuantity": 2\n' +
                        '    }], \n' +
                        '"stockPositions": [' +
                        '{' +
                        '"quantity": 1,'+
                        '"serialNumber": "3170308725AX",'+
                        '"stockDate": "2020-12-22",'+
                        '"loadedOnDate": "2020-12-22",'+
                        '"type": "standard",'+
                        '"isConsignmentSellable": false,'+
                        '"unitNetAmount": {'+
                        '"currencyIsoCode": "CHF"'+
                        '}'+
                        '},'+
                        '{'+
                        '"quantity": 13,'+
                        '"serialNumber": "3170663009ZX",'+
                        '"stockDate": "2020-01-06",'+
                        '"loadedOnDate": "2020-01-06",'+
                        '"type": "standard",'+
                        '"isConsignmentSellable": true,'+
                        '"unitNetAmount": {'+
                        '"currencyIsoCode": "CHF"'+
                        '}'+
                        '}'+
                        ']'+
                    '}]'
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeWarrantyStatusEndDateKO() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
				'invoke' => new INT_Swagger.ApiException(404, 'Not Found', null, '', null)
		}));
	}

	public static INT_SwagClient mockSwagClientInvokeWarrantyExtensionEligibility(String salesId) {
		List<B2B_SellOutItem__c> sellOutItems = [SELECT Id, B2B_SelloutDetailID__c FROM B2B_SellOutItem__c WHERE B2B_SellOut__r.B2B_SalesId__c =:salesId];
		List<B2B_Sellout_Srv.B2B_WR_Booster1WarrantyExtensionEligibilityInfo> warrantyInfos = new List<B2B_Sellout_Srv.B2B_WR_Booster1WarrantyExtensionEligibilityInfo>();

		for (B2B_SellOutItem__c sellOutItem : sellOutItems) {
			B2B_Sellout_Srv.B2B_WR_Booster1WarrantyExtensionEligibilityInfo warrantyInfo = new B2B_Sellout_Srv.B2B_WR_Booster1WarrantyExtensionEligibilityInfo();
			warrantyInfo.saleDetailId = sellOutItem.B2B_SelloutDetailID__c;
			warrantyInfo.canBeExtended = true;
			warrantyInfos.add(warrantyInfo);
		}
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => warrantyInfos
		}));
	}

    public static B2B_WR_ReturnDocumentsRequest returnDocument {
        get{
            if(returnDocument == null) {
                String returnDocumentInputString = '{ "documentId": "70313697567","returnNumber":"3532425","documentType":"ZB06", "erpSystem": "UT100","posCode": "UT100:102048","brand": "CAR","documentDate": "2021-04-22"}';
                returnDocument = (B2B_WR_ReturnDocumentsRequest) JSON.deserialize(returnDocumentInputString, B2B_WR_ReturnDocumentsRequest.class);
            }
            return returnDocument;
        }
        public set;
    }

    public static B2B_WR_ReturnDocumentsRequest returnDocumentWithoutPOS {
        get{
            if(returnDocumentWithoutPOS == null) {
                String returnDocumentInputString = '{ }';
                returnDocumentWithoutPOS = (B2B_WR_ReturnDocumentsRequest) JSON.deserialize(returnDocumentInputString, B2B_WR_ReturnDocumentsRequest.class);
            }
            return returnDocumentWithoutPOS;
        }
        public set;
    }

	public static List<B2B_SellOut__c> sellouts {
		get{
			if(sellouts==null) {
				sellouts = new List<B2B_SellOut__c>();
				sellouts = [SELECT Id FROM B2B_SellOut__c];
			}
			return sellouts;
		}
		public set;
	}

	public static List<B2B_SellOutItem__c> selloutItems {
		get{
			if(selloutItems==null) {
				selloutItems = new List<B2B_SellOutItem__c>();
				selloutItems = [SELECT Id, B2B_SelloutDetailID__c ,B2B_SellOut__c FROM B2B_SellOutItem__c];
			}
			return selloutItems;
		}
		public set;
	}

	public static List<Account> accounts {
		get{
			if(accounts==null) {
				accounts = new List<Account>();
				accounts = [SELECT Id, B2B_ExternalId__c, B2B_POSCluster__c, B2B_SharedStockLocation__c
                FROM Account WHERE IsPersonAccount = FALSE];
			}
			return accounts;
		}
		public set;
	}


    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<Account>: Returns the list of Accounts
    **************************************************************************************************************************************************************************/
    public static List<Account> createAccountsWithDefaultValues(UTL_SObjectUnitOfWork uow) {
        return createAccountsWithDefaultValuesAndLocalisation(uow, null);
    }

    /*******************************************************************************************************************
    * @author       Kürsad Görgülü (kgorgulu@deloitte.com)
    * @description  This method creates some accounts and registers their relationship to the localisation object.
    * @date         12/04/2021
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        localisation (B2B_Localisation__c): the localisation object that will be linked to the accounts.
    * @return       accounts (List<Account>): a list of the accounts that were created in this method.
    *******************************************************************************************************************/
    public static List<Account> createAccountsWithDefaultValuesAndLocalisation(UTL_SObjectUnitOfWork uow, B2B_Localisation__c localisation) {
        List<B2B_POSCluster__c> posClusters = new List<B2B_PosCluster__c>();
        B2B_UTL_DataFactory.createPosClusters();
        posClusters = B2B_UTL_DataFactory.posClusters;
        Map<String, Object> shippingAddressFields = new Map<String, Object> {
                'ShippingCity' => 'Brussels',
                'ShippingStreet' => 'Wetstraat 1',
                'ShippingCountryCode' => 'BE',
                'ShippingPostalCode' => '1000'
        };

        String chainAccount = 'Chain - Bucherer AG';
        Map<String, Object> chainAccountFieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds[0],
                'RecordTypeId' => B2B_UTL_GlobalUtility.chainRecordTypeId
        };

        String doorAccount = 'DOOR BUCHERER AG Wholesaler (Cartier)';
        Map<String, Object> doorAccountFieldValues = new Map<String, Object>{

                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => doorAccountExternalIds[1],
                'B2B_POSType__c' => '1',
                'RecordTypeId' => B2B_UTL_GlobalUtility.doorRecordTypeId,
				'ShippingCountryCode' => 'CH',
				'B2B_Name__c' => doorAccount

        };
        doorAccountFieldValues.putAll(shippingAddressFields);

        String brandedPOSCartier = 'BUCHERER AG Wholesaler (Cartier)';
        Map<String, Object> posCartierFieldValues = new Map<String, Object>{

                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => brandedPOSExternalIds[0],
                'B2B_POSType__c' => '1',
                'B2B_POSLegacyToBeDisplayed__c' => '102048',
                'B2B_ITLegacySystem__c' => 'UT100',
                'RecordTypeId' => B2B_UTL_GlobalUtility.brandedPosRecordTypeId,
				'B2B_Name__c' => brandedPOSCartier,
                'B2B_AutoRepEnabled__c' => true

        };
        posCartierFieldValues.putAll(shippingAddressFields);

        String brandedPOSMontblanc = 'BUCHERER Wholesaler AG (Montblanc)';
        Map<String, Object> posMontblancFieldValues = new Map<String, Object>{

                'B2B_Maison__c' => 'MB',
                'B2B_ExternalId__c' => brandedPOSExternalIds[1],
                'B2B_POSType__c' => '1',
                'B2B_POSLegacyToBeDisplayed__c' => '102049',
                'B2B_ITLegacySystem__c' => 'UT100',
                'RecordTypeId' => B2B_UTL_GlobalUtility.brandedPosRecordTypeId,
				'B2B_Name__c' => brandedPOSMontblanc

        };
        posMontblancFieldValues.putAll(shippingAddressFields);

        String brandedPOSExternalCartier = 'External Boutique (Cartier)';
        Map<String, Object> posExternalCartierFieldValues = new Map<String, Object>{

                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => brandedPOSExternalIds[2],
                'B2B_POSLegacyToBeDisplayed__c' => '102040',
                'B2B_ITLegacySystem__c' => 'UT100',
				'B2B_POSType__c' => '1',
                'RecordTypeId' => B2B_UTL_GlobalUtility.brandedPosRecordTypeId,
                'B2B_PosCluster__c'=> posClusters.size()>0 ? posClusters[0].Id : '',
				'B2B_Name__c' => brandedPOSExternalCartier
        };
        posExternalCartierFieldValues.putAll(shippingAddressFields);

        String brandedPOSSTLAccountCartier = 'POS STL Account (Cartier)';
        Map<String, Object> posSTLAccountFieldValues = new Map<String, Object>{

                'B2B_Maison__c' => 'CA',
                'B2B_ExternalId__c' => brandedPOSExternalIds[3],
                'B2B_POSLegacyToBeDisplayed__c' => 'POS_Account_1',
                'B2B_ITLegacySystem__c' => 'UT100',
				'B2B_POSType__c' => '1',
                'RecordTypeId' => B2B_UTL_GlobalUtility.brandedPosRecordTypeId,
                'B2B_PosCluster__c'=> posClusters.size()>0 ? posClusters[0].Id : '',
				'B2B_Name__c' => brandedPOSSTLAccountCartier
        };
        posSTLAccountFieldValues.putAll(shippingAddressFields);

        List<Account> doorAccounts = new List<Account>();
        doorAccounts.add(UTL_DataFactory.createAccount(chainAccount, chainAccountFieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount, doorAccountFieldValues, false));

        List<Account> accounts = new List<Account>();
        accounts.add(UTL_DataFactory.createAccount(brandedPOSCartier, posCartierFieldValues, false));
        accounts.add(UTL_DataFactory.createAccount(brandedPOSMontblanc, posMontblancFieldValues, false));
        accounts.add(UTL_DataFactory.createAccount(brandedPOSExternalCartier, posExternalCartierFieldValues, false));
        accounts.add(UTL_DataFactory.createAccount(brandedPOSSTLAccountCartier, posSTLAccountFieldValues, false));

        if(localisation!=null){
            uow.registerRelationship(accounts[0], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(accounts[1], Account.B2B_Localisation__c, localisation);
			uow.registerRelationship(accounts[2], Account.B2B_Localisation__c, localisation);
        }
        uow.registerRelationship(doorAccounts[1],Account.ParentId,doorAccounts[0]);
        uow.registerRelationship(accounts[0],Account.ParentId,doorAccounts[1]);
        uow.registerRelationship(accounts[1],Account.ParentId,doorAccounts[1]);
        uow.registerRelationship(accounts[2],Account.ParentId,doorAccounts[1]);
        uow.registerRelationship(accounts[2],Account.B2B_SharedStockLocation__c,accounts[0]);
        uow.registerRelationship(accounts[3],Account.ParentId,doorAccounts[1]);
        uow.registerNew(doorAccounts);
		uow.registerNew(accounts);
        return accounts;
    }

    public static List<Account> createBuyerAccountsWithDefaultValuesAndLocalisation(UTL_SObjectUnitOfWork uow, B2B_Localisation__c localisation) {
        Id doorRecordTypeId = UTL_SF.getRecordTypeByName(B2B_UTL_GlobalConstants.B2B_ACCOUNT_DOOR_RECORD_TYPE_DEV_NAME, 'Account').Id;
        Id POSRecordTypeId = UTL_SF.getRecordTypeByName(B2B_UTL_GlobalConstants.B2B_ACCOUNT_POS_RECORD_TYPE_DEV_NAME, 'Account').Id;

        String doorAccount1 = 'Door Ext. Boutique (Brussels) - CA';
        Map<String, Object> doorAccount1FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[0],
                'B2B_CountryCode__c' => 'BE',
				'ShippingCountryCode' => 'BE',
                'B2B_POSType__c' => '2',
                'RecordTypeId' => doorRecordTypeId
        };
        String doorAccount2 = 'Door Multi-brand Retailer (Brussels)';
        Map<String, Object> doorAccount2FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[1],
                'B2B_CountryCode__c' => 'BE',
                'ShippingCountryCode' => 'BE',
                'B2B_POSType__c' => '1',
                'RecordTypeId' => doorRecordTypeId
        };
        String doorAccount3 = 'Door Multi-brand Retailer (Antwerp)';
        Map<String, Object> doorAccount3FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[2],
                'B2B_CountryCode__c' => 'BE',
                'ShippingCountryCode' => 'BE',
                'B2B_POSType__c' => '1',
                'RecordTypeId' => doorRecordTypeId
        };
        String doorAccount4 = 'Door Ext. Boutique (Amsterdam) - CA';
        Map<String, Object> doorAccount4FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[3],
                'B2B_CountryCode__c' => 'NL',
                'ShippingCountryCode' => 'NL',
                'B2B_POSType__c' => '2',
                'RecordTypeId' => doorRecordTypeId
        };
        String doorAccount5 = 'Door Multi-brand Retailer (Amsterdam)';
        Map<String, Object> doorAccount5FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[4],
                'B2B_CountryCode__c' => 'NL',
                'ShippingCountryCode' => 'NL',
                'B2B_POSType__c' => '2',
                'RecordTypeId' => doorRecordTypeId
        };
        String doorAccount6 = 'Door Multi-brand Retailer (Rotterdam)';
        Map<String, Object> doorAccount6FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => doorAccountExternalIds2[5],
                'B2B_CountryCode__c' => 'NL',
                'ShippingCountryCode' => 'NL',
                'B2B_POSType__c' => '2',
                'RecordTypeId' => doorRecordTypeId
        };



        String brandedPOS1 = 'Ext. Boutique (Brussels) - CA';
        Map<String, Object> pos1FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => brandedPOSExternalIds2[0],
                'B2B_DistributionChannel__c' => '02',
                'B2B_POSType__c' => '2',
                'B2B_Maison__c' => 'CA',
                'B2B_CountryCode__c' => 'BE',
                'ShippingCountryCode' => 'BE',
                'B2B_POSLegacyToBeDisplayed__c' => '102042',
                'B2B_ITLegacySystem__c' => 'UT100',
                'RecordTypeId' => posRecordTypeId
        };
        String brandedPOS2 = 'Multi-brand Retailer (Brussels) - CA';
        Map<String, Object> pos2FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => brandedPOSExternalIds2[1],
                'B2B_DistributionChannel__c' => '02',
                'B2B_POSType__c' => '1',
                'B2B_Maison__c' => 'CA',
                'B2B_CountryCode__c' => 'BE',
                'ShippingCountryCode' => 'BE',
                'B2B_POSLegacyToBeDisplayed__c' => '102041',
                'B2B_ITLegacySystem__c' => 'UT100',
                'RecordTypeId' => posRecordTypeId
        };
        String brandedPOS3 = 'Multi-brand Retailer (Brussels) - MB';
        Map<String, Object> pos3FieldValues = new Map<String, Object>{
                'B2B_ExternalId__c' => brandedPOSExternalIds2[2],
                'B2B_DistributionChannel__c' => '02',
                'B2B_POSType__c' => '1',
                'B2B_Maison__c' => 'MB',
                'B2B_CountryCode__c' => 'BE',
                'ShippingCountryCode' => 'BE',
                'B2B_POSLegacyToBeDisplayed__c' => '102040',
                'B2B_ITLegacySystem__c' => 'UT100',
                'RecordTypeId' => posRecordTypeId
        };
        List<Account> doorAccounts = new List<Account>();
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount1, doorAccount1FieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount2, doorAccount2FieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount3, doorAccount3FieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount4, doorAccount4FieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount5, doorAccount5FieldValues, false));
        doorAccounts.add(UTL_DataFactory.createAccount(doorAccount6, doorAccount6FieldValues, false));

        List<Account> accounts = new List<Account>();
        accounts.add(UTL_DataFactory.createAccount(brandedPOS1, pos1FieldValues, false));
        accounts.add(UTL_DataFactory.createAccount(brandedPOS2, pos2FieldValues, false));
        accounts.add(UTL_DataFactory.createAccount(brandedPOS3, pos3FieldValues, false));

        if(localisation!=null){
            uow.registerRelationship(doorAccounts[0], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(doorAccounts[1], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(doorAccounts[2], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(doorAccounts[3], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(doorAccounts[4], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(doorAccounts[5], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(accounts[0], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(accounts[1], Account.B2B_Localisation__c, localisation);
            uow.registerRelationship(accounts[2], Account.B2B_Localisation__c, localisation);
        }
        uow.registerRelationship(accounts[0],Account.ParentId,doorAccounts[0]);
        uow.registerRelationship(accounts[1],Account.ParentId,doorAccounts[1]);
        uow.registerRelationship(accounts[2],Account.ParentId,doorAccounts[1]);

        List<BuyerAccount> buyerAccounts = new List<BuyerAccount>();
        BuyerAccount buyerAccount1 = new BuyerAccount();
        buyerAccount1.Name = accounts[0].Name;
        buyerAccount1.IsActive = true;
        buyerAccounts.add(buyerAccount1);

        BuyerAccount buyerAccount2 = new BuyerAccount();
        buyerAccount2.Name = accounts[1].Name;
        buyerAccount2.IsActive = true;
        buyerAccounts.add(buyerAccount2);

        BuyerAccount buyerAccount3 = new BuyerAccount();
        buyerAccount3.Name = accounts[2].Name;
        buyerAccount3.IsActive = true;
        buyerAccounts.add(buyerAccount3);

        BuyerAccount buyerAccount4 = new BuyerAccount();
        buyerAccount4.Name = doorAccounts[0].Name;
        buyerAccount4.IsActive = true;
        buyerAccounts.add(buyerAccount4);

        BuyerAccount buyerAccount5 = new BuyerAccount();
        buyerAccount5.Name = doorAccounts[1].Name;
        buyerAccount5.IsActive = true;
        buyerAccounts.add(buyerAccount5);

        BuyerAccount buyerAccount6 = new BuyerAccount();
        buyerAccount6.Name = doorAccounts[2].Name;
        buyerAccount6.IsActive = true;
        buyerAccounts.add(buyerAccount6);

        BuyerAccount buyerAccount7 = new BuyerAccount();
        buyerAccount7.Name = doorAccounts[3].Name;
        buyerAccount7.IsActive = true;
        buyerAccounts.add(buyerAccount7);

        BuyerAccount buyerAccount8 = new BuyerAccount();
        buyerAccount8.Name = doorAccounts[4].Name;
        buyerAccount8.IsActive = true;
        buyerAccounts.add(buyerAccount8);

        BuyerAccount buyerAccount9 = new BuyerAccount();
        buyerAccount9.Name = doorAccounts[5].Name;
        buyerAccount9.IsActive = true;
        buyerAccounts.add(buyerAccount9);

        uow.registerRelationship(buyerAccounts[0], BuyerAccount.BuyerId, accounts[0]);
        uow.registerRelationship(buyerAccounts[1], BuyerAccount.BuyerId, accounts[1]);
        uow.registerRelationship(buyerAccounts[2], BuyerAccount.BuyerId, accounts[2]);
        uow.registerRelationship(buyerAccounts[3], BuyerAccount.BuyerId, doorAccounts[0]);
        uow.registerRelationship(buyerAccounts[4], BuyerAccount.BuyerId, doorAccounts[1]);
        uow.registerRelationship(buyerAccounts[5], BuyerAccount.BuyerId, doorAccounts[2]);
        uow.registerRelationship(buyerAccounts[6], BuyerAccount.BuyerId, doorAccounts[3]);
        uow.registerRelationship(buyerAccounts[7], BuyerAccount.BuyerId, doorAccounts[4]);
        uow.registerRelationship(buyerAccounts[8], BuyerAccount.BuyerId, doorAccounts[5]);


        uow.registerNew(doorAccounts);
        uow.registerNew(accounts);
        uow.registerNew(buyerAccounts);
        return accounts;
    }

	public static B2B_GlobalContstants__c createGlobalConstantsSetting(UTL_SObjectUnitOfWork uow) {
		B2B_GlobalContstants__c globalConstants = new B2B_GlobalContstants__c();		
		globalConstants.B2B_EClientUnlockCode__c = '12345';
		uow.registerNew(globalConstants);

		return globalConstants;
	}

    public static B2B_OrdersInProcess__c createOrdersInProcessSetting(UTL_SObjectUnitOfWork uow) {
        B2B_OrdersInProcess__c ordersInProcess = new B2B_OrdersInProcess__c();
        ordersInProcess.Name = 'Weeks';
        ordersInProcess.B2B_WeeksInTime__c = 4.00;
        uow.registerNew(ordersInProcess);

        return ordersInProcess;
    }

    public static List<B2B_Localisation__c> createLocalisationWithParentLocalisation(UTL_SObjectUnitOfWork uow) {
        List<B2B_Localisation__c> localisations = new List<B2B_Localisation__c>();
        B2B_Localisation__c businessUnitLocalisationMB = new B2B_Localisation__c(B2B_ExternalId__c = 'MB_11', B2B_LocalisationLevel__c = 'Market/BU', B2B_Maison__c = 'MB');
        B2B_Localisation__c businessUnitLocalisationCA = new B2B_Localisation__c(B2B_ExternalId__c = 'CA_11', B2B_LocalisationLevel__c = 'Market/BU', B2B_Maison__c = 'CA');
        B2B_Localisation__c salesOrgLocalisation1 = new B2B_Localisation__c(B2B_ExternalId__c = '06CA', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation2 = new B2B_Localisation__c(B2B_ExternalId__c = '06MB', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation3 = new B2B_Localisation__c(B2B_ExternalId__c = '07CA', B2B_LocalisationLevel__c = 'Sales Org');

        localisations.add(salesOrgLocalisation1);
        localisations.add(salesOrgLocalisation2);
        localisations.add(salesOrgLocalisation3);
        localisations.add(businessUnitLocalisationCA);
        localisations.add(businessUnitLocalisationMB);

        uow.registerRelationship(salesOrgLocalisation1, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisationCA);
        uow.registerRelationship(salesOrgLocalisation2, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisationMB);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisationCA);
        uow.registerUpsert(localisations);


        return localisations;
    }

    public static List<String> createDefaultPriceLists(UTL_SObjectUnitOfWork uow) {
        List<B2B_DefaultPriceList__c> defaultPriceLists = new List<B2B_DefaultPriceList__c>();

        List<String> priceListNames = new List<String>();
        priceListNames.add('CACA');
        priceListNames.add('CHCA');
        priceListNames.add('CHMB');
        priceListNames.add('CHMB');
        B2B_DefaultPriceList__c defaultPriceList1 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'CA', B2B_CountryId__c = 'BE', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(0));
        B2B_DefaultPriceList__c defaultPriceList2 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'CA', B2B_CountryId__c = 'NL', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(1));
        B2B_DefaultPriceList__c defaultPriceList3 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'MB', B2B_CountryId__c = 'NL', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(2));
        B2B_DefaultPriceList__c defaultPriceList4 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'MB', B2B_CountryId__c = 'BE', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(3));


        defaultPriceLists.add(defaultPriceList1);
        defaultPriceLists.add(defaultPriceList2);
        defaultPriceLists.add(defaultPriceList3);
        defaultPriceLists.add(defaultPriceList4);

        uow.registerNew(defaultPriceLists);
        return priceListNames;
    }

	public static List<String> createDefaultPriceListsWithSalesOrgs(UTL_SObjectUnitOfWork uow, B2B_Localisation__c salesOrg) {
		List<B2B_DefaultPriceList__c> defaultPriceLists = new List<B2B_DefaultPriceList__c>();

		List<String> priceListNames = new List<String>();
		priceListNames.add('CACA');
		priceListNames.add('CHCA');
		priceListNames.add('CHMB');
		priceListNames.add('BEMB');
		B2B_DefaultPriceList__c defaultPriceList1 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'CA', B2B_CountryId__c = 'BE', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(0));
		B2B_DefaultPriceList__c defaultPriceList2 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'CA', B2B_CountryId__c = 'NL', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(1));
		B2B_DefaultPriceList__c defaultPriceList3 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'MB', B2B_CountryId__c = 'NL', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(2));
		B2B_DefaultPriceList__c defaultPriceList4 = new B2B_DefaultPriceList__c(B2B_Maison__c = 'MB', B2B_CountryId__c = 'BE', B2B_DistributionChannel__c = '02', B2B_PriceListName__c = priceListNames.get(3));

		uow.registerRelationship(defaultPriceList1, B2B_DefaultPriceList__c.B2B_SalesOrg__c, salesOrg);
		uow.registerRelationship(defaultPriceList2, B2B_DefaultPriceList__c.B2B_SalesOrg__c, salesOrg);
		uow.registerRelationship(defaultPriceList3, B2B_DefaultPriceList__c.B2B_SalesOrg__c, salesOrg);
		uow.registerRelationship(defaultPriceList4, B2B_DefaultPriceList__c.B2B_SalesOrg__c, salesOrg);

		defaultPriceLists.add(defaultPriceList1);
		defaultPriceLists.add(defaultPriceList2);
		defaultPriceLists.add(defaultPriceList3);
		defaultPriceLists.add(defaultPriceList4);

		uow.registerNew(defaultPriceLists);
		return priceListNames;
	}

    public static B2B_Localisation__c createLocalisationWithParentLocalisationAndBuyerGroups(UTL_SObjectUnitOfWork uow) {
        List<B2B_Localisation__c> localisations = new List<B2B_Localisation__c>();

        B2B_Localisation__c businessUnitLocalisation1 = new B2B_Localisation__c(Name = 'Switzerland', B2B_ExternalId__c = 'CA_11', B2B_LocalisationLevel__c = 'Business Unit', B2B_Maison__c = 'CA');
        B2B_Localisation__c businessUnitLocalisation2 = new B2B_Localisation__c(Name = 'Switzerland', B2B_ExternalId__c = 'MB_11', B2B_LocalisationLevel__c = 'Business Unit', B2B_Maison__c = 'MB');
        B2B_Localisation__c businessUnitLocalisation3 = new B2B_Localisation__c(Name = 'Switzerland', B2B_ExternalId__c = 'JL_11', B2B_LocalisationLevel__c = 'Business Unit', B2B_Maison__c = 'JL');
        B2B_Localisation__c businessUnitLocalisation4 = new B2B_Localisation__c(Name = 'Benelux', B2B_ExternalId__c = 'CA_8', B2B_LocalisationLevel__c = 'Business Unit', B2B_Maison__c = 'CA');

        B2B_Localisation__c salesOrgLocalisation1 = new B2B_Localisation__c(Name = '06CA', B2B_ExternalId__c = '06CA', B2B_Maison__c = 'CA', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation2 = new B2B_Localisation__c(Name = 'CHCA', B2B_ExternalId__c = 'CHCA', B2B_Maison__c = 'CA', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation3 = new B2B_Localisation__c(Name = '06MB', B2B_ExternalId__c = '06MB', B2B_Maison__c = 'MB', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation4 = new B2B_Localisation__c(Name = 'CHMB', B2B_ExternalId__c = 'CHMB', B2B_Maison__c = 'MB', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation5 = new B2B_Localisation__c(Name = '06JL', B2B_ExternalId__c = '06JL', B2B_Maison__c = 'JL', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation6 = new B2B_Localisation__c(Name = 'CHJL', B2B_ExternalId__c = 'CHJL', B2B_Maison__c = 'JL', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation7 = new B2B_Localisation__c(Name = 'Y6JL', B2B_ExternalId__c = 'Y6JL', B2B_Maison__c = 'JL', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation8 = new B2B_Localisation__c(Name = '0ACA', B2B_ExternalId__c = '0ACA', B2B_Maison__c = 'CA', B2B_LocalisationLevel__c = 'Sales Org');
        B2B_Localisation__c salesOrgLocalisation9 = new B2B_Localisation__c(Name = '0AMB', B2B_ExternalId__c = '0AMB', B2B_Maison__c = 'MB', B2B_LocalisationLevel__c = 'Sales Org');

        localisations.add(salesOrgLocalisation1);
        localisations.add(salesOrgLocalisation2);
        localisations.add(salesOrgLocalisation3);
        localisations.add(salesOrgLocalisation4);
        localisations.add(salesOrgLocalisation5);
        localisations.add(salesOrgLocalisation6);
        localisations.add(salesOrgLocalisation7);
        localisations.add(salesOrgLocalisation8);
        localisations.add(salesOrgLocalisation9);
        localisations.add(businessUnitLocalisation1);
        localisations.add(businessUnitLocalisation2);
        localisations.add(businessUnitLocalisation3);
        localisations.add(businessUnitLocalisation4);

        uow.registerRelationship(salesOrgLocalisation1, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation1);
        uow.registerRelationship(salesOrgLocalisation2, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation1);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation2);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation2);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation3);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation3);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation3);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation4);
        uow.registerRelationship(salesOrgLocalisation3, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisation2);
        uow.registerNew(localisations);

        List<BuyerGroup> buyerGroups = new List<BuyerGroup>();

        BuyerGroup buyerGroup1 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'BE', B2B_POSType__c = '1', Name = 'CA_8_0ACA_BE_1', B2B_ExternalId__c = 'CA_8_0ACA_BE_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup2 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'BE', B2B_POSType__c = '2', Name = 'CA_8_0ACA_BE_2', B2B_ExternalId__c = 'CA_8_0ACA_BE_2', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup3 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'NL', B2B_POSType__c = '1', Name = 'CA_8_0ACA_NL_1', B2B_ExternalId__c = 'CA_8_0ACA_NL_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup4 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'NL', B2B_POSType__c = '2', Name = 'CA_8_0ACA_NL_2', B2B_ExternalId__c = 'CA_8_0ACA_NL_2', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup5 = new BuyerGroup(B2B_BrandId__c = 'MB', B2B_CountryCode__c = 'BE', B2B_POSType__c = '1', Name = 'MB_8_0AMB_BE_1', B2B_ExternalId__c = 'MB_8_0AMB_BE_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup6 = new BuyerGroup(B2B_BrandId__c = 'MB', B2B_CountryCode__c = 'NL', B2B_POSType__c = '1', Name = 'MB_8_0AMB_NL_1', B2B_ExternalId__c = 'MB_8_0AMB_NL_1', B2B_DistributionChannel__c = '02');

        buyerGroups.add(buyerGroup1);
        buyerGroups.add(buyerGroup2);
        buyerGroups.add(buyerGroup3);
        buyerGroups.add(buyerGroup4);
        buyerGroups.add(buyerGroup5);
        buyerGroups.add(buyerGroup6);

        uow.registerRelationship(buyerGroup1, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation8);
        uow.registerRelationship(buyerGroup2, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation8);
        uow.registerRelationship(buyerGroup3, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation8);
        uow.registerRelationship(buyerGroup4, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation8);
        uow.registerRelationship(buyerGroup5, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation9);
        uow.registerRelationship(buyerGroup6, BuyerGroup.B2B_Localisation__c, salesOrgLocalisation9);
        uow.registerNew(buyerGroups);

        return salesOrgLocalisation8;
    }

    public static List<B2B_Localisation__c> createLocalisations(UTL_SObjectUnitOfWork uow) {
        List<B2B_Localisation__c> localisations = new List<B2B_Localisation__c>();
        B2B_Localisation__c localisation = new B2B_Localisation__c(B2B_ExternalId__c = externalIdsLocalisation[0]);
        localisations.add(localisation);
        uow.registerNew(localisations);
        return localisations;
    }

    public static List<B2B_CategoryHierarchy__c> createLargeCategoryHierarchies(UTL_SObjectUnitOfWork uow){
        List<B2B_CategoryHierarchy__c> categories = createCategoryHierarchies(uow);

        B2B_CategoryHierarchy__c c1 = new B2B_CategoryHierarchy__c(Name='CAA05081', B2B_CategoryType__c='GC', B2B_ExternalId__c='PI_GC_CAA05081', B2B_Description__c='PI_GC_CAA05081');
        B2B_CategoryHierarchy__c c2 = new B2B_CategoryHierarchy__c(Name='CAA07002', B2B_CategoryType__c='MC', B2B_ExternalId__c='PI_MC_CAA07002', B2B_Description__c='PI_MC_CAA07002');
        B2B_CategoryHierarchy__c c3 = new B2B_CategoryHierarchy__c(Name='CAA11014', B2B_CategoryType__c='C', B2B_ExternalId__c='PI_C_CAA11014', B2B_Description__c='PI_C_CAA11014');
        B2B_CategoryHierarchy__c c4 = new B2B_CategoryHierarchy__c(Name='PGC37Y1200', B2B_CategoryType__c='SC', B2B_ExternalId__c='PI_SC_PGC37Y1200', B2B_Description__c='PI_SC_PGC37Y1200');

        uow.registerRelationship(c2, B2B_CategoryHierarchy__c.B2B_ParentId__c, c1);
        uow.registerRelationship(c3, B2B_CategoryHierarchy__c.B2B_ParentId__c, c2);
        uow.registerRelationship(c4, B2B_CategoryHierarchy__c.B2B_ParentId__c, c3);

        List<B2B_CategoryHierarchy__c> moreCategories = new List<B2B_CategoryHierarchy__c>{c1, c2, c3, c4};
        uow.registerNew(moreCategories);
        categories.addAll(moreCategories);
        return categories;
    }

    public static List<B2B_CategoryHierarchy__c> createCategoryHierarchies(UTL_SObjectUnitOfWork uow){

        B2B_CategoryHierarchy__c c1 = new B2B_CategoryHierarchy__c(Name='PIA05081', B2B_CategoryType__c='GC', B2B_ExternalId__c='PI_GC_PIA05081', B2B_Description__c='PI_GC_PIA05081');
        B2B_CategoryHierarchy__c c2 = new B2B_CategoryHierarchy__c(Name='PIA07002', B2B_CategoryType__c='MC', B2B_ExternalId__c='PI_MC_PIA07002', B2B_Description__c='PI_MC_PIA07002');
        B2B_CategoryHierarchy__c c3 = new B2B_CategoryHierarchy__c(Name='PIA11014', B2B_CategoryType__c='C', B2B_ExternalId__c='PI_C_PIA11014', B2B_Description__c='PI_C_PIA11014');
        B2B_CategoryHierarchy__c c4 = new B2B_CategoryHierarchy__c(Name='PGG37Y1200', B2B_CategoryType__c='SC', B2B_ExternalId__c='PI_SC_PGG37Y1200', B2B_Description__c='PI_SC_PGG37Y1200');

        uow.registerRelationship(c2, B2B_CategoryHierarchy__c.B2B_ParentId__c, c1);
        uow.registerRelationship(c3, B2B_CategoryHierarchy__c.B2B_ParentId__c, c2);
        uow.registerRelationship(c4, B2B_CategoryHierarchy__c.B2B_ParentId__c, c3);

        List<B2B_CategoryHierarchy__c> categories = new List<B2B_CategoryHierarchy__c>{c1, c2, c3, c4};

        uow.registerNew(categories);
        return categories;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<Product2>:	Returns the list of Products
    **************************************************************************************************************************************************************************/
    public static List<Product2> createProductsWithDefaultValues(UTL_SObjectUnitOfWork uow) {
        String simpleProductName1 = 'Tank Solo watch';
        Map<String, Object> additionalFieldValuesProduct1 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[0],
                'B2B_GlobalReference__c' => productSKUs[0],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c'=>'12345',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001',
                'B2B_SAPLifeCycleCode__c' => '10',
                'B2B_WarehouseStock_CA__c' => '06CA_1_Green;06CA_1_Orange;06CA_1_Red;'


        };
        String simpleProductName2 = 'Santos 100 watch';
        Map<String, Object> additionalFieldValuesProduct2 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[1],
                'B2B_GlobalReference__c' => productSKUs[1],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
				'B2B_SAPLocalReference__c'=>'1234578',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001',
                'B2B_SAPLifeCycleCode__c' => '10',
                'B2B_WarehouseStock_CA__c' => '06CA_1_Green;06CA_1_Orange;06CA_1_Red'

        };

        String simpleProductName3 = 'Montblanc 1858 Monopusher Chronograph';
        Map<String, Object> additionalFieldValuesProduct3 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[2],
                'B2B_GlobalReference__c' => productSKUs[2],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c'=>'1234578',
                'B2B_Maison__c' => 'MB',
                'B2B_MerchandiseCategory__c' => 'MB0101001',
                'B2B_SAPLifeCycleCode__c' => '10',
                'B2B_WarehouseStock_MB__c' => '06MB_1_Green;06MB_1_Orange;06MB_1_Red',
                'B2B_IsManagedIndividualNumber__c' => true


        };
        String simpleProductName4 = 'Ballerine wedding band';
        Map<String, Object> additionalFieldValuesProduct4 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[3],
                'B2B_GlobalReference__c' => productSKUs[3],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c'=>'1234578',
                'B2B_Maison__c' => 'MB',
                'B2B_MerchandiseCategory__c' => 'MB0101001',
                'B2B_SAPLifeCycleCode__c' => '10',
                'B2B_WarehouseStock_MB__c' => '06MB_1_Green;06MB_1_Orange;06MB_1_Red'


        };
        String simpleProductName5 = 'Ballon Bleu de Cartier watch';
        Map<String, Object> additionalFieldValuesProduct5 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[4],
                'B2B_GlobalReference__c' => productSKUs[4],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c'=>'1234578',
                'B2B_Maison__c' => 'MB',
                'B2B_MerchandiseCategory__c' => 'MB0101001',
                'B2B_SAPLifeCycleCode__c' => '25',
                'B2B_WarehouseStock_MB__c' => '06MB_1_Green;06MB_1_Orange;06MB_1_Red'


		};
		String simpleProductName6 = 'Tank Solo watch strap';
        Map<String, Object> additionalFieldValuesProduct6 = new Map<String, Object>{

                'StockKeepingUnit' => productSKUs[5],
                'B2B_GlobalReference__c' => productSKUs[5],
                'B2B_ProductType__c' => '04',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c'=>'12345789',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001',
                'B2B_SAPLifeCycleCode__c' => '10',
                'B2B_WarehouseStock_CA__c' => '06CA_1_Green;06CA_1_Orange;06CA_1_Red;'


        };
        List<Product2> products = new List<Product2>();
        products.add(UTL_DataFactory.createProduct(simpleProductName1, productSKUs[0], additionalFieldValuesProduct1, false));
        products.add(UTL_DataFactory.createProduct(simpleProductName3, productSKUs[2], additionalFieldValuesProduct3, false));
        products.add(UTL_DataFactory.createProduct(simpleProductName2, productSKUs[1], additionalFieldValuesProduct2, false));
        products.add(UTL_DataFactory.createProduct(simpleProductName4, productSKUs[3], additionalFieldValuesProduct4, false));
		products.add(UTL_DataFactory.createProduct(simpleProductName5, productSKUs[4], additionalFieldValuesProduct5, false));
		products.add(UTL_DataFactory.createProduct(simpleProductName6, productSKUs[5], additionalFieldValuesProduct6, false));
        uow.registerNew(products);
        return products;

    }

    /*******************************************************************************************************************
    * @author       Kürsad Görgülü (kgorgulu@deloitte.com)
    * @description  This method creates translations for the products.
    * @date         March 2021
    * @param        products : List of products to be translated
    * @return       translations : a list of translation records
    *******************************************************************************************************************/
    public static List<Product2DataTranslation> createProductTranslations(UTL_SObjectUnitOfWork uow, List<Product2> products) {
        List<Product2DataTranslation> translations = new List<Product2DataTranslation>();
        for(Product2 p : products){
            Product2DataTranslation translation = new Product2DataTranslation(Name = 'German ' + p.Name, Description = 'German Description', Language = 'de');
            uow.registerRelationship(translation, Product2DataTranslation.ParentId, p);
            translations.add(translation);
        }
        uow.registerNew(translations);
        return translations;
    }



    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates variant products
    * @date         2021-03-11
    * @param        uow Unit of Work
    * @return       List<Product2>:Returns the generated products
    **************************************************************************************************************************************************************************/
    public static List<Product2> createProductVariants(UTL_SObjectUnitOfWork uow) {

        String variantProductName = 'Tank Solo watch Variant Parent';
        Map<String, Object> additionalFieldValuesVariantProduct = new Map<String, Object>{

                'StockKeepingUnit' => variantProductSKUs[0],
                'B2B_GlobalReference__c' => variantProductSKUs[0],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c' => '12345',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001',
                'Type' => 'Base'


        };

        List<Product2> variantParentProducts = new List<Product2>();
        variantParentProducts.add(UTL_DataFactory.createProduct(variantProductName, variantProductSKUs[0], additionalFieldValuesVariantProduct, false));
        uow.registerNew(variantParentProducts);

        ProductAttributeSet pdtAttributeSet = [SELECT Id, DeveloperName FROM ProductAttributeSet];
        ProductAttributeSetProduct pdtAttributeSetProduct = new ProductAttributeSetProduct();
        pdtAttributeSetProduct.ProductAttributeSetId = pdtAttributeSet.Id;

        uow.registerRelationship(pdtAttributeSetProduct, ProductAttributeSetProduct.ProductId, variantParentProducts[0]);
        uow.registerNew(pdtAttributeSetProduct);

        List<Product2> productVariants = B2B_UTL_DataFactory.createChildVariantProductsWithDefaultValues(uow);


        List<ProductAttribute> productAttributes = new List<ProductAttribute>();
        ProductAttribute prodAttribute1 = new ProductAttribute();
        prodAttribute1.B2B_ExternalId__c = 'PA_' + variantParentProducts[0].B2B_GlobalReference__c + '_' + productVariants[0].B2B_GlobalReference__c;
        prodAttribute1.B2B_Size__c = '10cm';
        productAttributes.add(prodAttribute1);
        ProductAttribute prodAttribute2 = new ProductAttribute();
        prodAttribute1.B2B_ExternalId__c = 'PA_' + variantParentProducts[0].B2B_GlobalReference__c + '_' + productVariants[1].B2B_GlobalReference__c;
        prodAttribute2.B2B_Size__c = '15cm';
        productAttributes.add(prodAttribute2);

        uow.registerRelationship(prodAttribute1, ProductAttribute.VariantParentId, variantParentProducts[0]);
        uow.registerRelationship(prodAttribute1, ProductAttribute.ProductId, productVariants[0]);
        uow.registerRelationship(prodAttribute2, ProductAttribute.VariantParentId, variantParentProducts[0]);
        uow.registerRelationship(prodAttribute2, ProductAttribute.ProductId, productVariants[1]);
        uow.registerNew(productAttributes);

        return variantParentProducts;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-03-11
    * @return       List<Product2>:	Returns the list of child variant Products
    **************************************************************************************************************************************************************************/
    public static List<Product2> createChildVariantProductsWithDefaultValues(UTL_SObjectUnitOfWork uow) {
        String variantProductName1 = 'VP-Tank Solo watch';
        Map<String, Object> additionalFieldValuesVariantProduct1 = new Map<String, Object>{

                'StockKeepingUnit' => variantProductSKUs[1],
                'B2B_GlobalReference__c' => variantProductSKUs[1],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_SAPLocalReference__c' => '12345',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001'


        };
        String variantProductName2 = 'VP-Santos 100 watch';
        Map<String, Object> additionalFieldValuesVariantProduct2 = new Map<String, Object>{

                'StockKeepingUnit' => variantProductSKUs[2],
                'B2B_GlobalReference__c' => variantProductSKUs[2],
                'B2B_ProductType__c' => '01',
                'IsActive' => True,
                'Family' => 'WMF',
                'B2B_Maison__c' => 'CA',
                'B2B_MerchandiseCategory__c' => 'CA0101001'

        };
        String simpleProductName3 = 'Montblanc 1858 Monopusher Chronograph';
        List<Product2> variantChildProducts = new List<Product2>();
        variantChildProducts.add(UTL_DataFactory.createProduct(variantProductName1, variantProductSKUs[1], additionalFieldValuesVariantProduct1, false));
        variantChildProducts.add(UTL_DataFactory.createProduct(variantProductName2, variantProductSKUs[2], additionalFieldValuesVariantProduct2, false));
        uow.registerNew(variantChildProducts);
        return variantChildProducts;

    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method return mock response for connectapi for pricing information
    * @date         2021-03-11
    * @return       Connectapi.pricingResult:	Returns the list of pricing result line items mock results
    **************************************************************************************************************************************************************************/

    public static ConnectApi.ProductDetail getProductDetailConnectApiMockResponse(List<Id> productIds){

        Map<String,String> fieldsMap = new Map<String,String>{
                'name'=>'test product'};
        ConnectApi.ProductClass productName;
        ConnectApi.ProductAttributeSet prodAttribute = new ConnectApi.ProductAttributeSet();
        ConnectApi.ProductAttributeInfo prodAttributeInfo = new ConnectApi.ProductAttributeInfo();
        ConnectApi.ProductAttributeSetInfo prodAttributeSetInfo = new ConnectApi.ProductAttributeSetInfo();
        prodAttributeSetInfo.attributeInfo= new Map<String,ConnectApi.ProductAttributeInfo>{'test'=>prodAttributeInfo};
        Map<String, ConnectApi.ProductAttributeSetInfo> attributeSetInfoMap= new Map<String, ConnectApi.ProductAttributeSetInfo>{
                'test'=>prodAttributeSetInfo
        };
        ConnectApi.ProductMedia prodMedia = new ConnectApi.ProductMedia();
        ConnectApi.ProductEntitlement prodEntitlement = new ConnectApi.ProductEntitlement();
        ConnectApi.ProductMediaUsageType prodMediaUsage;
        ConnectApi.ProductMediaGroup prodMediaGroup = new ConnectApi.ProductMediaGroup();
        prodMediaGroup.usageType = prodMediaUsage;
        List<ConnectApi.ProductMediaGroup> prodMediaList = new List<ConnectApi.ProductMediaGroup>{prodMediaGroup};
        ConnectApi.ProductCategoryPath prodCategory = new ConnectApi.ProductCategoryPath();
        ConnectApi.ProductVariationInfo prodVariationInfo = new  ConnectApi.ProductVariationInfo();
        ConnectApi.ProductAttributesToProductEntry productEntry = new  ConnectApi.ProductAttributesToProductEntry();
        productEntry.productId=productIds[0];
        productEntry.canonicalKey='1';
        List<ConnectApi.ProductAttributesToProductEntry> prodEntries = new List<ConnectApi.ProductAttributesToProductEntry>{productEntry};
        prodVariationInfo.attributesToProductMappings= prodEntries;

        ConnectApi.ProductDetail productResponse = new ConnectApi.ProductDetail();
        productResponse.attributeSetInfo = attributeSetInfoMap;
        productResponse.defaultImage = prodMedia;
        productResponse.entitlement = prodEntitlement;
        productResponse.fields = fieldsMap;
        productResponse.Id = null;
        productResponse.mediaGroups = prodMediaList;
        productResponse.primaryProductCategoryPath = prodCategory;
        productResponse.productClass = productName;
        productResponse.variationAttributeSet = prodAttribute;
        productResponse.variationInfo = prodVariationInfo;
        productResponse.variationParentId = null;

        return productResponse;
    }

	public static ConnectApi.ProductOverviewCollection getProductsOverviewByProductIdsConnectApiMockResponseOK(List<Id> productIds){
		ConnectApi.ProductOverviewCollection poc = new ConnectApi.ProductOverviewCollection();

		poc.products = new List<ConnectApi.ProductOverview>();
		for (Id pId : productIds) {
			ConnectApi.ProductOverview po = new ConnectApi.ProductOverview();
			po.id = pId;
			po.success = true;
			poc.products.add(po);
		}
		poc.total = productIds.size();

		return poc;
	}

	public static ConnectApi.ProductOverviewCollection getProductsOverviewByProductIdsConnectApiMockResponseKO(List<Id> productIds){
		ConnectApi.ProductOverviewCollection poc = new ConnectApi.ProductOverviewCollection();

		poc.products = new List<ConnectApi.ProductOverview>();
		for (Id pId : productIds) {
			ConnectApi.ProductOverview po = new ConnectApi.ProductOverview();
			po.id = null;
			po.success = false;
			po.error = new ConnectApi.ErrorResponse();
			po.error.errorCode = 'PRODUCT_NOT_FOUND';
			po.error.message = 'A nice error message';
			poc.products.add(po);
		}
		poc.total = productIds.size();

		return poc;
	}

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method return mock response for connectapi for pricing information
    * @date         2021-03-11
    * @return       Connectapi.pricingResult:	Returns the list of pricing result line items mock results
    **************************************************************************************************************************************************************************/
    public static ConnectApi.PricingResult getPricingConnectApiMockResponse(Id productId) {
        ConnectApi.PricingLineItemInput pliInput = new ConnectApi.PricingLineItemInput();
        List<ConnectApi.PricingLineItemInput> pliInputs = new List<ConnectApi.PricingLineItemInput>{
                pliInput
        };

        ConnectApi.PricingInput pricingInput = new ConnectApi.PricingInput();
        pricingInput.pricingLineItems = pliInputs;

        ConnectApi.ErrorResponse error = new ConnectApi.ErrorResponse();
        error.errorCode = '';

        ConnectApi.PricingResultLineItem pli = new ConnectApi.PricingResultLineItem();
        pli.unitPrice = '100';
        pli.Success = true;
        pli.productId = productId;
        pli.error = error;
        pli.pricebookEntryId = '';

        List<ConnectApi.PricingResultLineItem> plis = new List<ConnectApi.PricingResultLineItem>();
        plis.add(pli);

        ConnectApi.PricingResult pricingInformationResponse = new ConnectApi.PricingResult();
        pricingInformationResponse.pricingLineItemResults = plis;
        pricingInformationResponse.currencyIsoCode = 'CHF';
        pricingInformationResponse.success = true;
        pricingInformationResponse.error = error;


        return pricingInformationResponse;
	}

	public static B2B_Cart_CAPI mockCartCAPIFunctions() {
        B2B_UTL_GlobalConstants.webStoreId = B2B_UTL_DataFactory.getDefaultWebstoreId;

        ConnectApi.CartSummary cartSmry = new ConnectApi.CartSummary();
        cartSmry.cartId = [SELECT Id FROM WebCart WHERE Name = 'Dummy' LIMIT 1].Id;
        cartSmry.accountId = B2B_UTL_DataFactory.effectiveAccounts[0].Id;
		cartSmry.name = 'test';
		cartSmry.grandTotalAmount = '1';
		cartSmry.totalChargeAmount = '1';
		cartSmry.totalProductAmount = '1';
		cartSmry.totalProductCount = '1';
		cartSmry.totalTaxAmount = '1';
		cartSmry.status = ConnectApi.CartStatus.Active;
		cartSmry.type = ConnectApi.CartType.Cart;

        //Output Result Mock
        List<ConnectApi.BatchResult> batchResults = new List<ConnectApi.BatchResult>();
        ConnectApi.CartItem cartItemSuccess = new ConnectApi.CartItem();
        ConnectApi.CartItemProduct cartItemProduct = new ConnectApi.CartItemProduct();
        cartItemProduct.sku = B2B_UTL_DataFactory.productSKUs[1];

        cartItemSuccess.productDetails = cartItemProduct;
        ConnectApi.BatchResult successBatchResult = new ConnectApi.BatchResult(null, null);
        successBatchResult.isSuccess = true;
        successBatchResult.result = cartItemSuccess;
        batchResults.add(successBatchResult);
        ConnectApi.BatchResult failureBatchResult = new ConnectApi.BatchResult(null, null);
        failureBatchResult.isSuccess = false;
        failureBatchResult.result = cartItemSuccess;
        batchResults.add(failureBatchResult);


        ConnectApi.CartItem cartItem = new ConnectApi.CartItem();
        cartItem.listPrice = '' + 0;
        cartItem.salesPrice = '' + 12000.00;
        cartItem.totalAdjustmentAmount = '' + 0.00;
        cartItem.totalListPrice = '' + 0;
        cartItem.totalPrice = '' + 84000.00;
        cartItem.unitAdjustedPrice = '' + 12000.00;
        cartItem.unitAdjustmentAmount = '' + 0.00;

        ConnectApi.AbstractCartItem abstractCartItem = (ConnectApi.AbstractCartItem) cartItem;
        abstractCartItem.quantity = '' + 7;
        abstractCartItem.type = ConnectApi.CartItemType.Product;

        return (B2B_Cart_CAPI) Test.createStub(B2B_Cart_CAPI.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'getOrCreateActiveCartSummary' => cartSmry,
                'addItemsToCart' => batchResults,
                'deleteCartItem' => null,
                'updateCartItem' => abstractCartItem

        }));
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method create a Web Store test data
    * @date         2021-02-08
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return      Webstore:									Returns the generated webstore
    **************************************************************************************************************************************************************************/
    public static WebStore createWebStore(String storeName, Map<String, Object> additionalFieldValues, Boolean executeDML) {


        additionalFieldValues.put('Name', storeName);
        return createBulkWebStores(additionalFieldValues, 1, executeDML)[0];
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a multiple web Stores test data
    * @date         2021-02-08
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return       List<WebStore>:									Returns the generated webstores
    **************************************************************************************************************************************************************************/
    public static List<WebStore> createBulkWebStores(Map<String, Object> additionalFieldValues, Integer nbOfRecords, Boolean executeDML) {
        //1) Enrich Fields Values Map
        //additionalFieldValues = enrichFieldsValuesMapWithDefaultValues(additionalFieldValues, PRODUCT_FIELDS_DEFAULT_VALUES);

        //2) Generate and (Insert) the record
        return (List<WebStore>) UTL_DynamicApex.createBulkRecords('WebStore', additionalFieldValues, nbOfRecords, executeDML);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<WebStore>:	Returns the list of Web stores
    **************************************************************************************************************************************************************************/
    public static List<WebStore> createWebStoresWithDefaultValues(UTL_SObjectUnitOfWork uow) {
        String webStoreName1 = 'Cartier';
        String webStoreName2 = 'Montblanc';
        Map<String, Object> additionalFieldValuesCartier = new Map<String, Object>{
                'B2B_Maison__c' =>'CA',
				'B2B_MyCatalogURl__c' => 'https://cartier-rpc-dev.azurewebsites.net/start',
				'B2B_SetForYouURL__c' => 'https://sfy.cartier.com/ato/login/loginform.ato',
				'B2B_ReorderAccess__c' => true,
				'B2B_WarrantyExtensionRequestEnabled__c' => true,
				'B2B_isEstimatedDeliveryDateEnabled__c' => true
        };
        Map<String, Object> additionalFieldValuesMontblanc = new Map<String, Object>{
                'B2B_Maison__c' =>'MB',
				'B2B_ReorderAccess__c' => true,
				'B2B_WarrantyExtensionRequestEnabled__c' => true,
				'B2B_isEstimatedDeliveryDateEnabled__c' => false
        };

        List<WebStore> webStores = new List<WebStore>();
        webStores.add(B2B_UTL_DataFactory.createWebStore(webStoreName1, additionalFieldValuesCartier, false));
        webStores.add(B2B_UTL_DataFactory.createWebStore(webStoreName2, additionalFieldValuesMontblanc, false));
        uow.registerNew(webStores);
        return webStores;

    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<Contact>:  Returns the list of Contact
    **************************************************************************************************************************************************************************/
    public static Contact createContactWithDefaultValues(UTL_SObjectUnitOfWork uow, Account accountData) {

        Contact cnt = new Contact();
        cnt.FirstName = 'Default Test';
        cnt.LastName = 'User';
		cnt.B2B_TermsConditionsAccepted__c = false;
        uow.registerRelationship(cnt, Contact.AccountId, accountData);
        uow.registerNew(cnt);
        return cnt;

    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-03-16
    * @return       User:   Returns User
    **************************************************************************************************************************************************************************/

    public static User createUser(UTL_SObjectUnitOfWork uow, Contact userContact,String profileName){
        Profile userProfile = UTL_SF.getProfileByName(profileName);
        String userName = userContact !=null ? userContact.LastName+'ut': 'ut-testuser';
        Map<String,Object> userFieldValues = new Map<String,Object>{
                'alias' => 'tUser',
                'email' => userName+'@test.com',
				'B2B_ExternalId__c' => userName+'@test.com',
                'lastName' => userContact !=null ? userContact.LastName : 'User',
                'firstName' => userContact !=null ? userContact.FirstName : 'UT-Test',
                'userName' => userName+'@test.com',
                'profileId' => userProfile.Id,
                'emailEncodingKey' => 'UTF-8',
                'languageLocaleKey' => 'en_US',
                'localeSidKey' => 'en_US',
                'timeZoneSidKey' => 'America/Los_Angeles'

        };

        List<User> createdUser = new List<User>();
        createdUser.add((User)UTL_DynamicApex.createRecord('User', userFieldValues, false));
        if(userContact !=null) {
            uow.registerRelationship(createdUser[0], User.ContactId, userContact);
        }
        uow.registerNew(createdUser);
        return createdUser[0];
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method create a NavigationMenuItemLocalization test data
    * @date         2021-02-12
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return       NavigationMenuItemLocalization:									Returns the generated NavigationMenuItemLocalization
    **************************************************************************************************************************************************************************/
    public static NavigationMenuItemLocalization createNavigationLocal(String value, Map<String, Object> additionalFieldValues, Boolean executeDML) {

        additionalFieldValues.put('Value', value);
        return createBulkNavigationLocalization(additionalFieldValues, 1, executeDML)[0];
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a multiple NavigationMenuItemLocalizations test data
    * @date         2021-02-12
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return       List<NavigationMenuItemLocalization>:									Returns the generated NavigationMenuItemLocalizations
    **************************************************************************************************************************************************************************/
    public static List<NavigationMenuItemLocalization> createBulkNavigationLocalization(Map<String, Object> additionalFieldValues, Integer nbOfRecords, Boolean executeDML) {
        //1) Enrich Fields Values Map
        //additionalFieldValues = enrichFieldsValuesMapWithDefaultValues(additionalFieldValues, PRODUCT_FIELDS_DEFAULT_VALUES);

        //2) Generate and (Insert) the record
        return (List<NavigationMenuItemLocalization>) UTL_DynamicApex.createBulkRecords('NavigationMenuItemLocalization', additionalFieldValues, nbOfRecords, executeDML);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<DelegatedAccount>: Returns the list of Delegated Account
    **************************************************************************************************************************************************************************/
    public static List<DelegatedAccount> createDelegatedAccountWithDefaultValues(UTL_SObjectUnitOfWork uow, List<Account> accounts, User userData) {

        User userAccId = [SELECT AccountId FROM User WHERE ID  =:userData.Id LIMIT 1];
        List<DelegatedAccount> delegatedAccounts = new List<DelegatedAccount>();

        for(Account acc : accounts) {
            if (acc.Id != userAccId.AccountId && acc.B2B_ExternalId__c != doorAccountExternalIds[0] && acc.B2B_ExternalId__c != doorAccountExternalIds[1]){
                System.debug('delegated accounts -->'+ acc.Name);
                DelegatedAccount delegatedAccountData = new DelegatedAccount();
                delegatedAccountData.name = 'Delegated '+acc.Name;
                delegatedAccountData.AccessBuyFor = true;
                uow.registerRelationship(delegatedAccountData, DelegatedAccount.targetId, acc);
                uow.registerRelationship(delegatedAccountData, DelegatedAccount.ManagedById, userData);
                delegatedAccounts.add(delegatedAccountData);
            }
        }

        uow.registerNew(delegatedAccounts);
        return delegatedAccounts;

    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-12
    * @return       List<NavigationMenuItemLocalization>:	Returns the list of NavigationMenuItemLocalizations
    **************************************************************************************************************************************************************************/
    public static List<NavigationMenuItemLocalization> createNavigationMenuItemLocalizationsWithDefaultValues(UTL_SObjectUnitOfWork uow, List<NavigationMenuItem> navigationItems) {

        List<NavigationMenuItemLocalization> navigationItemsLocal = new List<NavigationMenuItemLocalization>();
        String value1 = 'Item 1';
        String value2 = 'Item 2';
        for(NavigationMenuItem item : navigationItems){
            Map<String, Object> additionalFieldValues = new Map<String, Object>{
                    'Language' => UserInfo.getLanguage()
                    , 'ParentId' => item.Id
            };

            navigationItemsLocal.add(B2B_UTL_DataFactory.createNavigationLocal(value1, additionalFieldValues, false));
        }

        uow.registerNew(navigationItemsLocal);

        return navigationItemsLocal;
    }

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

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a multiple product catalogs test data
    * @date         2021-02-08
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return       List<ProductCatalog>:									Returns the generated ProductCatalog
    **************************************************************************************************************************************************************************/
    public static List<ProductCatalog> createBulkCatalog(Map<String, Object> additionalFieldValues, Integer nbOfRecords, Boolean executeDML) {
        //1) Enrich Fields Values Map
        //additionalFieldValues = enrichFieldsValuesMapWithDefaultValues(additionalFieldValues, PRODUCT_FIELDS_DEFAULT_VALUES);

        //2) Generate and (Insert) the record
        return (List<ProductCatalog>) UTL_DynamicApex.createBulkRecords('ProductCatalog', additionalFieldValues, nbOfRecords, executeDML);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method create a Product Catalog test data
    * @date         2021-02-08
    * @param        additionalFieldValues (Map<String, Object>):	A map with the additional fields to be populated on the object
    * @param		nbOfRecords (Integer):							The number of records to be created
    * @param        executeDML (Boolean):							Indicates if the DML must be executed or not
    * @return      ProductCatalog:									Returns the generated ProductCatalog
    **************************************************************************************************************************************************************************/
    public static ProductCatalog createCatalog(String catalogId, Map<String, Object> additionalFieldValues, Boolean executeDML) {

        additionalFieldValues.put('Name', catalogId);
        additionalFieldValues.put('B2B_ExternalId__c', catalogId);
        return createBulkCatalog(additionalFieldValues, 1, executeDML)[0];
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<ProductCatalog>:	Returns the list of ProductCatalog
    **************************************************************************************************************************************************************************/
    public static List<ProductCatalog> createCatalog(UTL_SObjectUnitOfWork uow) {
        Map<String, Object> additionalFieldValues = new Map<String, Object>();
        List<ProductCatalog> catalogs = new List<ProductCatalog>();
        for (String webstoreexternalId : webstoreExternalIds) {
            catalogs.add(B2B_UTL_DataFactory.createCatalog(webstoreexternalId, additionalFieldValues, false));
        }
        uow.registerNew(catalogs);
        return catalogs;

    }
    /**************************************************************************************************************************************************************************
     * @author       Deloitte
     * @description  This method creates Product Category Products
     * @date         2021-05-11
     * @return       List<ProductCategoryProduct>:	Returns the list of Product Category Products
     **************************************************************************************************************************************************************************/
    public static List<ProductCategoryProduct> createProductCategoryProducts(UTL_SObjectUnitOfWork uow, List<Product2> products, List<ProductCategory> categories) {
        List<ProductCategoryProduct> categoryProducts = new List<ProductCategoryProduct>();

        ProductCategoryProduct pc = new ProductCategoryProduct();
        categoryProducts.add(pc);
        uow.registerRelationship(pc,ProductCategoryProduct.ProductCategoryId,categories[0]);
        uow.registerRelationship(pc,ProductCategoryProduct.ProductId,products[0]);
        uow.registerNew(categoryProducts);
        return categoryProducts;
    }
    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<ProductCategory>:	Returns the list of Product Categories
    **************************************************************************************************************************************************************************/
    public static List<ProductCategory> createCategoriesForCatalogs(UTL_SObjectUnitOfWork uow, List<ProductCatalog> productCatalogs) {
        List<ProductCategory> categories = new List<ProductCategory>();
		List<ProductCategory> allProductCategories = new List<ProductCategory>();
        for (Integer i=0; i < productCatalogs.size(); i++) {
			ProductCategory parentPc = new ProductCategory();
			parentPc.Name = productCatalogs[i].Name + '_ALLPRODUCTS';
			parentPc.B2B_IsNavigational__c = true;
			parentPc.B2B_IsAllProduct__c = true;
			parentPc.B2B_ExternalId__c = productCatalogs[i].Name + '_ALLPRODUCTS';
			uow.registerRelationship(parentPc, ProductCategory.CatalogId, productCatalogs[i]);
			allProductCategories.add(parentPc);
            for (Integer j=0; j < productCategories.size(); j++) {
                ProductCategory pc = new ProductCategory();
                pc.Name = productCategories[j];
	            pc.B2B_IsNavigational__c = true;
                pc.B2B_ExternalId__c = productCatalogs[i].Name + '_' + productCategories[j];
                uow.registerRelationship(pc, ProductCategory.CatalogId, productCatalogs[i]);
				uow.registerRelationship(pc, ProductCategory.ParentCategoryId, parentPc);
                categories.add(pc);
            }
        }
		uow.registerNew(allProductCategories);
        uow.registerNew(categories);
        return categories;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-09
    * @return       List<ProductCategoryDataTranslation>:	Returns the list of Product Categories translations
    **************************************************************************************************************************************************************************/
    public static List<ProductCategoryDataTranslation> createCategoriesTranslation(UTL_SObjectUnitOfWork uow, List<ProductCategory> productCategories) {
        List<ProductCategoryDataTranslation> categoriesTranslations = new List<ProductCategoryDataTranslation>();
        for (ProductCategory cat : productCategories) {
            ProductCategoryDataTranslation pc = new ProductCategoryDataTranslation();
            pc.Name = cat.Name;
            pc.Language = 'en_US';
            pc.ParentId = cat.Id;
            categoriesTranslations.add(pc);
        }
        uow.registerNew(categoriesTranslations);
        return categoriesTranslations;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<B2B_CatalogDefaultCategory__c>:	Returns the list of Default Product Categories
    **************************************************************************************************************************************************************************/
    public static List<B2B_CatalogDefaultCategory__c> createDefaultCategoriesForCatalogs(UTL_SObjectUnitOfWork uow, List<ProductCatalog> productCatalogs, List<ProductCategory> categories) {
        List<B2B_CatalogDefaultCategory__c> defaultCategories = new List<B2B_CatalogDefaultCategory__c>();
        B2B_CatalogDefaultCategory__c dc = new B2B_CatalogDefaultCategory__c();
        dc.B2B_Maison__c = productCatalogs[0].B2B_ExternalId__c;
        dc.B2B_DefaultCategory__c = categories[0].B2B_ExternalId__c;
        defaultCategories.add(dc);
        uow.registerNew(defaultCategories);
        return defaultCategories;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test products and product assets for testing purposes on the B2B_ProductAsset_Sel class.
    * @date         2021-02-17
    * @param        uow (UTL_SObjectUnitOfWork)
    * @return       List<B2B_ProductAsset__c>: A list of Product Assets
    **************************************************************************************************************************************************************************/
    public static List<B2B_ProductAsset__c> createProductAssets(UTL_SObjectUnitOfWork uow)
    {
        List<Product2> products = B2B_UTL_DataFactory.createProductsWithDefaultValues(uow);
        return createProductAssets(uow, products);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test products and product assets for testing purposes on the B2B_ProductAsset_Sel class.
    * @date         2021-02-17
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        products List<Product2>: A list of Products
    * @return       List<B2B_ProductAsset__c>: A list of Product Assets
    **************************************************************************************************************************************************************************/
    public static List<B2B_ProductAsset__c> createProductAssets(UTL_SObjectUnitOfWork uow, List<Product2> products)
    {
        List<B2B_ProductAsset__c> assets= new List<B2B_ProductAsset__c>();
        for(Integer i=0;i<products.size();i++)
        {
            Integer numberOfAssets = productSkuToAssetCount.get(products[i].B2B_GlobalReference__c);
            for(Integer j=0;j<numberOfAssets;j++)
            {
                B2B_ProductAsset__c asset = new B2B_ProductAsset__c(B2B_URL__c = 'HTTP://productasset' + i + j);
                asset.B2B_ExternalId__c = products[i].Name + '_' + j;
                asset.B2B_Priority__c = j;
                uow.registerRelationship(asset, B2B_ProductAsset__c.B2B_Product__c, products[i]);
                assets.add(asset);
            }
        }
        uow.registerNew(assets);
        return assets;
    }
    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates some test product- and availability records.
    * @date         2021-02-25
    * @param        uow (UTL_SObjectUnitOfWork)
    * @return       List<B2B_ProductAsset__c>: A list of Product Assets
    **************************************************************************************************************************************************************************/
    public static List<B2B_ProductAvailability__c> createProductAvailabilities(UTL_SObjectUnitOfWork uow, B2B_Localisation__c salesOrg, List<Product2> products)
    {
        List<B2B_ProductAvailability__c> availabilities = new List<B2B_ProductAvailability__c>();
        for(Integer i=0;i<products.size();i++)
        {
            Integer numberOfAvailabilities = productSkuToAvailabilityCount.get(products[i].B2B_GlobalReference__c);
            for(Integer j=0;j<numberOfAvailabilities;j++)
            {
                B2B_ProductAvailability__c availability = new B2B_ProductAvailability__c(B2B_StockValue__c = j+1, B2B_WarehouseType__c='1');
                uow.registerRelationship(availability, B2B_ProductAvailability__c.B2B_Product__c, products[i]);
                uow.registerRelationship(availability, B2B_ProductAvailability__c.B2B_Localisation__c, salesOrg);
                availabilities.add(availability);
            }
        }
        uow.registerNew(availabilities);
        return availabilities;
    }

    public static List<B2B_ProductAvailability__c> createProductAvailabilities(UTL_SObjectUnitOfWork uow, List<B2B_Localisation__c> salesOrg, List<Product2> products)
    {
        List<B2B_ProductAvailability__c> availabilities = new List<B2B_ProductAvailability__c>();
        for(Integer i=0;i<salesOrg.size();i++)
        {
            for(Integer x=0; x<products.size();x++)
            {
                if(salesOrg[i].B2B_ExternalId__c.contains(products[x].B2B_Maison__c))
                {
                    Integer numberOfAvailabilities = productSkuToAvailabilityCount.get(products[x].B2B_GlobalReference__c);
                    for(Integer j=0;j<numberOfAvailabilities;j++)
                    {
                        B2B_ProductAvailability__c availability = new B2B_ProductAvailability__c(B2B_StockValue__c = j+1, B2B_WarehouseType__c='1');
                        uow.registerRelationship(availability, B2B_ProductAvailability__c.B2B_Product__c, products[x]);
                        uow.registerRelationship(availability, B2B_ProductAvailability__c.B2B_Localisation__c, salesOrg[i]);
                        availabilities.add(availability);
                    }
                }
            }
        }
        uow.registerNew(availabilities);
        return availabilities;
    }

    public static List<B2B_ProductAvailabilityRange__c> createProductAvailabilityRanges(UTL_SObjectUnitOfWork uow, List<B2B_Localisation__c> localisations)
    {
        return createProductAvailabilityRanges(uow, localisations, null);
    }

    public static List<B2B_ProductAvailabilityRange__c> createProductAvailabilityRanges(UTL_SObjectUnitOfWork uow, List<B2B_Localisation__c> localisations, String grandCategoryId)
    {
        List<B2B_ProductAvailabilityRange__c> ranges = new List<B2B_ProductAvailabilityRange__c>();
        for(Integer j=0;j<localisations.size();j++){
            B2B_ProductAvailabilityRange__c range;
            if(localisations[j].B2B_ExternalId__c.contains('CA')){
                range = new B2B_ProductAvailabilityRange__c(
                        B2B_Maison__c = 'CA', B2B_Color__c='Orange',
                        B2B_From__c = 2, B2B_To__c = 5, Name = 'UT-ProductAvailabilityRange' + j
                );
            }else if(localisations[j].B2B_ExternalId__c.contains('MB')){
                range = new B2B_ProductAvailabilityRange__c(
                        B2B_Maison__c = 'MB', B2B_GrandCategoryId__c='MB0101001', B2B_Color__c='Orange',
                        B2B_From__c = 2, B2B_To__c = 5, Name = 'UT-ProductAvailabilityRange' + j
                );
                if(grandCategoryId != null){
                    range.B2B_GrandCategoryId__c = grandCategoryId;
                }
            }
            uow.registerRelationship(range, B2B_ProductAvailabilityRange__c.B2B_BusinessUnit__c, localisations[j]);
            ranges.add(range);
        }
        uow.registerNew(ranges);
        return ranges;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates
    * @date         2021-02-08
    **************************************************************************************************************************************************************************/
    public static void createProductLocalReferenceSettings(UTL_SObjectUnitOfWork uow) {
        //Generate the Product Local References Custom Setting
        Map<String, Object> fieldsValues1 = new Map<String, Object>
        {
                'Name' => '11',
                'B2B_BUName__c' => 'Switzerland',
                'B2B_ITLegacySystemId__c' => '100',
                'B2B_ITLegacySystem__c' => 'SAP-GEMINI',
                'B2B_LocalReference__c' => 'B2B_SAPLocalReference__c'
        };

        UTL_DynamicApex.createRecord('B2B_ProductLocalReferences__c', fieldsValues1, true);
        //Generate the Product Local References Custom Setting
        Map<String, Object> fieldsValues2 = new Map<String, Object>
        {
                'Name' => '16',
                'B2B_BUName__c' => 'Dubai',
                'B2B_ITLegacySystemId__c' => '16',
                'B2B_ITLegacySystem__c' => 'NSI-Dubai',
                'B2B_LocalReference__c' => 'B2B_NSIDubaiLocalReference__c'
        };
        UTL_DynamicApex.createRecord('B2B_ProductLocalReferences__c', fieldsValues2, true);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates
    * @date         2021-02-08
    **************************************************************************************************************************************************************************/
    public static void createSwagClientIntegrationSettings(UTL_SObjectUnitOfWork uow) {
        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI01 = new Map<String, Object>
        {
                'Name' => 'sandbox - B2B_Callouts',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_Callouts',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I01',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - I01',
                'INT_Service_Path__c' => '/myPath/ServiceI01',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI01',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI01, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI02 = new Map<String, Object>
        {
                'Name' => 'sandbox - B2B_ApiGee_OrderSimulation',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_ApiGee_OrderSimulation',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I02',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - I02',
                'INT_Service_Path__c' => '/myPath/ServiceI02',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI02',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI02, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI03 = new Map<String, Object>
        {
                'Name' => 'sandbox - FacetLogin',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'FacetLogin',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I03',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - I03',
                'INT_Service_Path__c' => '/myPath/ServiceI01',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI01',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI03, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI04 = new Map<String, Object>
        {
                'Name' => 'sandbox - EGON',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_IF40_AddressValidation',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I04',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - 4',
                'INT_Service_Path__c' => '/myPath/ServiceI04',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI04',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'USER',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'PASW',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI04, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI05 = new Map<String, Object>
        {
                'Name' => 'sandbox - Stock',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_Stock',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I05',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - 5',
                'INT_Service_Path__c' => '/myPath/ServiceI05',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI05',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI05, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI06 = new Map<String, Object>
        {
                'Name' => 'sandbox - stock movement history',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_IF67_StockMovementHistory',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I06',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - 6',
                'INT_Service_Path__c' => '/myPath/ServiceI06',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI06',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI06, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesSFDC = new Map<String, Object>
        {
                'Name' => 'sandbox - SFDC',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'SFDC',
                'INT_Named_Credential__c' => null,
                'INT_Mock_Named_Credential__c' => null,
                'INT_Service_Path__c' => '/myPath/ServiceI01',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI01',
                'INT_Timeout__c' => 20000,
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesSFDC, true);
		//Generate the Integration Custom Setting
		Map<String, Object> fieldsValuesAzureB2C = new Map<String, Object>
		{
				'Name' => 'Azure B2C - SFDC',
				'INT_Environment__c' => 'sandbox',
				'INT_System__c' => 'Azure B2C',
				'INT_Named_Credential__c' => 'B2B_AzureB2CSSO',
				'INT_Mock_Named_Credential__c' => 'Mock B2B_AzureB2CSSO',
				'INT_Service_Path__c' => '/richemontlabb2c.onmicrosoft.com/oauth2/v2.0/token',
				'INT_Mock_Service_Path__c' => '/mockrichemontlabb2c.onmicrosoft.com/oauth2/v2.0/token',
				'INT_Timeout__c' => 20000,
				'INT_Mock_Enabled__c' => false
		};
		UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesAzureB2C, true);

        //Generate the Integration Custom Setting
        Map<String, Object> fieldsValuesI07 = new Map<String, Object>
        {
                'Name' => 'sandbox - Aggregated Stock',
                'INT_Environment__c' => 'sandbox',
                'INT_System__c' => 'B2B_AggregatedStock',
                'INT_Named_Credential__c' => 'Credential - Sandbox - I07',
                'INT_Mock_Named_Credential__c' => 'Mock Credential - Sandbox - 7',
                'INT_Service_Path__c' => '/myPath/ServiceI07',
                'INT_Mock_Service_Path__c' => '/myMockPath/ServiceI07',
                'INT_Timeout__c' => 20000,
                'INT_Custom_Auth_Header__c' => 'MyCustHeader1',
                'INT_Custom_Auth_Header_Value__c' => 'Token1',
                'INT_Custom_Auth_Header2__c' => 'MyCustHeader2',
                'INT_Custom_Auth_Header_Value2__c' => 'Token2',
                'INT_Mock_Enabled__c' => false
        };
        UTL_DynamicApex.createRecord('INT_IntegrationSettings__c', fieldsValuesI07, true);
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method enrich the current object mapping with the default values needed to ensure the record is created with the needed values
    * @date         2021-02-08
    * @return       List<DelegatedAccount>: Returns the list of Delegated Account
    **************************************************************************************************************************************************************************/
    public static AccountShare createAccountShareWithDefaultValues(UTL_SObjectUnitOfWork uow, Account accountRecord, User userRecord) {

        AccountShare accountShareRecord = new AccountShare();
        accountShareRecord.AccountId = accountRecord.Id;
        accountShareRecord.UserOrGroupId = userRecord.Id;
        accountShareRecord.AccountAccessLevel = 'Edit';
        accountShareRecord.OpportunityAccessLevel = 'Edit';
        uow.registerRelationship(accountShareRecord, AccountShare.AccountId, accountRecord);
        uow.registerRelationship(accountShareRecord, AccountShare.UserOrGroupId, userRecord);

        uow.registerNew(accountShareRecord);
        return accountShareRecord;

    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates B2B_Localisation__c, Products2, Pricebooks2, PricebookEntries, BuyerGroup, BuyerGroupPricebook,for testing purposes.
    * 				It also enriches the relationships between them.
    * @date         11/03/2021
    * @return       List<B2B_Localisation__c>: A list of B2B_Localisation__c
    **************************************************************************************************************************************************************************/
    public static void createBuyerGroupPricebooks(UTL_SObjectUnitOfWork uow,List<Map<String, Object>> additionalFieldValuesList, Boolean executeDML) {
        List<B2B_Localisation__c> localisations = createLocalisations();
        List<Product2> products = createProductsWithDefaultValues(uow);
        List<PriceBook2> pricebooks = createPriceBooks(additionalFieldValuesList);

        Integer j=0;
        for (Integer i = 0; i < pricebooks.size(); i++) {
            if(i==2){
                j+=1;
            }
            pricebooks[i].Name=localisations[j].B2B_ExternalId__c+pricebooks[i].Name;
            pricebooks[i].B2B_ExternalId__c=localisations[j].B2B_ExternalId__c+pricebooks[i].B2B_ExternalId__c;
            uow.registerRelationship( pricebooks[i], PriceBook2.B2B_Localisation__c, localisations[j]);
        }
        List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();

        for (Product2 product : products) {
            PricebookEntry pbEntry = UTL_DataFactory.createPriceBookEntry(new Map<String, Object>{
                    'UnitPrice' => 10,
                    'IsActive' => true,
                    'UseStandardPrice' => false,
                    'Product2Id' => product.Id
            }, false);
            pricebookEntries.add(pbEntry);
            uow.registerRelationship(pbEntry, PricebookEntry.Product2Id, product);
        }

        for (PriceBook2 pricebook : pricebooks) {
            for (Product2 product : products) {
                PricebookEntry pbEntry = UTL_DataFactory.createPriceBookEntry(new Map<String, Object>{
                        'UnitPrice' => 10,
                        'IsActive' => true,
                        'UseStandardPrice' => false,
                        'Product2Id' => product.Id,
                        'Pricebook2Id' => pricebook.Id
                }, false);
                pricebookEntries.add(pbEntry);
                uow.registerRelationship(pbEntry, PricebookEntry.Product2Id, product);
                uow.registerRelationship(pbEntry, PricebookEntry.Pricebook2Id, pricebook);
            }
        }

        Map<String,BuyerGroup> buyerGroupMap = new Map<String,BuyerGroup>{
                'CA' => new BuyerGroup(Name='CA_BG',B2B_ExternalId__c='CA_BG'),
                'MB' => new BuyerGroup(Name='MB_BG',B2B_ExternalId__c='MB_BG')
        };

        List<BuyerGroupPricebook> buyerPricebookList = new List<BuyerGroupPricebook>();
        j=0;
        for (Integer i = 0; i < pricebooks.size(); i++) {
            if(i==2){
                j+=1;
            }
            BuyerGroupPricebook bPricebook = new BuyerGroupPricebook(
                    IsActive= True,
                    B2B_ExternalId__c='bpb'+i,
                    Pricebook2Id=pricebooks[i].Id,
                    BuyerGroupId=buyerGroupMap.get(localisations[j].B2B_Maison__c).Id
            );
            uow.registerRelationship(bPricebook, BuyerGroupPricebook.Pricebook2Id, pricebooks[i]);
            uow.registerRelationship(bPricebook, BuyerGroupPricebook.BuyerGroupId, buyerGroupMap.get(localisations[j].B2B_Maison__c));
            buyerPricebookList.add(bPricebook);
        }

        uow.registerNew(localisations);
        uow.registerNew(pricebooks);
        uow.registerNew(pricebookEntries);
        uow.registerNew(buyerGroupMap.values());
        uow.registerNew(buyerPricebookList);
        if(executeDML){
            uow.commitWork();
        }
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test B2B_Localisation__c for testing purposes.
    * @date         11/03/2021
    * @return       List<B2B_Localisation__c>: A list of B2B_Localisation__c
    **************************************************************************************************************************************************************************/
    public static List<B2B_Localisation__c> createLocalisations() {
        List<B2B_Localisation__c> localisations = new List<B2B_Localisation__c>();
        for (Integer i=0; i < localisationChannels.size(); i++) {
            for (Integer j=0; j < webstoreExternalIds.size(); j++) {
                B2B_Localisation__c localisation = new B2B_Localisation__c();
                localisation.Name = localisationChannels[i]+webstoreExternalIds[j];
                localisation.B2B_ExternalId__c = localisationChannels[i]+webstoreExternalIds[j];
                localisation.B2B_Maison__c = webstoreExternalIds[j];
                localisation.B2B_LocalisationLevel__c = localisationLevels[i];
                localisations.add(localisation);
            }
        }
        return localisations;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test PriceBook2 for testing purposes.
    * @date         11/03/2021
    * @param        additionalFieldValuesList (List<Map<String, Object>>) each map describes fields of each object
    * @return       List<PriceBook2>: A list of PriceBook2
    **************************************************************************************************************************************************************************/
    public static List<PriceBook2> createPriceBooks(List<Map<String, Object>> additionalFieldValuesList) {
        List<PriceBook2> pricebooks = new List<PriceBook2>();

        for (Map<String,Object> additionalFieldValues : additionalFieldValuesList) {
            PriceBook2 pricebook = new PriceBook2();
            for (String field : additionalFieldValues.keySet()) {
                pricebook.put(field,additionalFieldValues.get(field));
            }
            pricebooks.add(pricebook);
        }

        return pricebooks;
    }

    public static List<Pricebook2> createConsolidatedPriceBooks(UTL_SObjectUnitOfWork uow, List<String> priceBookNames) {
        List<Pricebook2> priceBooks = new List<PriceBook2>();
        for (String priceBookName : priceBookNames) {
            Pricebook2 pricebook = new Pricebook2(Name = priceBookName, B2B_ExternalId__c = priceBookName, Description = 'Consolidated PB');
            priceBooks.add(pricebook);
        }
        uow.registerNew(priceBooks);
        return priceBooks;
    }
    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test BuyerGroups for testing purposes.
    * @date         11/03/2021
    * @return       List<BuyerGroup>: A list of BuyerGroups
    **************************************************************************************************************************************************************************/
    public static List<BuyerGroup> createBuyerGroup() {
        List<BuyerGroup> buyerGroups = new List<BuyerGroup>();
        for (Integer i=0; i < webstoreExternalIds.size(); i++) {
            BuyerGroup buyerGroup = new BuyerGroup();
            buyerGroup.Name=webstoreExternalIds[i]+'_BuyerGroup';
            buyerGroup.B2B_ExternalId__c=webstoreExternalIds[i]+'_BuyerGroup';
        }
        return buyerGroups;
    }
    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test order types for testing purposes.
    * @date         March 2021
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        products (List<Product2>)
    * @param        a (Account)
    * @return       List<B2B_OrderType__c>: A list of Order Types
    **************************************************************************************************************************************************************************/
    public static List<B2B_OrderType__c> createOrderTypes(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a)
    {
        return createOrderTypes(uow, products, a, null);
    }

    public static List<B2B_OrderType__c> createOrderTypes2(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a, B2B_Localisation__c parentLocalisation)
    {
        List<B2B_OrderType__c> orderTypes = new List<B2B_OrderType__c>();

        //create OrderType for Multiple Scenario
        //POS + Product
        B2B_OrderType__c o1 = new B2B_OrderType__c();
        o1.B2B_FirmOrder__c = true;
        o1.B2B_ConsignmentOrder__c = true;
        o1.B2B_StandardOrderType__c = true;
        uow.registerRelationship(o1, B2B_OrderType__c.B2B_Product__c, products[0]);
        uow.registerRelationship(o1, B2B_OrderType__c.B2B_BrandedPOS__c, a);
        orderTypes.add(o1);

        //Chain + Product
        if(a.Parent.ParentId!=null ){
            B2B_OrderType__c o3 = new B2B_OrderType__c();
            o3.B2B_FirmOrder__c = true;
            o3.B2B_ConsignmentOrder__c = true;
            o3.B2B_StandardOrderType__c = true;
            o3.B2B_AccountChain__c = a.Parent.ParentId;
            //uow.registerRelationship(o1, B2B_OrderType__c.B2B_AccountChain__c, a.Parent.Parent);
            uow.registerRelationship(o3, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o3);
        }
        //BU + Product
        if(parentLocalisation != null){
            B2B_OrderType__c o7 = new B2B_OrderType__c();
            o7.B2B_FirmOrder__c = true;
            o7.B2B_ConsignmentOrder__c = true;
            o7.B2B_StandardOrderType__c = true;
            uow.registerRelationship(o7, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
            uow.registerRelationship(o7, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o7);
        }

        uow.registerNew(orderTypes);
        System.debug('ORDERTYPE:' + JSON.serializePretty(orderTypes));
        return orderTypes;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test order types for testing purposes on the B2B_OrderType_Sel class.
    * @date         March 2021
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        products (List<Product2>)
    * @param        a (Account)
    * @return       List<B2B_OrderType__c>: A list of Order Types
    **************************************************************************************************************************************************************************/
    public static List<B2B_OrderType__c> createOrderTypes(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a, B2B_Localisation__c parentLocalisation)
    {
        List<B2B_OrderType__c> orderTypes = new List<B2B_OrderType__c>();

		//create OrderType for Multiple Scenario
		//POS + Product
		B2B_OrderType__c o1 = new B2B_OrderType__c();
		o1.B2B_FirmOrder__c = true;
		o1.B2B_ConsignmentOrder__c = true;
		o1.B2B_StandardOrderType__c = true;
		uow.registerRelationship(o1, B2B_OrderType__c.B2B_Product__c, products[0]);
		uow.registerRelationship(o1, B2B_OrderType__c.B2B_BrandedPOS__c, a);
		orderTypes.add(o1);

        /*
		//POS + Merchandise Category
		B2B_OrderType__c o2 = new B2B_OrderType__c();
		o2.B2B_FirmOrder__c = true;
		o2.B2B_ConsignmentOrder__c = true;
		o2.B2B_StandardOrderType__c = true;
		uow.registerRelationship(o2, B2B_OrderType__c.B2B_BrandedPOS__c, a);
		o2.B2B_MerchandiseCategory__c = products[1].B2B_MerchandiseCategory__c;
		orderTypes.add(o2);

         */

        //Chain + Product
        if(a.Parent.ParentId!=null ){
            B2B_OrderType__c o3 = new B2B_OrderType__c();
            o3.B2B_FirmOrder__c = true;
            o3.B2B_ConsignmentOrder__c = true;
            o3.B2B_StandardOrderType__c = true;
            o3.B2B_AccountChain__c = a.Parent.ParentId;
            //uow.registerRelationship(o3, B2B_OrderType__c.B2B_AccountChain__c, a.Parent.Parent);
            uow.registerRelationship(o3, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o3);
        }

		//POSType + BU + Product
        if(parentLocalisation != null) {
            B2B_OrderType__c o5 = new B2B_OrderType__c();
            o5.B2B_FirmOrder__c = true;
            o5.B2B_ConsignmentOrder__c = true;
            o5.B2B_StandardOrderType__c = true;
            o5.B2B_POSType__c = a.B2B_POSType__c != null ? a.B2B_POSType__c : '';
            uow.registerRelationship(o5, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
            uow.registerRelationship(o5, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o5);
        }

        /*
		//POSType + Merchandise
		B2B_OrderType__c o6 = new B2B_OrderType__c();
		o6.B2B_FirmOrder__c = true;
		o6.B2B_ConsignmentOrder__c = true;
		o6.B2B_StandardOrderType__c = true;
		o6.B2B_POSType__c = a.B2B_POSType__c;
		o6.B2B_MerchandiseCategory__c = 'CA0101001';
		orderTypes.add(o6);

         */
/*
		//BU + Product
        if(parentLocalisation != null){
            B2B_OrderType__c o7 = new B2B_OrderType__c();
            o7.B2B_FirmOrder__c = true;
            o7.B2B_ConsignmentOrder__c = true;
            o7.B2B_StandardOrderType__c = true;
            uow.registerRelationship(o7, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
		    uow.registerRelationship(o7, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o7);
        }
*/
        /*
		//BU + Merchandise
        if(parentLocalisation != null){
            B2B_OrderType__c o8 = new B2B_OrderType__c();
            o8.B2B_FirmOrder__c = true;
            o8.B2B_ConsignmentOrder__c = true;
            o8.B2B_StandardOrderType__c = true;
            o8.B2B_Localisation__c = a.B2B_Localisation__c;
            uow.registerRelationship(o8, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
		    o8.B2B_MerchandiseCategory__c = products[1].B2B_MerchandiseCategory__c;
            orderTypes.add(o8);
        }

         */
/*
		//POS Type + BU + Product
		if(parentLocalisation != null){
            B2B_OrderType__c o9 = new B2B_OrderType__c();
            o9.B2B_FirmOrder__c = true;
            o9.B2B_ConsignmentOrder__c = true;
            o9.B2B_StandardOrderType__c = true;
            o9.B2B_POSType__c = a.B2B_POSType__c != null? a.B2B_POSType__c : '';
            uow.registerRelationship(o9, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
		    uow.registerRelationship(o9, B2B_OrderType__c.B2B_Product__c, products[0]);
            orderTypes.add(o9);
        }
*/
        /*
		//POS Type + BU + Merchandise
		if(parentLocalisation != null){
            B2B_OrderType__c o10 = new B2B_OrderType__c();
            o10.B2B_FirmOrder__c = true;
            o10.B2B_ConsignmentOrder__c = true;
            o10.B2B_StandardOrderType__c = true;
			o10.B2B_POSType__c = a.B2B_POSType__c;
			o10.B2B_Localisation__c = a.B2B_Localisation__c;
            uow.registerRelationship(o10, B2B_OrderType__c.B2B_Localisation__c, parentLocalisation);
			o10.B2B_MerchandiseCategory__c = products[0].B2B_MerchandiseCategory__c;
            orderTypes.add(o10);
        }

         */

        uow.registerNew(orderTypes);
		System.debug('ORDERTYPE:' + JSON.serializePretty(orderTypes));
        return orderTypes;
    }

    /**************************************************************************************************************************************************************************
    * @author       Kürsad Görgülü (kgorgulu@deloitte.com)
    * @description  Creates some test CFS Product Eligibility records for testing purposes on the B2B_CFSProductEligibility_Sel class.
    * @date         June 2021
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        products (List<Product2>)
    * @return       List<B2B_ClickFromStoreProductEligibility__c>: A list of CFS Product Eligibilities
    **************************************************************************************************************************************************************************/
    public static List<B2B_ClickFromStoreProductEligibility__c> createClickFromStoreProductEligibilities(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a, B2B_localisation__c loc, List<B2B_CategoryHierarchy__c> categories)
    {
        List<B2B_ClickFromStoreProductEligibility__c> productEligibilities = new List<B2B_ClickFromStoreProductEligibility__c>();

        B2B_CategoryHierarchy__c master;
        B2B_CategoryHierarchy__c grand;

        for(B2B_CategoryHierarchy__c cat : categories){
            if(master == null && cat.B2B_CategoryType__c.equals('MC'))
                master = cat;
            if(grand == null && cat.B2B_CategoryType__c.equals('GC'))
                grand = cat;
            if(cat.B2B_CategoryType__c.equals('MC') && cat.Name.equals('PIA07002'))
                master = cat;
            if(cat.B2B_CategoryType__c.equals('GC') && cat.Name.equals('CAA05081'))
                grand = cat;
        }

        //Prio 1: Product + POS
        B2B_ClickFromStoreProductEligibility__c e1 = new B2B_ClickFromStoreProductEligibility__c();
        e1.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e1, B2B_ClickFromStoreProductEligibility__c.B2B_Product__c, products[0]);
        uow.registerRelationship(e1, B2B_ClickFromStoreProductEligibility__c.B2B_BrandedPos__c, a);
        e1.B2B_ExternalId__c = 'Test-0001231';
        productEligibilities.add(e1);
        //Prio 2: Merch + POS
        B2B_ClickFromStoreProductEligibility__c e2 = new B2B_ClickFromStoreProductEligibility__c();
        e2.B2B_IncludeForClickFromStore__c = true;
        e2.B2B_MerchandiseCategory__c = 'CA0101001';
        uow.registerRelationship(e2, B2B_ClickFromStoreProductEligibility__c.B2B_BrandedPos__c, a);
        e2.B2B_ExternalId__c = 'Test-0001232';
        productEligibilities.add(e2);
        //Prio 3: Master + POS
        B2B_ClickFromStoreProductEligibility__c e3 = new B2B_ClickFromStoreProductEligibility__c();
        e3.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e3, B2B_ClickFromStoreProductEligibility__c.B2B_BrandedPos__c, a);
        uow.registerRelationship(e3, B2B_ClickFromStoreProductEligibility__c.B2B_MasterCategory__c, master);
        e3.B2B_ExternalId__c = 'Test-0001233';
        productEligibilities.add(e3);
        //Prio 4: Grand + POS
        B2B_ClickFromStoreProductEligibility__c e4 = new B2B_ClickFromStoreProductEligibility__c();
        e4.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e4, B2B_ClickFromStoreProductEligibility__c.B2B_BrandedPos__c, a);
        uow.registerRelationship(e4, B2B_ClickFromStoreProductEligibility__c.B2B_GrandCategory__c, grand);
        e4.B2B_ExternalId__c = 'Test-0001234';
        productEligibilities.add(e4);
        //Prio 5: Prod + BU + PosType
        B2B_ClickFromStoreProductEligibility__c e5 = new B2B_ClickFromStoreProductEligibility__c();
        e5.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e5, B2B_ClickFromStoreProductEligibility__c.B2B_Product__c, products[0]);
        uow.registerRelationship(e5, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e5.B2B_POSType__c = a.B2B_POSType__c;
        e5.B2B_ExternalId__c = 'Test-0001235';
        productEligibilities.add(e5);
        //Prio 6: Merch + BU + PosType
        B2B_ClickFromStoreProductEligibility__c e6 = new B2B_ClickFromStoreProductEligibility__c();
        e6.B2B_IncludeForClickFromStore__c = true;
        e6.B2B_MerchandiseCategory__c = 'CA0101001';
        uow.registerRelationship(e6, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e6.B2B_POSType__c = a.B2B_POSType__c;
        e6.B2B_ExternalId__c = 'Test-0001236';
        productEligibilities.add(e6);
        //Prio 7: Master + BU + PosType
        B2B_ClickFromStoreProductEligibility__c e7 = new B2B_ClickFromStoreProductEligibility__c();
        e7.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e7, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        uow.registerRelationship(e7, B2B_ClickFromStoreProductEligibility__c.B2B_MasterCategory__c, master);
        e7.B2B_POSType__c = a.B2B_POSType__c;
        e7.B2B_ExternalId__c = 'Test-0001237';
        productEligibilities.add(e7);
        //Prio 8: Grand + BU + PosType
        B2B_ClickFromStoreProductEligibility__c e8 = new B2B_ClickFromStoreProductEligibility__c();
        e8.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e8, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        uow.registerRelationship(e8, B2B_ClickFromStoreProductEligibility__c.B2B_GrandCategory__c, grand);
        e8.B2B_POSType__c = a.B2B_POSType__c;
        e8.B2B_ExternalId__c = 'Test-0001238';
        productEligibilities.add(e8);
        //Prio 9: Prod + BU
        B2B_ClickFromStoreProductEligibility__c e9 = new B2B_ClickFromStoreProductEligibility__c();
        e9.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e9, B2B_ClickFromStoreProductEligibility__c.B2B_Product__c, products[0]);
        uow.registerRelationship(e9, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e9.B2B_ExternalId__c = 'Test-0001239';
        productEligibilities.add(e9);
        //Prio 10: Merch + BU
        B2B_ClickFromStoreProductEligibility__c e10 = new B2B_ClickFromStoreProductEligibility__c();
        e10.B2B_IncludeForClickFromStore__c = true;
        e10.B2B_MerchandiseCategory__c = 'CA0101001';
        uow.registerRelationship(e10, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e10.B2B_ExternalId__c = 'Test-0001240';
        productEligibilities.add(e10);
        //Prio 11: Master + BU
        B2B_ClickFromStoreProductEligibility__c e11 = new B2B_ClickFromStoreProductEligibility__c();
        e11.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e11, B2B_ClickFromStoreProductEligibility__c.B2B_MasterCategory__c, master);
        uow.registerRelationship(e11, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e11.B2B_ExternalId__c = 'Test-0001241';
        productEligibilities.add(e11);
        //Prio 12: Grand + BU
        B2B_ClickFromStoreProductEligibility__c e12 = new B2B_ClickFromStoreProductEligibility__c();
        e12.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e12, B2B_ClickFromStoreProductEligibility__c.B2B_GrandCategory__c, grand);
        uow.registerRelationship(e12, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e12.B2B_ExternalId__c = 'Test-0001242';
        productEligibilities.add(e12);

        //another Product + BU
        // where Product is managed on individual number
        B2B_ClickFromStoreProductEligibility__c e0 = new B2B_ClickFromStoreProductEligibility__c();
        e0.B2B_IncludeForClickFromStore__c = true;
        uow.registerRelationship(e0, B2B_ClickFromStoreProductEligibility__c.B2B_Product__c, products[2]);
        uow.registerRelationship(e0, B2B_ClickFromStoreProductEligibility__c.B2B_BusinessUnit__c, loc);
        e0.B2B_ExternalId__c = 'Test-0001229';
        productEligibilities.add(e0);

        uow.registerNew(productEligibilities);
        return productEligibilities;
    }


    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  Creates some test model stock for testing purposes on the B2B_ModelStock_Sel class.
    * @date         04/03/2021
    * @param        uow (UTL_SObjectUnitOfWork)
    * @param        products (List<Product2>)
    * @param        a (Account)
    * @return       List<B2B_ModelStock__c>: A list of ModelStock
    **************************************************************************************************************************************************************************/
    public static List<B2B_ModelStock__c> createProductModelStock(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a)
    {
        List<B2B_ModelStock__c> modelStock = new List<B2B_ModelStock__c>();
        for(Integer i=0;i<products.size();i++)
        {
            if(products[i].B2B_Maison__c != null && a.B2B_Maison__c != null && products[i].B2B_Maison__c  == a.B2B_Maison__c){
                B2B_ModelStock__c ms = new B2B_ModelStock__c();
                ms.B2B_Quantity__c = 5;
                ms.B2B_ExternalId__c = 'ms_' + a.B2B_ExternalId__c + products[i].B2B_GlobalReference__c;
                uow.registerRelationship(ms, B2B_ModelStock__c.B2B_Product__c, products[i]);
                uow.registerRelationship(ms, B2B_ModelStock__c.B2B_BrandedPOS__c, a);
                modelStock.add(ms);
            }
        }
        modelStock.get(1).B2B_AutoReplenishment__c = true;

        uow.registerNew(modelStock);
        return modelStock;
    }

    public static List<B2B_ModelStock__c> createProductAndCategoryModelStock(UTL_SObjectUnitOfWork uow, List<Product2> products, Account a)
    {
        List<B2B_ModelStock__c> modelStock = new List<B2B_ModelStock__c>();
        for(Integer i=1;i<products.size();i++)
        {
            if(products[i].B2B_Maison__c != null && a.B2B_Maison__c != null && products[i].B2B_Maison__c  == a.B2B_Maison__c){
                B2B_ModelStock__c ms = new B2B_ModelStock__c();
                ms.B2B_Quantity__c = 5;
                uow.registerRelationship(ms, B2B_ModelStock__c.B2B_Product__c, products[i]);
                uow.registerRelationship(ms, B2B_ModelStock__c.B2B_BrandedPOS__c, a);
                modelStock.add(ms);
            }

        }
        modelStock.get(1).B2B_AutoReplenishment__c = true;

        B2B_ModelStock__c merchModelStock = new B2B_ModelStock__c(B2B_Quantity__c = 10);
        uow.registerRelationship(merchModelStock, B2B_ModelStock__c.B2B_Product__c, products[0]);
        uow.registerRelationship(merchModelStock, B2B_ModelStock__c.B2B_BrandedPOS__c, a);
        modelStock.add(merchModelStock);

        uow.registerNew(modelStock);
        return modelStock;
    }

    public static List<B2B_OrderDeliveryPriority__c> createOrderDeliveryPriorities(UTL_SObjectUnitOfWork uow, List<Account> accounts, List<B2B_Localisation__c> localisations) {
        List<B2B_OrderDeliveryPriority__c> orderDeliveryPriorities = new List<B2B_OrderDeliveryPriority__c>();
        for (Account a : accounts) {
            B2B_OrderDeliveryPriority__c brandedPosOrderDelivery = new B2B_OrderDeliveryPriority__c(
                    B2B_Priority__c = '10',
                    B2B_OrderType__c = 'ZB01'
            );
            uow.registerRelationship(brandedPosOrderDelivery, B2B_OrderDeliveryPriority__c.B2B_BrandedPOS__c, a);
            orderDeliveryPriorities.add(brandedPosOrderDelivery);

            B2B_OrderDeliveryPriority__c brandOrderDelivery = new B2B_OrderDeliveryPriority__c(
                    B2B_Priority__c = '30',
                    B2B_Brand__c = a.B2B_Maison__c
            );
            orderDeliveryPriorities.add(brandOrderDelivery);
        }

        for (B2B_Localisation__c localisation : localisations) {
            B2B_OrderDeliveryPriority__c businessUnitOrderDelivery = new B2B_OrderDeliveryPriority__c(
                    B2B_Priority__c = '20'
            );
            uow.registerRelationship(businessUnitOrderDelivery, B2B_OrderDeliveryPriority__c.B2B_BusinessUnit__c, localisation);
            orderDeliveryPriorities.add(businessUnitOrderDelivery);
        }

        uow.registerNew(orderDeliveryPriorities);
        return orderDeliveryPriorities;
    }

    /**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method create a list of products test data
    * @date         2021-03-18
    * @param		nbOfRecords (Integer):	The number of records to be created
    * @return       List<Product2>:		Returns the generated Products List
    **************************************************************************************************************************************************************************/
    public static List<Product2> createBulkProducts(Integer nbOfRecords, UTL_SObjectUnitOfWork uow) {

		List<Product2> products = new List<Product2>();
		String simpleProductName = 'Tank Solo watch';
		String productSKUs = 'CRW5200013';
		Integer i;
		for(i = 0; i < nbOfRecords; i++){
			Map<String, Object> additionalFieldValuesProduct = new Map<String, Object>{
				'StockKeepingUnit' => (productSKUs+i),
				'B2B_GlobalReference__c' => (productSKUs+i),
				'B2B_ProductType__c' => '01',
				'IsActive' => True,
				'Family' => 'WMF',
				'B2B_SAPLocalReference__c'=>'12345',
				'B2B_Maison__c' => 'CA',
				'B2B_MerchandiseCategory__c' => 'CA0101001'
			};
			products.add(UTL_DataFactory.createProduct((simpleProductName+i), (productSKUs+i), additionalFieldValuesProduct, false));
		}
		uow.registerNew(products);
        return products;
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 16/03/2021
     * @description Create a dummy WebCart
     * @param uow UTL_SObjectUnitOfWork:
     * @param account Account:
     * @param webStore WebStore:
     * @return WebCart:
     ******************************************************************************************************************/
    public static WebCart createWebCart(UTL_SObjectUnitOfWork uow, Account account, WebStore webStore) {
        WebCart cart = new Webcart();
        cart.Name = 'Dummy';
        cart.B2B_SelectedProductType__c = '01';
        uow.registerRelationship(cart, WebCart.AccountId, account);
        uow.registerRelationship(cart, WebCart.WebStoreId, webStore);
        uow.registerNew(cart);
        return cart;
    }

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 16/03/2021
     * @description Create Cart Line Items.
     * @param uow UTL_SObjectUnitOfWork:
     * @param cart WebCart:
     * @param products List<Product2>:
     * @return List<CartItem>:
     ******************************************************************************************************************/
    public static List<CartItem> createWebCartItems(UTL_SObjectUnitOfWork uow, WebCart cart, List<Product2> products, CartDeliveryGroup crtDeliveryGroup) {
        List<CartItem> cartItems = new List<CartItem>();
        CartItem cartItem1 = new CartItem();
        cartItem1.Name = 'cartItem1';
        cartItem1.Type = 'Product';
        cartItem1.B2B_LineNumber__c = 20;
        cartItem1.UnitAdjustedPrice = 101;
        cartItem1.B2B_ReasonCode__c = 'Y00';
		cartItem1.Quantity = 6;
		if (crtDeliveryGroup != null) {
			uow.registerRelationship(cartItem1, CartItem.CartDeliveryGroupId, crtDeliveryGroup);
		} else {
			uow.registerRelationship(cartItem1, CartItem.CartDeliveryGroupId, B2B_UTL_DataFactory.createCartDeliveryGroup(uow,cart,null));
		}
        uow.registerRelationship(cartItem1, CartItem.CartId, cart);
		if (!products.isEmpty()) {
        	uow.registerRelationship(cartItem1, CartItem.Product2Id, products.get(0));
		}
        cartItems.add(cartItem1);

        uow.registerNew(cartItems);
        return cartItems;
	}

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 19/03/2021
     * @description Add validation errors to cart items
     * @param uow UTL_SObjectUnitOfWork:
     * @param cart WebCart:
     * @param cartItems List<CartItem>:
     * @return List<CartValidationOutput>:
     ******************************************************************************************************************/
    public static List<CartValidationOutput> createCartValidationOutputs(UTL_SObjectUnitOfWork uow, WebCart cart, List<CartItem> cartItems) {
        List<CartValidationOutput> validations = new List<CartValidationOutput>();

        CartValidationOutput cartError = new CartValidationOutput();
        cartError.IsDismissed = false;
        cartError.Message = 'Failure';
        cartError.Name = cart.Name;
        cartError.Type = 'Other';
        cartError.Level = 'Error';
        uow.registerRelationship(cartError, CartValidationOutput.CartId, cart);
        uow.registerRelationship(cartError, CartValidationOutput.RelatedEntityId, cart);
        validations.add(cartError);

        for (CartItem item : cartItems) {
            CartValidationOutput error = new CartValidationOutput();
            error.IsDismissed = false;
            error.Message = 'Failure';
            error.Name = item.Name;
            error.Type = 'Other';
            error.Level = 'Error';
            uow.registerRelationship(error, CartValidationOutput.CartId, cart);
            uow.registerRelationship(error, CartValidationOutput.RelatedEntityId, item);
            validations.add(error);
        }

        uow.registerNew(validations);
        return validations;
    }

	public static List<B2B_TranslationAttribute__c> createTranslationAttributes(UTL_SObjectUnitOfWork uow){
		List<B2B_TranslationAttribute__c> translations = new List<B2B_TranslationAttribute__c>();
		Map<String,List<String>> lang = new Map<String,List<String>>{
			'en_US' => new List<String>{'Organization Code', 'Collection', 'Color'},
			'de' => new List<String>{'Organisationscode', 'Sammlung', 'Farbe'}
		};

		for (Integer i = 0; i < translationAttributes.size(); i++) {
			for (String key : lang.keySet()) {
				translations.add(
					new B2B_TranslationAttribute__c(
						B2B_FieldName__c = translationAttributes[i]
						, B2B_TranslationValue__c = lang.get(key)[i]
						, B2B_Language__c = key
					)
				);
			}
		}
		uow.registerNew(translations);
		return translations;
	}

    /*******************************************************************************************************************
     * @author Lennart Schelfhout <lschelfhout@deloitte.com>
     * @date 25/03/2021
     * @description Create B2B_ProductAttribute__c records based on input of a variant parent & variation product.
     * @param uow UTL_SObjectUnitOfWork:
     * @param variationParent (Product2)
     * @param variations (List<Product2>)
     * @return productAttributes (List<B2B_ProductAttribute__c>)
    ******************************************************************************************************************/
    public static List<B2B_ProductAttribute__c> createProductAttributes(UTL_SObjectUnitOfWork uow, Product2 variationParent, List<Product2> variations) {
        List<B2B_ProductAttribute__c> customProductAttributes = new List<B2B_ProductAttribute__c>();
        for(Product2 p : variations) {
            B2B_ProductAttribute__c customProductAttribute = new B2B_ProductAttribute__c();
            customProductAttribute.B2B_ExternalId__c = 'PA_' + variationParent.B2B_GlobalReference__c + '_' + p.B2B_GlobalReference__c;
            customProductAttribute.Name = 'PA_' + variationParent.B2B_GlobalReference__c + '_' + p.B2B_GlobalReference__c;
            customProductAttribute.B2B_Size__c = '20';
            uow.registerRelationship(customProductAttribute, B2B_ProductAttribute__c.B2B_Product__c, p);
            uow.registerRelationship(customProductAttribute, B2B_ProductAttribute__c.B2B_VariantParent__c, variationParent);
            customProductAttributes.add(customProductAttribute);
        }
        uow.registerNew(customProductAttributes);
        return customProductAttributes;
    }
    /*******************************************************************************************************************
     * @author Deloitte
     * @date 29/03/2021
     * @description Create Contact Point Address
     * @param uow UTL_SObjectUnitOfWork:
     * @param account Account:
     * @return ContactPointAddress:
    ******************************************************************************************************************/
    public static List<ContactPointAddress> createContactPointAddresses(UTL_SObjectUnitOfWork uow,Account account) {
        List<ContactPointAddress> contactPointAddresses = new List<ContactPointAddress>();
        ContactPointAddress shippingAddress = new ContactPointAddress();
        shippingAddress.City = 'Genève';
        shippingAddress.Country = 'Switzerland';
        shippingAddress.PostalCode = '1204';
        shippingAddress.Street = '50 Rue du Rhône';
        shippingAddress.name = 'UT - Shipping Address 1';
        shippingAddress.AddressType = 'Sold To';
        shippingAddress.B2B_ErpId__c = '00000213041';
        shippingAddress.B2B_ExternalId__c = account.B2B_ExternalId__c + '_' + shippingAddress.B2B_ErpId__c;
		shippingAddress.B2B_IsActive__c = true;
        uow.registerRelationship(shippingAddress,ContactPointAddress.ParentId,account);

        ContactPointAddress billingAddress = new ContactPointAddress();
        billingAddress.City = 'Genève';
        billingAddress.Country = 'Switzerland';
        billingAddress.PostalCode = '1204';
        billingAddress.Street = 'Place du Rhône';
        billingAddress.name = 'UT - Blling Address 1';
        billingAddress.AddressType = 'Billing';
        billingAddress.B2B_ErpId__c = '00000213059';
        billingAddress.B2B_ExternalId__c = account.B2B_ExternalId__c + '_' + billingAddress.B2B_ErpId__c;
        billingAddress.B2B_IsActive__c = true;
        uow.registerRelationship(billingAddress,ContactPointAddress.ParentId,account);

        contactPointAddresses.add(shippingAddress);
        contactPointAddresses.add(billingAddress);
        uow.registerNew(contactPointAddresses);
        return contactPointAddresses;
    }

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 29/03/2021
     * @description Create Orders
     * @param uow UTL_SObjectUnitOfWork:
     * @param account Account:
     * @param cart Webcart:
     * @param cpAddress ContactPointAddress:
     * @return orders:
    ******************************************************************************************************************/
    public static List<Order> createOrders(UTL_SObjectUnitOfWork uow,Account account, Webcart cart, ContactPointAddress cpAddress) {
        List<Order> orders = new List<Order>();
        Order order1 = new Order();
        order1.Status = 'Draft';
        order1.Name = 'UT - Order 1';
        order1.B2B_Comment__c = 'UT-Order';
        order1.EffectiveDate = Date.TODAY();
        order1.OrderedDate = Date.TODAY();
        order1.PoNumber = 'PO-0000123';
        order1.B2B_SalesRepresentative__c = '000001204145';
        order1.B2B_ERPSystem__c = 'UT101';
		order1.B2B_ERPSalesOrderNumber__c = '201875946';
		order1.B2B_SelectedProductType__c = '01';

        Order order2 = new Order();
        order2.Status = 'Draft';
        order2.Name = 'UT - Order 2';
        order2.B2B_Comment__c = 'UT-Order1';
        order2.EffectiveDate = Date.TODAY();
        order2.OrderedDate = Date.TODAY();
        order2.PoNumber = 'PO-0000125';
        order2.B2B_SalesRepresentative__c = '000001204146';
        order2.B2B_ERPSystem__c = 'UT101';
		order2.B2B_ERPSalesOrderNumber__c = '201875947';
		order2.B2B_SelectedProductType__c = '01';

        Order order3 = new Order();
        order3.Status = 'Draft';
        order3.Name = 'UT - Order 3';
        order3.B2B_Comment__c = 'UT-Order2';
        order3.EffectiveDate = Date.TODAY();
        order2.OrderedDate = Date.TODAY();
        order3.PoNumber = 'PO-0000126';
        order3.B2B_SalesRepresentative__c = '000001204147';
        order3.B2B_ERPSystem__c = 'UT101';
		order3.B2B_ERPSalesOrderNumber__c = '201875948';
		order3.B2B_SelectedProductType__c = '01';
        order3.B2B_ReasonCode__c = B2B_UTL_GlobalConstants.ORDER_REASON_CODE_FIRM_ORDER;

        uow.registerRelationship(order1,Order.B2B_SoldTo__c,cpAddress);
        uow.registerRelationship(order1,Order.B2B_BillTo__c,cpAddress);
        uow.registerRelationship(order1,Order.B2B_ShipTo__c,cpAddress);
        uow.registerRelationship(order1,Order.B2B_Cart__c,cart);
        uow.registerRelationship(order1,Order.AccountId,account);

        uow.registerRelationship(order2,Order.B2B_SoldTo__c,cpAddress);
        uow.registerRelationship(order2,Order.B2B_BillTo__c,cpAddress);
        uow.registerRelationship(order2,Order.B2B_ShipTo__c,cpAddress);
        uow.registerRelationship(order2,Order.AccountId,account);
        uow.registerRelationship(order2,Order.B2B_ParentOrder__c,order1);


        uow.registerRelationship(order3,Order.B2B_SoldTo__c,cpAddress);
        uow.registerRelationship(order3,Order.B2B_BillTo__c,cpAddress);
        uow.registerRelationship(order1,Order.B2B_ShipTo__c,cpAddress);
        uow.registerRelationship(order3,Order.AccountId,account);
        uow.registerRelationship(order3,Order.B2B_ParentOrder__c,order1);

        orders.add(order1);
        orders.add(order2);
        orders.add(order3);
        uow.registerNew(orders);
        return orders;
    }

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 29/03/2021
     * @description Create Order Delivery Method
     * @param uow UTL_SObjectUnitOfWork:
     * @param products List<Product2>:
     * @return List<OrderDeliveryMethod>:
    ******************************************************************************************************************/
    public static List<OrderDeliveryMethod> createOrderDeliveryMethods(UTL_SObjectUnitOfWork uow, List<Product2> products) {
        List<OrderDeliveryMethod> orderDeliveryMethods = new List<OrderDeliveryMethod>();
        OrderDeliveryMethod odm = new OrderDeliveryMethod();
        odm.Name = 'Test Default Order Delivery Method';
        odm.Carrier = 'UT-12345' ;
        odm.ClassOfService = 'UT-Test Carrier';
        uow.registerRelationship(odm, OrderDeliveryMethod.ProductId, products.get(0));
        orderDeliveryMethods.add(odm);
        uow.registerNew(orderDeliveryMethods);

        return OrderDeliveryMethods;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date 29/03/2021
    * @description Create Order Delivery Method
    * @param uow UTL_SObjectUnitOfWork:
    * @param ordrDeliveryMethod OrderDeliveryMethod:
    * @param createdOrder Order:
    * @return OrderDeliveryGroup:
   ******************************************************************************************************************/
    public static OrderDeliveryGroup createOrderDeliveryGroup(UTL_SObjectUnitOfWork uow, OrderDeliveryMethod ordrDeliveryMethod, Order createdOrder) {
        OrderDeliveryGroup deliveryGroup = new OrderDeliveryGroup();
        deliveryGroup.Description = 'UT-Test Delivery Group';
        deliveryGroup.DeliveryInstructions = 'UT-Test Instruction';
        deliveryGroup.DeliverToName = 'UT_Delivery Group';
        uow.registerRelationship(deliveryGroup,OrderDeliveryGroup.OrderId,createdOrder);
        uow.registerRelationship(deliveryGroup,OrderDeliveryGroup.OrderDeliveryMethodId,ordrDeliveryMethod);
        uow.registerNew(deliveryGroup);

        return deliveryGroup;
    }

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 29/03/2021
     * @description Create Order Items
     * @param uow UTL_SObjectUnitOfWork:
     * @param ordrDeliveryGroup OrderDeliveryGroup:
     * @param createdOrder Order:
     * @param products List<Product2>:
     * @return List<OrderItem>:
    ******************************************************************************************************************/
    public static List<OrderItem> createOrderItems(UTL_SObjectUnitOfWork uow, OrderDeliveryGroup ordrDeliveryGroup, Order createdOrder, List<Product2> products) {
        List<OrderItem> orderItems = new List<OrderItem>();
        OrderItem ordrItem = new OrderItem();
        ordrItem.B2B_ExternalId__c = 'testOrderItem1';
        ordrItem.UnitPrice = 100;
        ordrItem.ListPrice = 100;
        ordrItem.Quantity = 10;
        ordrItem.B2B_LineNumber__c = 20;
        ordrItem.B2B_ReasonCode__c = B2B_UTL_GlobalConstants.ORDER_REASON_CODE_STANDARD_ORDER;
        uow.registerRelationship(ordrItem,OrderItem.OrderId,createdOrder);
        uow.registerRelationship(ordrItem,OrderItem.Product2Id,products.get(0));
        uow.registerRelationship(ordrItem,OrderItem.OrderDeliveryGroupId,ordrDeliveryGroup);
        orderItems.add(ordrItem);

        OrderItem ordrItem2 = new OrderItem();
        ordrItem2.UnitPrice = 10;
        ordrItem2.ListPrice = 10;
        ordrItem2.Quantity = 2;
        ordrItem2.B2B_LineNumber__c = 40;
        ordrItem2.B2B_ReasonCode__c = B2B_UTL_GlobalConstants.ORDER_REASON_CODE_STANDARD_ORDER;
        uow.registerRelationship(ordrItem2,OrderItem.OrderId,createdOrder);
        uow.registerRelationship(ordrItem2,OrderItem.Product2Id,products.get(0));
        uow.registerRelationship(ordrItem2,OrderItem.OrderDeliveryGroupId,ordrDeliveryGroup);
        orderItems.add(ordrItem2);

        uow.registerNew(orderItems);
        return orderItems;
    }

    public static List<OrderItem> createFirmOrderItems(UTL_SObjectUnitOfWork uow, OrderDeliveryGroup ordrDeliveryGroup, Order createdOrder, List<Product2> products) {
        List<OrderItem> orderItems = new List<OrderItem>();
        OrderItem ordrItem = new OrderItem();
        ordrItem.B2B_ExternalId__c = 'testOrderItem1';
        ordrItem.UnitPrice = 100;
        ordrItem.ListPrice = 100;
        ordrItem.Quantity = 10;
        ordrItem.B2B_LineNumber__c = 20;
        ordrItem.B2B_ReasonCode__c = B2B_UTL_GlobalConstants.ORDER_REASON_CODE_FIRM_ORDER;
        uow.registerRelationship(ordrItem,OrderItem.OrderId,createdOrder);
        uow.registerRelationship(ordrItem,OrderItem.Product2Id,products.get(0));
        uow.registerRelationship(ordrItem,OrderItem.OrderDeliveryGroupId,ordrDeliveryGroup);
        orderItems.add(ordrItem);

        OrderItem ordrItem2 = new OrderItem();
        ordrItem2.UnitPrice = 10;
        ordrItem2.ListPrice = 10;
        ordrItem2.Quantity = 2;
        ordrItem2.B2B_LineNumber__c = 40;
        ordrItem2.B2B_ReasonCode__c = B2B_UTL_GlobalConstants.ORDER_REASON_CODE_FIRM_ORDER;
        uow.registerRelationship(ordrItem2,OrderItem.OrderId,createdOrder);
        uow.registerRelationship(ordrItem2,OrderItem.Product2Id,products.get(0));
        uow.registerRelationship(ordrItem2,OrderItem.OrderDeliveryGroupId,ordrDeliveryGroup);
        orderItems.add(ordrItem2);

        uow.registerNew(orderItems);
        return orderItems;
    }

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 24/03/2021
     * @description Create Cart Delivery Group
     * @param uow UTL_SObjectUnitOfWork:
     * @param cart WebCart:
     * @return CartDeliveryGroup:
    ******************************************************************************************************************/
    public  static CartDeliveryGroup createCartDeliveryGroup(UTL_SObjectUnitOfWork uow,WebCart cart,OrderDeliveryMethod orderDeliveryMethod){
        CartDeliveryGroup deliveryGroup = new CartDeliveryGroup();
		deliveryGroup.Name = 'cartDeliveryGroup';
		uow.registerRelationship(deliveryGroup, CartDeliveryGroup.CartId, cart);
		if (orderDeliveryMethod != null) {
			uow.registerRelationship(deliveryGroup, CartDeliveryGroup.DeliveryMethodId, orderDeliveryMethod);
		}
        uow.registerNew(deliveryGroup);
        return deliveryGroup;
	}

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 15/04/2021
     * @description Create Order Delivery Items
     * @param uow UTL_SObjectUnitOfWork:
     * @param orderItem OrderItem:
     * @return List<B2B_OrderDeliveryItem__c>:
    ******************************************************************************************************************/
    public static List<B2B_OrderDeliveryItem__c> createOrderDeliveryItems(UTL_SObjectUnitOfWork uow, OrderItem orderItem) {
        List<B2B_OrderDeliveryItem__c> orderDeliveryItems = new List<B2B_OrderDeliveryItem__c>();
        B2B_OrderDeliveryItem__c orderDeliveryItem = new B2B_OrderDeliveryItem__c();
        orderDeliveryItem.B2B_ConfirmedQuantity__c = 1;
        orderDeliveryItem.B2B_CurrencyCode__c = 'CHF';
        orderDeliveryItem.B2B_Consignment__c = true;
        orderDeliveryItem.B2B_DeliveryItemId__c = 'EAZDK12349DKA';
        orderDeliveryItem.B2B_DeliveryNoteDate__c = Date.today();
        orderDeliveryItem.B2B_DeliveryNoteId__c = 'ASDJAZ213KS12';
        orderDeliveryItem.B2B_ExternalId__c = 'ODI_123DKA';
        orderDeliveryItem.B2B_ListPrice__c = 123.13;
        orderDeliveryItem.B2B_Sellable__c = true;
        orderDeliveryItem.B2B_SerialNumbers__c = 'AZEJA123JSEZ;DAKZ231LD12;EAZEAK123D';
        orderDeliveryItem.B2B_Status__c = 'C';
        orderDeliveryItem.B2B_StrapSpeakingReference__c = '';
        orderDeliveryItem.B2B_TrackingCarrier__c = 'DHL';
        orderDeliveryItem.B2B_TrackingNumber__c = 'AEAZ12342J';
        orderDeliveryItem.B2B_TrackingUrl__c = 'https://www.google.com';

        uow.registerRelationship(orderDeliveryItem, B2B_OrderDeliveryItem__c.B2B_OrderItem__c, orderItem);
        orderDeliveryItems.add(orderDeliveryItem);
        uow.registerNew(orderDeliveryItems);
        return orderDeliveryItems;
    }

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 24/03/2021
     * @description Create Cart Delivery Group Method
     * @param uow UTL_SObjectUnitOfWork:
     * @param cart Webcart:
     * @param deliveryGroup CartDeliveryGroup:
     * @param orderDeliveryMethods List<OrderDeliveryMethod>:
     * @return CartDeliveryGroupMethod:
    ******************************************************************************************************************/
    public static CartDeliveryGroupMethod createCartDeliveryGroupMethod(UTL_SObjectUnitOfWork uow, Webcart cart, CartDeliveryGroup deliveryGroup, List<OrderDeliveryMethod> orderDeliveryMethods) {

        CartDeliveryGroupMethod cartDeliveryGrpMethod = new CartDeliveryGroupMethod();
        cartDeliveryGrpMethod.Name = 'Test Cart Delivery Group Method';
        cartDeliveryGrpMethod.ShippingFee = 10.00;
        uow.registerRelationship(cartDeliveryGrpMethod, CartDeliveryGroupMethod.DeliveryMethodId, orderDeliveryMethods.get(0));
        uow.registerRelationship(cartDeliveryGrpMethod, CartDeliveryGroupMethod.WebCartId, cart);
        uow.registerRelationship(cartDeliveryGrpMethod, CartDeliveryGroupMethod.CartDeliveryGroupId, deliveryGroup);
        uow.registerNew(cartDeliveryGrpMethod);

        return cartDeliveryGrpMethod;
    }

	/*******************************************************************************************************************
     * @author Deloitte
     * @date 17/05/2021
     * @description Create Sell Out
     * @param uow UTL_SObjectUnitOfWork:
     * @param accounts List<Account>:
     * @return B2B_SellOut__c:
    ******************************************************************************************************************/
    public static List<B2B_SellOut__c> createSellOuts(UTL_SObjectUnitOfWork uow, List<Account> accounts) {
        return createSellOuts(uow, accounts, null);
	}

	/*******************************************************************************************************************
     * @author Deloitte
     * @date 17/05/2021
     * @description Create Sell Out
     * @param uow UTL_SObjectUnitOfWork:
     * @return B2B_SellOut__c:
    ******************************************************************************************************************/
    public static List<B2B_SellOutItem__c> createSellOutItems(UTL_SObjectUnitOfWork uow, List<Product2> products, List<B2B_SellOut__c> sellOuts) {
		List<B2B_SellOutItem__c> sellOutItems = new List<B2B_SellOutItem__c>();
		
		for(Product2 product : products) {
			B2B_SellOutItem__c sellOutItem = new B2B_SellOutItem__c();
			sellOutItem.B2B_WarrantyActivationDate__c = Date.today();
			sellOutItem.B2B_WarrantyEndDate__c = Date.today().addYears(1);
			sellOutItem.B2B_Status__c = 'Purchased';
			sellOutItem.B2B_Quantity__c = 1;
			Long timestamp = DateTime.now().getTime();
			sellOutItem.B2B_SelloutDetailID__c = (String) product.B2B_GlobalReference__c + '_' + timestamp;
			selloutItem.B2B_SerialNumber__c = product.B2B_GlobalReference__c;
			uow.registerRelationship(sellOutItem, B2B_SellOutItem__c.B2B_Product__c, product);
			uow.registerRelationship(sellOutItem, B2B_SellOutItem__c.B2B_SellOut__c, sellOuts[0]);

			sellOutItems.add(sellOutItem);
		}

        uow.registerNew(sellOutItems);
        return sellOutItems;
	}

	/*******************************************************************************************************************
     * @author Deloitte
     * @date 2022
     * @description Create Traffic Count
     * @param uow UTL_SObjectUnitOfWork
     * @return List<B2B_TrafficCount__c>
    ******************************************************************************************************************/
    public static List<B2B_TrafficCount__c> createTrafficCounts(UTL_SObjectUnitOfWork uow, Id posId) {
        List<B2B_TrafficCount__c> TrafficCounts = new List<B2B_TrafficCount__c>();

        B2B_TrafficCount__c TrafficCount1 = new B2B_TrafficCount__c();
        TrafficCount1.B2B_Date__c = Date.today();
        TrafficCount1.B2B_NumberClients__c = 14;
        TrafficCount1.B2B_POS__c = posId;
        TrafficCounts.add(TrafficCount1);

        B2B_TrafficCount__c TrafficCount2 = new B2B_TrafficCount__c();
        TrafficCount2.B2B_Date__c = Date.today().addDays(-1);
        TrafficCount2.B2B_NumberClients__c = 21;
        TrafficCount2.B2B_POS__c = posId;
        TrafficCounts.add(TrafficCount2);

        uow.registerNew(TrafficCounts);
        return TrafficCounts;
    }

	public static List<B2B_SellOut__c> createSellOuts(UTL_SObjectUnitOfWork uow, List<Account> accounts, Account endCustomer) {
		List<B2B_SellOut__c> sellOuts = new List<B2B_SellOut__c>();

		B2B_SellOut__c sellOut1 = new B2B_SellOut__c();
		sellOut1.B2B_Invoice__c = '1';
		sellOut1.B2B_InvoiceDate__c = Date.today();
		sellOut1.B2B_SalesId__c = '1';
		uow.registerRelationship(sellOut1, B2B_SellOut__c.B2B_BrandedPOS__c, accounts[0]);
        if (endCustomer != null)
			uow.registerRelationship(sellOut1, B2B_SellOut__c.B2B_Customer__c, endCustomer);
		sellOuts.add(sellOut1);

		B2B_SellOut__c sellOut2 = new B2B_SellOut__c();
		sellOut2.B2B_Invoice__c = '2';
		sellOut2.B2B_InvoiceDate__c = Date.today();
		sellOut2.B2B_SalesId__c = '2';
		uow.registerRelationship(sellOut2, B2B_SellOut__c.B2B_BrandedPOS__c, accounts[0]);
        if (endCustomer != null)
			uow.registerRelationship(sellOut2, B2B_SellOut__c.B2B_Customer__c, endCustomer);
		sellOuts.add(sellOut2);

		B2B_SellOut__c sellOut3 = new B2B_SellOut__c();
		sellOut3.B2B_Invoice__c = '3';
		sellOut3.B2B_InvoiceDate__c = Date.today();
		sellOut3.B2B_SalesId__c = '3';
		uow.registerRelationship(sellOut3, B2B_SellOut__c.B2B_BrandedPOS__c, accounts[0]);
        if (endCustomer != null)
			uow.registerRelationship(sellOut3, B2B_SellOut__c.B2B_Customer__c, endCustomer);
		sellOuts.add(sellOut3);

        B2B_SellOut__c sellOut4 = new B2B_SellOut__c();
        sellOut4.B2B_Invoice__c = '4';
        sellOut4.B2B_InvoiceDate__c = Date.today();
		sellOut4.B2B_SalesId__c = '4';
		uow.registerRelationship(sellOut4, B2B_SellOut__c.B2B_BrandedPOS__c, accounts[0]);
        if (endCustomer != null)
            uow.registerRelationship(sellOut4, B2B_SellOut__c.B2B_Customer__c, endCustomer);
        sellOuts.add(sellOut4);

        B2B_SellOut__c sellOut5 = new B2B_SellOut__c();
        sellOut5.B2B_Invoice__c = '5';
        sellOut5.B2B_InvoiceDate__c = Date.today();
		sellOut5.B2B_SalesId__c = '5';
		uow.registerRelationship(sellOut5, B2B_SellOut__c.B2B_BrandedPOS__c, accounts[0]);
        if (endCustomer != null)
            uow.registerRelationship(sellOut5, B2B_SellOut__c.B2B_Customer__c, endCustomer);
        sellOuts.add(sellOut5);

        uow.registerNew(sellOuts);
        return sellOuts;
	}

	public static List<B2B_ReservedPosStock__c> createReservedPosStock(UTL_SObjectUnitOfWork uow, Product2 productItem, Account accountItem){
		List<B2B_ReservedPosStock__c> reservedPosStockRecords = new List<B2B_ReservedPosStock__c>();
		B2B_ReservedPosStock__c rps = new B2B_ReservedPosStock__c();
		uow.registerRelationship(rps, B2B_ReservedPosStock__c.B2B_BrandedPOS__c, accountItem);
		uow.registerRelationship(rps, B2B_ReservedPosStock__c.B2B_Product__c, productItem);
		rps.B2B_SerialNumber__c = productItem.B2B_GlobalReference__c;
		rps.B2B_Status__c = 'Reserved';
		rps.B2B_ExpirationDate__c = Date.today();
		reservedPosStockRecords.add(rps);

        uow.registerNew(reservedPosStockRecords);
		return reservedPosStockRecords;
	}

    /*******************************************************************************************************************
     * @author Tom Mahieu <tmahieu@deloitte.com>
     * @date 30/03/2021
     * @description
     * @return INT_SwagClient:
     ******************************************************************************************************************/
    public static INT_SwagClient mockOrderSimulationInvoke() {

        Map<String, Object> additionalFieldValuesProduct3 = new Map<String, Object> {
            'totalValues' => new Map<String, Object> {
                'B2B' => new Map<String, Object> {
                    'netAmount' => new Map<String, Object> {
                        'value' => 200,
                        'currencyCode' => 'EUR'
                    },
                    'grossAmount' => new Map<String, Object> {
                        'value' => 200,
                        'currencyCode' => 'EUR'
                    },
                    'taxAmount' => new Map<String, Object> {
                        'value' => 42,
                        'currencyCode' => 'EUR'
                    },
                    'grossWeightMeasure' => new Map<String, Object> {
                            'unit' => 'kg',
                            'value' => 42
                    },
                    'netWeightMeasure' => new Map<String, Object> {
                            'unit' => 'kg',
                            'value' => 42
                    },
                    'grossVolumeMeasure' => new Map<String, Object> {
                            'unit' => 'kg',
                            'value' => 42
                    }
                }
            },
            'salesRepresentative' => new Map<String,Object> {
                'id' => 'salesRepresentative1',
                'name' => 'salesRepresentative1'
            },
            'shipTo' => new List<Object> {
                new Map<String, Object> {
                    'id' => 'abc',
                    'name' => 'shipTo'
                }
            },
            'billTo' => new List<Object> {
                new Map<String, Object> {
                    'id' => 'cde',
                    'name' => 'BillTo1'
                }
            },
            'soldTo' => new Map<String, Object> {
                'id' => 'fgh',
                'name' => 'SoldTo1'
            },
            'orderItems' => new List<Object> {
                new Map<String,Object> {
                    'lineNumber' => 20,
                    'reasonCode' => 'Y00',
                    'articleCode' => B2B_UTL_DataFactory.productSKUs[1],
                    'substitutedArticleCode' => B2B_UTL_DataFactory.productSKUs[0],
                    'deliveryPlantId' => 'plantId123',
                    'expectedDeliveryDate' => '2021-03-19',
                    'totalValues' => new Map<String,Object>{
                        'requestedQuantity' => new Map<String,Object> {
                            'unit' => 'PCE',
                            'value' => 2
                        },
                        'availableQuantity' => new Map<String,Object> {
                            'unit' => 'PCE',
                            'value' => 5
                        },
                        'netPrice' => new Map<String,Object> {
                            'amount' => new Map<String,Object> {
                                'value' => 123,
                                'currency' => 'EUR'
                            },
                            'baseQuantity' => new Map<String,Object> {
                                'unit' => 'PCE',
                                'value' => 1
                            }
                        },
                        'retailSalesPriceAmount' => new Map<String,Object> {
                            'value' => 123,
                            'currency' => 'EUR'
                        }
                    }
                }
            },
            'warnings' => new Map<String, List<Object>> {
                'B2B' => new List<Object> {
                    new Map<String, Object> {
                        'id' => '123(BM)',
                        'message' => 'The quantities have been updated to meet the rounding requirements of this product.',
                        'severityCode' => 1
                    }
                }
            }
        };

        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => JSON.serialize(additionalFieldValuesProduct3)
        }));
    }

	public static INT_SwagClient mockOrderSimulationInvokeKO403() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => new INT_Swagger.ApiException(403, 'Forbidden', null, '', null)
		}));
	}

	public static INT_SwagClient mockOrderSimulationNullResponse() {
		B2B_WR_OrderSimulationResponse.ErrorState state = new B2B_WR_OrderSimulationResponse.ErrorState();
		state.message = 'Error';
		B2B_WR_OrderSimulationResponse res = new B2B_WR_OrderSimulationResponse();
		res.responseStatus = state;
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.serialize(res)
		}));
	}

	public static INT_SwagClient mockDMSLoginInvoke() {
        Map<String, Object> token = new Map<String, Object>{
                'access_token' => 'eyJhbGciOiJSUzI1NiIsInR5'
        };
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => JSON.serialize(token)
        }));
    }

    public static INT_SwagClient mockDMSStandardizedProductsInvoke() {
        Map<String, Object> resp = new Map<String, Object>{
			'took' => 3,
			'timed_out' => false,
			'hits' => new Map<String, Object>{
				'total' => new Map<String, Integer>{
					'value' => 0
				},
				'hits' => new List<Object>{
					new Map<String, Object>{
						'_source' => new Map<String, Object>{
							'standardizedOrganizationCode' => new Map<String, Object>{
								'value' => 'BJ'
							},
							'collection' => new Map<String, Object>{
								'standardizedName' => new Map<String, Object>{
									'value' => 'LOVE'
								}
							},
							'materials' => new List<Object>{
								new Map<String, Object>{
									'standardizedColor' => new Map<String, Object>{
										'value' => 'Yellow'
									}
								}
							},
							'id' => 'CRW52000130',
							'images' => new List<Object>{
								new Map<String, Object>{
									'urls' => new List<Object>{
										new Map<String, Object>{
											'handler' => 'akamai',
											'value' => 'url'
										}
									},
									'imageTypes' => new List<Object>{
										new Map<String, Object>{
											'code' => 'DAM_MTYP_3014',
											'value' => 'Packshot'
										}
									},
									'productViews' => new List<Object>{
										new Map<String, Object>{
											'code' => 'DAM_VIEW_3007',
											'value' => 'Front'
										}
									},
									'imageBackgrounds' => new List<Object>{
										new Map<String, Object>{
											'code' => 'DAM_BGRD_0006',
											'value' => 'Transparent'
										}
									}
								}
							}
						}
					}
				}
			}
		};

        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => JSON.serialize(resp)
        }));
    }


    public static INT_SwagClient mockAvailablePOSForStockTransfer() {
        Map<String, Object> availablePOS = new Map<String, Object>{
                'name' =>'Bucherer Luzerne',
                'posCodeToBeDisplayed' => '102049',
                'country' => 'Belgium',
                'city'=> 'Brussels',
                'postalCode'=> '1000',
                'state'=> 'Brussels',
                'street'=> 'Rue de la Loi 12'
        };
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => '[{"name": "Bucherer Luzerne","posCodeToBeDisplayed": "102049","country": "Belgium", "city": "Brussels","postalCode": "1000","state": "Brussels","street": "Rue de la Loi 12"},' +
                        '{"name": "Bucherer Zurich", "posCodeToBeDisplayed": "102050","country": "Belgium", "city": "Brussels","postalCode": "1000","state": "Brussels","street": "Rue de la Loi 12"},' +
                        '{"name": "***BLOCKED***Bucherer Zurich 3","posCodeToBeDisplayed": "102060","country": "Belgium", "city": "Brussels","postalCode":"1000","state": "Brussels","street": "Rue de la Loi 20"}]'
        }));
    }

    public static INT_SwagClient mockInitiateStockTransfer() {
        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, String>{
                'invoke' => JSON.serialize('[{"message":"Stock is successfully transferred to the selected POS!"}]')
        }));
    }

	public static INT_SwagClient mockDataDogLogsSent() {
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => '{}'
		}));
	}

	public static INT_SwagClient mockAzureDiscoverKeys() {
		Map<String, Object> keys = new Map<String, Object>{
			'keys' => new List<Map<String, Object>>{
				new Map<String, Object>{ 
					'kid' => 'X2142_Tests_Signing_Cert',
					'use' => 'sig',
					'kty' => 'RSA',
					'e' => 'AQAB',
					'n' => 'oZrvWDjOSU4L_wbyBDpHkZng0xsoMMje7Rfc6bFsGeMBcSUk2MSylg-Pc1XBv__0cx_3mlKbvgeQ6Ad_TuYlP0P_OELJR8gI2Ah1A4M0kJAryvBA7LspIR7T0WdX1hR2RXxKY6mpYTsknN33JXaXlGhh88T5U1W6g5ybA5gGEI58xIONeeBiJcFbgrzj0jTOFge6rAa9cFxTkQxynuWGfoiMfOjOoIClr5WoJnjKvTA7yFmTGqFhNum6XI7dlQ_SR84EtUUTPxWiho0soJ7Vy0VLilfUt_1IiYOErGJEOdtkvkG896lkz2IgWx9JpeyY--aCQ9bpH4huvq4ZvXUAwQ' }
			}
		};
		return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'invoke' => JSON.deserialize(JSON.serialize(keys), B2B_WR_AzureJWKS.class)
		}));
	}

	public static UTL_Crypto mockCryptoVerifyOk() {
		return (UTL_Crypto) Test.createStub(UTL_Crypto.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'verify' => true
		}));
	}

	public static B2B_UTL_AuthJWS mockAuthJWS() {
		return (B2B_UTL_AuthJWS) Test.createStub(B2B_UTL_AuthJWS.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'getSFJwt' => 'My nice SF JWT'
		}));
	}

	public static List<B2B_OpeningHour__c> createOpeningHours(UTL_SObjectUnitOfWork uow,List<Account> accs){
		List<B2B_OpeningHour__c> hours = new List<B2B_OpeningHour__c>();

		for (Integer i = 0; i < accs.size(); i++) {
			for (Integer j = 0; j < i+5; j++) {
				B2B_OpeningHour__c h = new B2B_OpeningHour__c();
				h.Name = 'Test'+i+' '+j;
				h.B2B_StartTime__c = Time.newInstance(09,00,00,000);
				h.B2B_EndTime__c = Time.newInstance(17,30,00,000);
				uow.registerRelationship(h, B2B_OpeningHour__c.B2B_Account__c, accs[i]);
				hours.add(h);
			}
		}
		uow.registerNew(hours);
		return hours;
	}

	public static List<ContentVersion> createContentVersions(UTL_SObjectUnitOfWork uow) {
		List<ContentVersion> contentVersions = new List<ContentVersion>();
		for (Integer i = 0; i < 3; i++) {
			ContentVersion file = new ContentVersion();

			if(i==0){
				file.ContentLocation = 'S';
				file.VersionData = EncodingUtil.base64Decode('asdasbasas');
				file.Title = 'testFile' + i + '.txt';
				file.PathOnClient = 'testFile' + i + '.txt';
				file.IsMajorVersion = false;
				file.Language = 'en_US';
				file.B2B_ContentTypes__c = 'T&C';
			}
			else {
				file.ContentLocation = 'S';
				file.VersionData = EncodingUtil.base64Decode('asdasbasas');
				file.Title = 'testFile' + i + '.txt';
				file.PathOnClient = 'testFile' + i + '.txt';
				file.Language = 'en_US';
				file.IsMajorVersion = false;
			}

			contentVersions.add(file);
		}

		uow.registerNew(contentVersions);

		return contentVersions;
	}

	public static ContentWorkspace createContentWorkspace(UTL_SObjectUnitOfWork uow) {
		ContentWorkspace workspace = new ContentWorkspace(Name='Test');
		uow.registerNew(workspace);
		return workspace;
	}

	public static ContentWorkspaceDoc createContentWorkspaceDoc(UTL_SObjectUnitOfWork uow, ContentDocument docQuery, ContentWorkspace workspace) {
		ContentWorkspaceDoc workspaceDoc = new ContentWorkspaceDoc();
		uow.registerRelationship(workspaceDoc, ContentWorkspaceDoc.ContentDocumentId, docQuery);
		uow.registerRelationship(workspaceDoc, ContentWorkspaceDoc.ContentWorkspaceId, workspace);
		uow.registerNew(workspaceDoc);
		return workspaceDoc;
	}

	public static List<ContentVersion> contentVersions {
		get {
			if (contentVersions == null) {
				contentVersions = [SELECT Id, Title, Description, FileType, ContentDocumentId FROM ContentVersion WHERE Title LIKE 'testFile%.txt'];
			}
			return contentVersions;
		}
		private set;
	}

    /*******************************************************************************************************************
     * @author Deloitte
     * @date 21/05/2021
     * @description Create End Customers
     * @param uow UTL_SObjectUnitOfWork:
     * @return List<Account>:
    ******************************************************************************************************************/
    public static List<Account> createEndCustomers(UTL_SObjectUnitOfWork uow) {
        return createEndCustomers(uow, null);
    }

	/*******************************************************************************************************************
     * @author Deloitte
     * @date 21/05/2021
     * @description Create End Customers
     * @param uow UTL_SObjectUnitOfWork:
     * @param accountsData List<Account>:
     * @return List<Account>:
    ******************************************************************************************************************/
    public static List<Account> createEndCustomers(UTL_SObjectUnitOfWork uow, List<Account> accountsData) {
		Id personAccountRecordTypeId = UTL_SF.getRecordTypeByName(B2B_UTL_GlobalConstants.B2B_PERSONACCOUNT_RECORD_TYPE_DEV_NAME, 'Account').Id;

        List<Account> endCustomers = new List<Account>();

		for (Integer i = 0; i<10; i++) {
			Account endCustomer = new Account();
			endCustomer.LastName = 'Test_' +String.valueOf(i);
			endCustomer.B2B_ExternalId__c = String.valueOf(i);
			endCustomer.RecordTypeId = personAccountRecordTypeId;
			endCustomer.B2B_IsAnonymized__c = false;
            if (accountsData != null) {
                uow.registerRelationship(endCustomer, Account.B2B_CustomerOf__c, accountsData.get(2));
            }
			endCustomers.add(endCustomer);
		}

        uow.registerNew(endCustomers);
        return endCustomers;
    }
    /*******************************************************************************************************************
     * @author Deloitte
     * @date 27/05/2021
     * @description Create consolidated price books
     * @param uow UTL_SObjectUnitOfWork:
     * @param executeDML Boolean:
    ******************************************************************************************************************/
    public static void createConsolidatedPriceBooks(UTL_SObjectUnitOfWork uow, List<Product2> products, Boolean executeDML) {
        Datetime currentDateTime = System.now();
        List<PriceBook2> pricebooks = new List<Pricebook2>();

        Pricebook2 consolidatedPriceBook = new Pricebook2();
        consolidatedPriceBook.IsActive = true;
        consolidatedPriceBook.Description = 'Consolidated PB';
        consolidatedPriceBook.B2B_ExternalId__c = 'CHCA';
        consolidatedPriceBook.Name = 'CHCA';
        consolidatedPriceBook.ValidFrom = currentDateTime;
        consolidatedPriceBook.ValidTo = currentDateTime.addDays(100);

        pricebooks.add(consolidatedPriceBook);

        Pricebook2 priceBook1 = new Pricebook2();
        priceBook1.IsActive = true;
        priceBook1.B2B_ExternalId__c = 'CHCA_'+currentDateTime.addDays(-2).date()+'_'+currentDateTime.addDays(30).date();
        priceBook1.Name = 'CHCA_'+currentDateTime.addDays(-2).date()+'_'+currentDateTime.addDays(30).date();
        priceBook1.ValidFrom = currentDateTime.addDays(-2);
        priceBook1.ValidTo = currentDateTime.addDays(30);

        pricebooks.add(priceBook1);

        Pricebook2 prcBook2 = new Pricebook2();
        prcBook2.IsActive = true;
        prcBook2.B2B_ExternalId__c = 'CHCA_'+currentDateTime.addDays(-1).date()+'_'+currentDateTime.addDays(30).date();
        prcBook2.Name = 'CHCA_'+currentDateTime.addDays(-1).date()+'_'+currentDateTime.addDays(30).date();
        prcBook2.ValidFrom = currentDateTime.addDays(-1);
        prcBook2.ValidTo = currentDateTime.addDays(30);

        pricebooks.add(prcBook2);

		Pricebook2 prcBook3 = new Pricebook2();
		prcBook3.IsActive = true;
		prcBook3.B2B_ExternalId__c = 'DECA_'+currentDateTime.addDays(-1).date()+'_'+currentDateTime.addDays(30).date();
		prcBook3.Name = 'DECA_'+currentDateTime.addDays(-1).date()+'_'+currentDateTime.addDays(30).date();
		prcBook3.ValidFrom = currentDateTime.addDays(-1);
		prcBook3.ValidTo = currentDateTime.addDays(30);

		pricebooks.add(prcBook3);

        List<PriceBookEntry> pricebookEntries = new List<PriceBookEntry>();

        for (Product2 product : products) {
            PricebookEntry pbEntry = UTL_DataFactory.createPriceBookEntry(new Map<String, Object>{
                    'UnitPrice' => 10,
                    'IsActive' => true,
                    'UseStandardPrice' => false,
                    'Product2Id' => product.Id
            }, false);
            pricebookEntries.add(pbEntry);
            uow.registerRelationship(pbEntry, PricebookEntry.Product2Id, product);
        }

        for (PriceBook2 pricebook : pricebooks) {
            for (Product2 product : products) {
                PricebookEntry pbEntry = UTL_DataFactory.createPriceBookEntry(new Map<String, Object>{
                        'UnitPrice' => 10,
                        'IsActive' => true,
                        'UseStandardPrice' => false,
                        'Product2Id' => product.Id,
                        'Pricebook2Id' => pricebook.Id
                }, false);
                pricebookEntries.add(pbEntry);
                uow.registerRelationship(pbEntry, PricebookEntry.Product2Id, product);
                uow.registerRelationship(pbEntry, PricebookEntry.Pricebook2Id, pricebook);
            }
        }

        uow.registerNew(pricebooks);
        uow.registerNew(pricebookEntries);
        if(executeDML){
            uow.commitWork();
        }
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date 27/05/2021
    * @description Create checkoutSettings
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @return List<B2B_Localisation__c>: List of localisations for checkout settings
    ******************************************************************************************************************/
    public static List<B2B_Localisation__c> createLocalisationForCheckoutSettings(UTL_SObjectUnitOfWork uow) {
        List<B2B_Localisation__c> localisations = new List<B2B_Localisation__c>();
        B2B_Localisation__c businessUnitLocalisationCA = new B2B_Localisation__c(B2B_ExternalId__c = 'CA_11', B2B_Maison__c = 'CA', B2B_LocalisationLevel__c = 'Market/BU');
        B2B_Localisation__c salesOrgLocalisation1 = new B2B_Localisation__c(B2B_ExternalId__c = '06CA', B2B_Maison__c = 'CA', B2B_LocalisationLevel__c = 'Sales Org');

        localisations.add(salesOrgLocalisation1);
        localisations.add(businessUnitLocalisationCA);

        uow.registerRelationship(salesOrgLocalisation1, B2B_Localisation__c.B2B_ParentLocalisation__c, businessUnitLocalisationCA);
        uow.registerNew(localisations);
        return localisations;
    }
    /*******************************************************************************************************************
    * @author Deloitte
    * @date 27/05/2021
    * @description Create checkoutSettings
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @param businessUnitLocalisationCA B2B_Localisation__c: Localisation to link with CheckoutSettings
    * @return List<B2B_CheckoutSettings__c>: List of checkout settings
    ******************************************************************************************************************/
    public static List<B2B_CheckoutSettings__c> createCheckoutSettings(UTL_SObjectUnitOfWork uow, B2B_Localisation__c businessUnitLocalisationCA) {

        List<B2B_CheckoutSettings__c> checkoutSettings = new List<B2B_CheckoutSettings__c>();
        B2B_CheckoutSettings__c checkoutSetting1 = new B2B_CheckoutSettings__c();
        checkoutSetting1.B2B_Maison__c = 'CA';
        checkoutSetting1.B2B_PONumberMandatory__c = true;
		checkoutSetting1.B2B_AutomaticReservation__c = true;
        uow.registerRelationship(checkoutSetting1, B2B_CheckoutSettings__c.B2B_BusinessUnit__c, businessUnitLocalisationCA);
        checkoutSettings.add(checkoutSetting1);
        uow.registerNew(checkoutSettings);
        return checkoutSettings;
    }

    public static List<B2B_ProductSettings__c> createProductSettings(UTL_SObjectUnitOfWork uow, B2B_Localisation__c businessUnitLocalisationCA) {
		return createProductSettings(uow, businessUnitLocalisationCA, 'CA');
	}

	/*******************************************************************************************************************
    * @author Deloitte
    * @date 10/06/2021
    * @description Create productSettings
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @param businessUnitLocalisationCA B2B_Localisation__c: Localisation to link with ProductSettings
    * @return List<B2B_ProductSettings__c>: List of product settings
    ******************************************************************************************************************/
    public static List<B2B_ProductSettings__c> createProductSettings(UTL_SObjectUnitOfWork uow, B2B_Localisation__c businessUnitLocalisationCA, String maison) {

        List<B2B_ProductSettings__c> productSettings = new List<B2B_ProductSettings__c>();
        B2B_ProductSettings__c productSetting1 = new B2B_ProductSettings__c();
        productSetting1.B2B_Maison__c = maison;
        productSetting1.B2B_ShowNoveltyFlag__c = true;
        uow.registerRelationship(productSetting1, B2B_ProductSettings__c.B2B_BusinessUnit__c, businessUnitLocalisationCA);
        productSettings.add(productSetting1);
        uow.registerNew(productSettings);
        return productSettings;
	}
	/*******************************************************************************************************************
	* @author Deloitte
	* @date 06/2021
	* @description Create person account wrapper
	* @return B2B_WR_PersonAccount: PersonAccount Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_PersonAccount createPersonAccountWrapper(){
		B2B_WR_PersonAccount a = new B2B_WR_PersonAccount();
		a.endCustomer = new B2B_WR_PersonAccount.B2B_WR_PersonAccountItem();
		a.endCustomer.lastName = 'Data_Test';
		a.endCustomer.addresses = new List<B2B_WR_CustomerInformation>();
		a.endCustomer.phones = new List<B2B_WR_CustomerInformation>();

		B2B_WR_CustomerInformation ad = new B2B_WR_CustomerInformation();
		ad.addressType = 'Shipping';
		ad.street = 'Via Roma';
        ad.zipCode = '69003';
		ad.countryId = 'BE';
		ad.lastModifiedByExternalSystem = 'Booster 1';
		ad.lastModifiedDateByExternalSystem = Datetime.newInstance(2021, 10, 8, 12, 34, 56);

		a.endCustomer.addresses.add(ad);

		B2B_WR_CustomerInformation ph = new B2B_WR_CustomerInformation();
		ph.phoneType = 'Mobile';
		ph.phone = '3387656890';
		ph.lastModifiedByExternalSystem = 'Booster 1';
		ph.lastModifiedDateByExternalSystem = Datetime.newInstance(2021, 10, 8, 12, 34, 56);

		a.endCustomer.phones.add(ph);

		return a;
	}


	/*******************************************************************************************************************
	* @author Deloitte
	* @date 10/06/2021
	* @description Create sellout wrapper that passes validation rules
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperOK(String posCode) {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = posCode;
		s.sellout.documentNumber = '123456';
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{'Userut@test.com'};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.saleDetailId = '11341556';
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 1;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.saleDetailId = '11341557';
		i1.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i2 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i2.articleCode = B2B_UTL_DataFactory.productSKUs[2];
		i2.quantity = 1;
		i2.purchaseDate = '2021-05-31';
		i2.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i2.unitPrice.currencyIsoCode = 'CHF';
		i2.unitPrice.value = 6000.99;
		i2.saleDetailId = '11341558';
		i2.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i3 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i3.articleCode = B2B_UTL_DataFactory.productSKUs[2];
		i3.quantity = 1;
		i3.purchaseDate = '2021-05-31';
		i3.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i3.unitPrice.currencyIsoCode = 'CHF';
		i3.unitPrice.value = 6000.99;
		i3.saleDetailId = '11341558';
		i3.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);
		s.sellout.selloutItems.add(i2);
		s.sellout.selloutItems.add(i3);

		B2B_WR_SellOutCollection collection = new B2B_WR_SellOutCollection(null, null, s.sellout.selloutItems);
		s.sellout.sellOutItemsCollection = new List<B2B_WR_SellOutCollection>{collection};

		return s;
	}

	/*******************************************************************************************************************
	* @author Deloitte
	* @date 10/06/2021
	* @description Create sellout wrapper that passes validation rules
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperOKFromBoo1(String posCode) {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = posCode;
		s.sellout.documentNumber = '123456';
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{'Userut@test.com'};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.saleDetailId = '11341556';
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 1;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.saleDetailId = '11341557';
		i1.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i2 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i2.articleCode = B2B_UTL_DataFactory.productSKUs[2];
		i2.quantity = 2;
		i2.purchaseDate = '2021-05-31';
		i2.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i2.unitPrice.currencyIsoCode = 'CHF';
		i2.unitPrice.value = 6000.99;
		i2.saleDetailId = '11341558';
		i2.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);
		s.sellout.selloutItems.add(i2);

		B2B_WR_SellOutCollection collection = new B2B_WR_SellOutCollection(null, null, s.sellout.selloutItems);
		s.sellout.sellOutItemsCollection = new List<B2B_WR_SellOutCollection>{collection};

		return s;
	}

	/*******************************************************************************************************************
	* @author Deloitte
	* @date 21/06/2021
	* @description Create sellout wrapper like on from excel bulk upload file
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperExcelOK(String posCode) {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = posCode;
		s.sellout.documentNumber = '123456';
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{'User, Default Test'};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.saleDetailId = '11341556';
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 1;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.saleDetailId = '11341557';
		i1.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);

		return s;
	}

	/*******************************************************************************************************************
	* @author Deloitte
	* @date 18/03/2022
	* @description Create sellout wrapper like on from excel bulk upload file
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperExcelWithGuestOK(String posCode) {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = posCode;
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{''};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();
		s.sellout.soldByGuest = true;
		s.sellout.soldBy = 'Guest user';

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.saleDetailId = '11341556';
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 1;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.saleDetailId = '11341557';
		i1.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);

		return s;
	}

	/*******************************************************************************************************************
	* @author Deloitte
	* @date 10/06/2021
	* @description Create sellout wrapper that doesn't pass validation rules
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperKOSellout() {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = 'Invalid_branded_pos_id_12249215070';
		s.sellout.documentNumber = '123456';
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{'Userut@test.com'};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 2;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);

		return s;
	}

	/*******************************************************************************************************************
	* @author Deloitte
	* @date 10/06/2021
	* @description Create sellout wrapper that doesn't pass validation rules
	* @return B2B_WR_Sellout: Sellout Wrapper Instance
	******************************************************************************************************************/
	public static B2B_WR_Sellout createSelloutWrapperKOSelloutItems() {
		B2B_WR_Sellout s = new B2B_WR_Sellout();
		s.sellout = new B2B_WR_Sellout.B2B_WR_SelloutInner();
		s.sellout.posCode = 'UT100:102048:CA';
		s.sellout.documentNumber = '123456';
		s.sellout.documentDate = '2021-03-21';
		s.sellout.saleRepresentativeEmails = new List<String>{'Userut@test.com'};
		s.sellout.customerId = '1';
		s.sellout.selloutItems = new List<B2B_WR_Sellout.B2B_WR_SelloutItem>();

		B2B_WR_Sellout.B2B_WR_SelloutItem i0 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i0.articleCode = B2B_UTL_DataFactory.productSKUs[0];
		i0.quantity = 1;
		i0.purchaseDate = '2021-05-31';
		i0.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i0.unitPrice.currencyIsoCode = 'CHF';
		i0.unitPrice.value = 12999.99;
		i0.saleDetailId = '11341556';
		i0.status = 'Purchased';

		B2B_WR_Sellout.B2B_WR_SelloutItem i1 = new B2B_WR_Sellout.B2B_WR_SelloutItem();
		i1.articleCode = B2B_UTL_DataFactory.productSKUs[1];
		i1.serialNumber = '12346';
		i1.quantity = 2;
		i1.purchaseDate = '2021-05-31';
		i1.unitPrice = new B2B_WR_Sellout.B2B_WR_SelloutItemUnitPrice();
		i1.unitPrice.currencyIsoCode = 'CHF';
		i1.unitPrice.value = 6000.99;
		i1.saleDetailId = '11341557';
		i1.status = 'Purchased';

		s.sellout.selloutItems.add(i0);
		s.sellout.selloutItems.add(i1);

		return s;
	}

    /*******************************************************************************************************************
    * @author       Lennart Schelfhout <lschelfhout@deloitte.com>
    * @description  This method mocks the invoke method of the INT_SwagClient Class for the Order Documents.
    * @date         June 2021
    * @return       (INT_SwagClient): Instance of INT_SwagClient that has the invoke method mocked for Order Documents.
    *******************************************************************************************************************/
    public static INT_SwagClient createOrderDocumentsSwagClientMock(){
        String pdfText = '<HTML><BODY>';
        pdfText = pdfText + '<H2>Test</H2> </BODY></HTML>';
        Blob pdfContent = Blob.toPdf(pdfText);

        return (INT_SwagClient) Test.createStub(INT_SwagClient.class, new B2B_MP_MockProvider(new Map<String, Object>{
                'invoke' => EncodingUtil.base64Encode(pdfContent)
        }));
    }

	/*******************************************************************************************************************
    * @author       George Karapiperidis <gkarapiperidis@deloitte.gr>
    * @description  This method created test customers with sellouts and customer infos
    * @date         October 2021
    * @return       List<Account>
    *******************************************************************************************************************/
    public static List<B2B_CustomerInformation__c> createCustomerInformation(Account endCustomer, UTL_SObjectUnitOfWork uow){
		List<B2B_CustomerInformation__c> customerInfos = new List<B2B_CustomerInformation__c>();
		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_City__c = 'Thessaloniki',
			B2B_IsMain__c = true,
			B2B_Country__c = 'GR',
			B2B_ZipCode__c = '54640',
			B2B_Street__c = 'Egnatias 101',
			B2B_HouseNumber__c = '2',
			B2B_AddressType__c = B2B_UTL_GlobalConstants.ADDRESS_TYPE_HOME,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Address').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_City__c = 'Thessaloniki',
			B2B_IsMain__c = true,
			B2B_Country__c = 'GR',
			B2B_ZipCode__c = '54640',
			B2B_Street__c = 'Egnatias 101',
			B2B_HouseNumber__c = '2',
			B2B_AddressType__c = B2B_UTL_GlobalConstants.ADDRESS_TYPE_OFFICE,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Address').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_City__c = 'Thessaloniki',
			B2B_IsMain__c = true,
			B2B_Country__c = 'GR',
			B2B_ZipCode__c = '54640',
			B2B_Street__c = 'Egnatias 101',
			B2B_HouseNumber__c = '2',
			B2B_AddressType__c = B2B_UTL_GlobalConstants.ADDRESS_TYPE_SHIPPING,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Address').getRecordTypeId()
		));
		
		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_PhonePrefix__c = 'af',
			B2B_IsMain__c = true,
			B2B_Phone__c = '5555555555',
			B2B_PhoneType__c = B2B_UTL_GlobalConstants.PHONE_TYPE_MOBILE,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Phone').getRecordTypeId()
		));
		
		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_PhonePrefix__c = 'af',
			B2B_IsMain__c = true,
			B2B_Phone__c = '5555555555',
			B2B_PhoneType__c = B2B_UTL_GlobalConstants.PHONE_TYPE_HOME,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Phone').getRecordTypeId()
		));
		
		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_PhonePrefix__c = 'af',
			B2B_IsMain__c = true,
			B2B_Phone__c = '5555555555',
			B2B_PhoneType__c = B2B_UTL_GlobalConstants.PHONE_TYPE_OFFICE,
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Phone').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Anniversary',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Baptism',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Barmitza',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Batmitzva',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Communion',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Debutante',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Engagement',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Graduation',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		customerInfos.add(new B2B_CustomerInformation__c(
			B2B_EventType__c = 'Other',
			B2B_EventDate__c = System.today(),
			RecordTypeId = Schema.SObjectType.B2B_CustomerInformation__c.getRecordTypeInfosByDeveloperName().get('B2B_Event').getRecordTypeId()
		));

		for(B2B_CustomerInformation__c info: customerInfos) {
			uow.registerRelationship(info, B2B_CustomerInformation__c.B2B_Account__c,endCustomer);
		}
		
        uow.registerNew(customerInfos);
		return customerInfos;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date 21/06/2021
    * @description Create customer database groups
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @return List<B2B_CustomerDatabaseGroup__c>: List of customer database groups
    ******************************************************************************************************************/
    public static List<B2B_CustomerDatabaseGroup__c> createCdbGroup(UTL_SObjectUnitOfWork uow) {

        List<B2B_CustomerDatabaseGroup__c> cdbGroups = new List<B2B_CustomerDatabaseGroup__c>();
        B2B_CustomerDatabaseGroup__c cdbGroup = new B2B_CustomerDatabaseGroup__c();
        cdbGroup.B2B_CustomerGroupId__c = '12345';
        cdbGroups.add(cdbGroup);

        uow.registerNew(cdbGroups);
        return cdbGroups;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date 21/06/2021
    * @description Create Return Documents
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @param brandedPOS Account: To link Return Document with Branded POS
    * @return List<B2B_ReturnDocument__c>: List of product settings
    ******************************************************************************************************************/
    public static List<B2B_ReturnDocument__c> createReturnDocuments(UTL_SObjectUnitOfWork uow, Account brandedPOS) {

        List<B2B_ReturnDocument__c> returnDocuments = new List<B2B_ReturnDocument__c>();
        B2B_ReturnDocument__c authorizationForm = new B2B_ReturnDocument__c();
        authorizationForm.B2B_DocumentID__c = '70313697567';
		authorizationForm.B2B_ExternalId__c = returnDocumentNames[0] + '_' + brandedPOS.B2B_ExternalId__c + '_ZB06';
        authorizationForm.B2B_DocumentType__c = 'ZB06';
        authorizationForm.B2B_ReturnDate__c = Date.today();
        authorizationForm.Name = returnDocumentNames[0];
		authorizationForm.B2B_PurchaseOrderID__c = '0';
        uow.registerRelationship(authorizationForm, B2B_ReturnDocument__c.B2B_BrandedPOS__c, brandedPOS);
        returnDocuments.add(authorizationForm);

		B2B_ReturnDocument__c returnNote = new B2B_ReturnDocument__c();
        returnNote.B2B_DocumentID__c = '70313697567';
		returnNote.B2B_ExternalId__c = returnDocumentNames[0] + '_' + brandedPOS.B2B_ExternalId__c + '_ZB14';
        returnNote.B2B_DocumentType__c = 'ZB14';
        returnNote.B2B_ReturnDate__c = Date.today();
        returnNote.Name = returnDocumentNames[0];
		returnNote.B2B_PurchaseOrderID__c = '143241244';
        uow.registerRelationship(returnNote, B2B_ReturnDocument__c.B2B_BrandedPOS__c, brandedPOS);
        returnDocuments.add(returnNote);

        B2B_ReturnDocument__c returnNote2 = new B2B_ReturnDocument__c();
        returnNote2.B2B_DocumentID__c = '703136975678';
		returnNote2.B2B_ExternalId__c = returnDocumentNames[1] + '_' + brandedPOS.B2B_ExternalId__c + '_ZB14';
        returnNote2.B2B_DocumentType__c = 'ZB14';
        returnNote2.B2B_ReturnDate__c = Date.today().addDays(-1);
        returnNote2.Name = returnDocumentNames[1];
		returnNote2.B2B_PurchaseOrderID__c = '143241245';
        uow.registerRelationship(returnNote2, B2B_ReturnDocument__c.B2B_BrandedPOS__c, brandedPOS);
        returnDocuments.add(returnNote2);
        uow.registerNew(returnDocuments);
        return returnDocuments;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date June 2021
    * @description Create Click From Store POS Eligibility RecordsS
    * @param uow UTL_SObjectUnitOfWork: Instance of Unit of work
    * @param brandedPOS Account: To link Click From Store with Branded POS
    * @param businessUnitLocalisationCA B2B_Localisation__c: To link Click From Store with Business Unit
    * @return List<B2B_ClickFromStorePOSEligibility__c>: List of  Click From Store POS Eligibility
    ******************************************************************************************************************/
    public static List<B2B_ClickFromStorePOSEligibility__c> createClickFromStorePOSEligibility(UTL_SObjectUnitOfWork uow, Account brandedPOS, B2B_Localisation__c businessUnitLocalisationCA) {
        List<B2B_ClickFromStorePOSEligibility__c> cfsPOSEligibilities = new List<B2B_ClickFromStorePOSEligibility__c>();

        B2B_ClickFromStorePOSEligibility__c cfsPOStorePOSEligibilityBrandedPOS1 = new B2B_ClickFromStorePOSEligibility__c();
        cfsPOStorePOSEligibilityBrandedPOS1.B2B_Maison__c = 'CA';
        cfsPOStorePOSEligibilityBrandedPOS1.B2B_POSType__c = null;
        cfsPOStorePOSEligibilityBrandedPOS1.B2B_EligibleForClickFromStore__c = false;
        cfsPOStorePOSEligibilityBrandedPOS1.B2B_ExternalId__c = 'CA_11';
        uow.registerRelationship(cfsPOStorePOSEligibilityBrandedPOS1, B2B_ClickFromStorePOSEligibility__c.B2B_BusinessUnit__c, businessUnitLocalisationCA);
        cfsPOSEligibilities.add(cfsPOStorePOSEligibilityBrandedPOS1);

        B2B_ClickFromStorePOSEligibility__c cfsPOStorePOSEligibilityBrandedPOS2 = new B2B_ClickFromStorePOSEligibility__c();
        cfsPOStorePOSEligibilityBrandedPOS2.B2B_Maison__c = 'CA';
        cfsPOStorePOSEligibilityBrandedPOS2.B2B_POSType__c = null;
        cfsPOStorePOSEligibilityBrandedPOS2.B2B_EligibleForClickFromStore__c = true;
        cfsPOStorePOSEligibilityBrandedPOS2.B2B_ExternalId__c = 'CA_05';
        uow.registerRelationship(cfsPOStorePOSEligibilityBrandedPOS2, B2B_ClickFromStorePOSEligibility__c.B2B_BrandedPOS__c, brandedPOS);
        cfsPOSEligibilities.add(cfsPOStorePOSEligibilityBrandedPOS2);

        B2B_ClickFromStorePOSEligibility__c cfsPOStorePOSEligibilityBrandedPOS3 = new B2B_ClickFromStorePOSEligibility__c();
        cfsPOStorePOSEligibilityBrandedPOS3.B2B_Maison__c = 'CA';
        cfsPOStorePOSEligibilityBrandedPOS3.B2B_POSType__c = '1';
        cfsPOStorePOSEligibilityBrandedPOS3.B2B_EligibleForClickFromStore__c = true;
        cfsPOStorePOSEligibilityBrandedPOS3.B2B_ExternalId__c = 'CA_07';
        uow.registerRelationship(cfsPOStorePOSEligibilityBrandedPOS3, B2B_ClickFromStorePOSEligibility__c.B2B_BusinessUnit__c, businessUnitLocalisationCA);
        cfsPOSEligibilities.add(cfsPOStorePOSEligibilityBrandedPOS3);

        B2B_ClickFromStorePOSEligibility__c cfsPOStorePOSEligibility4 = new B2B_ClickFromStorePOSEligibility__c();
        cfsPOStorePOSEligibility4.B2B_Maison__c = 'CA';
        cfsPOStorePOSEligibility4.B2B_EligibleForClickFromStore__c = true;
        cfsPOStorePOSEligibility4.B2B_ExternalId__c = 'UT_CA';
        cfsPOSEligibilities.add(cfsPOStorePOSEligibility4);

        B2B_ClickFromStorePOSEligibility__c cfsPOStorePOSEligibility5 = new B2B_ClickFromStorePOSEligibility__c();
        cfsPOStorePOSEligibility5.B2B_Maison__c = 'MB';
        cfsPOStorePOSEligibility5.B2B_EligibleForClickFromStore__c = true;
        cfsPOStorePOSEligibility5.B2B_ExternalId__c = 'UT_MB';
        cfsPOSEligibilities.add(cfsPOStorePOSEligibility5);

        uow.registerNew(cfsPOSEligibilities);

        return cfsPOSEligibilities;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date June 2021
    * @description Returns mock response for ProductIndexes testing
    * @return B2B_SearchSettings_CAPI: Null list for test purposes
    ******************************************************************************************************************/
	public static B2B_SearchSettings_CAPI mockSettingsCAPIfunctions() {
		return (B2B_SearchSettings_CAPI) Test.createStub(B2B_SearchSettings_CAPI.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'createCommerceSearchIndex' => null
		}));
	}

	public static B2B_SearchSettings_CAPI mockSettingsCAPIfunctionsKO() {
		return (B2B_SearchSettings_CAPI) Test.createStub(B2B_SearchSettings_CAPI.class, new B2B_MP_MockProvider(new Map<String, Object>{
			'createCommerceSearchIndex' => new B2B_UTL_DataFactoryException()
		}));
	}

	public static void mockCreateLogMessages(UTL_SObjectUnitOfWork uow) {
		LOG_LogMessage__c errorLog = new LOG_LogMessage__c(
			LOG_Source__c='Test',
			LOG_Message__c='Test',
			LOG_Debug_Level__c='Error',
			LOG_Log_Code__c='Test',
			LOG_Stack_Trace__c='Test'
		);
		LOG_LogMessage__c warningLog = new LOG_LogMessage__c(
			LOG_Source__c='Test',
			LOG_Message__c='Test',
			LOG_Debug_Level__c='Warning',
			LOG_Log_Code__c='Test',
			LOG_Stack_Trace__c='Test'
		);
		uow.registerNew(errorLog);
		uow.registerNew(warningLog);
	}

    /*******************************************************************************************************************
    * @author Deloitte
    * @date September 2021
    * @description Create POS Clusters
    * @return List<B2B_POSCluster__c>: List of Pos Cluster
    ******************************************************************************************************************/
    public static List<B2B_POSCluster__c> createPosClusters() {
        UTL_SObjectUnitOfWork uow = new UTL_SObjectUnitOfWork(B2B_UTL_GlobalConstants.SOBJECTS_DML_DEPENDENCIES);
        List<B2B_POSCluster__c> posClusters = new List<B2B_POSCluster__c>();
        for(Integer i=0;i<5;i++) {
            posClusters.add(new B2B_POSCluster__c(B2B_Description__c='Test POS Cluster '+i));
        }
        uow.registerUpsert(posClusters);
        uow.commitWork();
        return posClusters;
    }

    /*******************************************************************************************************************
    * @author Deloitte
    * @date September 2021
    * @description Create POS Clusters
    * @return List<B2B_POSCluster__c>: List of Pos Cluster
    ******************************************************************************************************************/
    public static List<B2B_POSCluster__c> createPosClusters(UTL_SObjectUnitOfWork uow) {
        List<B2B_POSCluster__c> posClusters = new List<B2B_POSCluster__c>();
        for(Integer i=0;i<5;i++) {
            posClusters.add(new B2B_POSCluster__c(B2B_Description__c='Test POS Cluster '+i));
        }
        uow.registerUpsert(posClusters);
        return posClusters;
    }

	public static B2B_JWTConversionSettings__c createJWTConversionSettings(UTL_SObjectUnitOfWork uow, String azp, String issuer, String audience) {
		B2B_JWTConversionSettings__c setting = new B2B_JWTConversionSettings__c(Name = azp, B2B_SFIssuer__c = issuer, B2B_SFAudience__c = audience);
		uow.registerNew(setting);
		return setting;
	}

	/*******************************************************************************************************************
    * @author         Deloitte
	* @description    This method creates POS Location recordss
	* @date           November 2021
	* @param          uow UTL_SObjectUnitOfWork: Instance of Unit of work
	* @return         List<B2B_POSLocation__c>: List of POS Location records.
    ******************************************************************************************************************/
    public static List<B2B_POSLocation__c> createPOSLocations(UTL_SObjectUnitOfWork uow) {
		List<B2B_POSLocation__c> posLocations = new List<B2B_POSLocation__c> {
			new B2B_POSLocation__c(Name = 'loc1', B2B_LocationType__c = '1', B2B_City__c = 'Luzern', B2B_PostalCode__c = '01', B2B_StreetName__c = 'Street', B2B_StreetNumber__c = '10'),
			new B2B_POSLocation__c(Name = 'loc2', B2B_LocationType__c = '1', B2B_City__c = 'Luzern', B2B_PostalCode__c = '01', B2B_StreetName__c = 'Street'),
			new B2B_POSLocation__c(Name = 'loc3', B2B_LocationType__c = '1', B2B_City__c = 'Luzern', B2B_PostalCode__c = '01', B2B_StreetNumber__c = '10')
		};
		uow.registerNew(posLocations);
		return posLocations;
	}

	/*******************************************************************************************************************
     * @author Deloitte
     * @date November 2021
     * @param uow UTL_SObjectUnitOfWork:
     * @return B2B_OrderDocuments__c:
    ******************************************************************************************************************/
	public static List<B2B_OrderDocument__c> createOrderDocuments(UTL_SObjectUnitOfWork uow, OrderItem orderItem){
		List<B2B_OrderDocument__c> orderDocuments = new List<B2B_OrderDocument__c>();

		B2B_OrderDocument__c orderDoc1 = new B2B_OrderDocument__c();
		orderDoc1.Name = 'Ordoc1';
		orderDoc1.B2B_DocumentType__c = 'CRN';
		orderDoc1.B2B_DocumentDate__c = Date.today();
		orderDoc1.B2B_DocumentId__c = '70313697567';
		orderDoc1.B2B_DocumentItemId__c = '32472246';
		orderDoc1.B2B_DocumentQuantity__c = 1;
		uow.registerRelationship(orderDoc1,B2B_OrderDocument__c.B2B_OrderItem__c,orderItem);
		orderDocuments.add(orderDoc1);

		B2B_OrderDocument__c orderDoc2 = new B2B_OrderDocument__c();
		orderDoc2.Name = 'Ordoc2';
		orderDoc2.B2B_DocumentType__c = 'CRN';
		orderDoc2.B2B_DocumentDate__c = Date.today();
		orderDoc2.B2B_DocumentId__c = '70313697565';
		orderDoc2.B2B_DocumentItemId__c = '32472244';
		orderDoc2.B2B_DocumentQuantity__c = 1;
		uow.registerRelationship(orderDoc2,B2B_OrderDocument__c.B2B_OrderItem__c,orderItem);
		orderDocuments.add(orderDoc2);

		uow.registerNew(orderDocuments);

		return orderDocuments;
	}

	/*******************************************************************************************************************
     * @author Deloitte
     * @date December 2021
     * @param uow UTL_SObjectUnitOfWork:
     * @return List<B2B_PrivacyPolicy__c:
    ******************************************************************************************************************/
	public static List<B2B_PrivacyPolicy__c> createPrivacyPolicyRecords(UTL_SObjectUnitOfWork uow){
		List<B2B_PrivacyPolicy__c> privacyPolicies = new List<B2B_PrivacyPolicy__c>();

		B2B_PrivacyPolicy__c privacyPolicy1 = new B2B_PrivacyPolicy__c();
		privacyPolicy1.B2B_Country__c = 'CH';
		privacyPolicy1.B2B_Brand__c = 'CAR';
		privacyPolicy1.B2B_Language__c = 'eng';
		privacyPolicy1.B2B_IsDefaultLanguage__c = '1';
		privacyPolicies.add(privacyPolicy1);

		B2B_PrivacyPolicy__c privacyPolicy2 = new B2B_PrivacyPolicy__c();
		privacyPolicy2.B2B_Country__c = 'CH';
		privacyPolicy2.B2B_Brand__c = 'CAR';
		privacyPolicy2.B2B_Language__c = 'fre';
		privacyPolicy2.B2B_IsDefaultLanguage__c = '0';
		privacyPolicies.add(privacyPolicy2);

		uow.registerNew(privacyPolicies);

		return privacyPolicies;
	}

    /*******************************************************************************************************************
     * @author Deloitte
     * @date January 2022
     * @param uow UTL_SObjectUnitOfWork:
     * @return List<B2B_ConsignmentStockTransfer__c>:
    ******************************************************************************************************************/
    public static List<B2B_ConsignmentStockTransfer__c> createConsignmentStockTransferRecords(UTL_SObjectUnitOfWork uow){
        List<B2B_ConsignmentStockTransfer__c> consignmentStockTransfers = new List<B2B_ConsignmentStockTransfer__c>();

        B2B_ConsignmentStockTransfer__c consignmentStockTransfer = new B2B_ConsignmentStockTransfer__c();
        consignmentStockTransfer.B2B_Maison__c = 'CAR';
        consignmentStockTransfer.B2B_IsActive__c = true;
        consignmentStockTransfers.add(consignmentStockTransfer);

        uow.registerNew(consignmentStockTransfers);

        return consignmentStockTransfers;
    }

    public static void createQuickActionsCustomSetting(UTL_SObjectUnitOfWork uow){
        List<B2B_QuickAction__c> quickActions = new List<B2B_QuickAction__c>();

        B2B_QuickAction__c quickAction = new B2B_QuickAction__c();
        quickAction.B2B_QuickActionLabel__c = 'Inset data';
        quickAction.B2B_QuickActionURL__c = 'https://www.google.com';
        quickAction.Name = 'Insert';
		quickAction.B2B_PageName__c = 'Test Page';
        quickActions.add(quickAction);

        B2B_QuickAction__c quickAction2 = new B2B_QuickAction__c();
        quickAction2.B2B_QuickActionLabel__c = 'Inset data';
        quickAction2.B2B_QuickActionURL__c = 'https://www.google.com';
        quickAction2.Name = 'Insert data';
		quickAction2.B2B_PageName__c = 'Test Page';
		quickAction2.B2B_CustomPermissionAPIName__c = 'B2B_CP_BUConfigurationManagement';
        quickActions.add(quickAction2);

		B2B_QuickAction__c quickAction3 = new B2B_QuickAction__c();
		quickAction3.B2B_QuickActionLabel__c = 'Inset data';
		quickAction3.B2B_QuickActionURL__c = 'https://www.google.com';
		quickAction3.Name = 'Insert data2';
		quickAction3.B2B_PageName__c = 'Test Page2';
		quickActions.add(quickAction3);

        uow.registerNew(quickActions);
    }
	/**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a User Role
    * @date         2022-02-08
    * @return       UserRole:   Returns User role
    **************************************************************************************************************************************************************************/
    public static UserRole createUserRole(UTL_SObjectUnitOfWork uow, String userRoleName){
        UserRole role = new UserRole(DeveloperName = userRoleName, Name = userRoleName);
        uow.registerNew(role);
        return role;
    }

	/**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a list of BuyerGroup with Localisation
    * @date         2022-02-09
    * @return       List<BuyerGroup>
    **************************************************************************************************************************************************************************/
	public static List<BuyerGroup> createBuyerGroupsWithLocalisation(UTL_SObjectUnitOfWork uow, B2B_Localisation__c localisation) {
        List<BuyerGroup> buyerGroups = new List<BuyerGroup>();

        BuyerGroup buyerGroup1 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'BE', B2B_POSType__c = '1', Name = 'CA_8_0ACA_BE_1', B2B_ExternalId__c = 'CA_8_0ACA_BE_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup2 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'BE', B2B_POSType__c = '2', Name = 'CA_8_0ACA_BE_2', B2B_ExternalId__c = 'CA_8_0ACA_BE_2', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup3 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'NL', B2B_POSType__c = '1', Name = 'CA_8_0ACA_NL_1', B2B_ExternalId__c = 'CA_8_0ACA_NL_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup4 = new BuyerGroup(B2B_BrandId__c = 'CA', B2B_CountryCode__c = 'NL', B2B_POSType__c = '2', Name = 'CA_8_0ACA_NL_2', B2B_ExternalId__c = 'CA_8_0ACA_NL_2', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup5 = new BuyerGroup(B2B_BrandId__c = 'MB', B2B_CountryCode__c = 'BE', B2B_POSType__c = '1', Name = 'MB_8_0AMB_BE_1', B2B_ExternalId__c = 'MB_8_0AMB_BE_1', B2B_DistributionChannel__c = '02');
        BuyerGroup buyerGroup6 = new BuyerGroup(B2B_BrandId__c = 'MB', B2B_CountryCode__c = 'NL', B2B_POSType__c = '1', Name = 'MB_8_0AMB_NL_1', B2B_ExternalId__c = 'MB_8_0AMB_NL_1', B2B_DistributionChannel__c = '02');

        buyerGroups.add(buyerGroup1);
        buyerGroups.add(buyerGroup2);
        buyerGroups.add(buyerGroup3);
        buyerGroups.add(buyerGroup4);
        buyerGroups.add(buyerGroup5);
        buyerGroups.add(buyerGroup6);

        uow.registerRelationship(buyerGroup1, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerRelationship(buyerGroup2, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerRelationship(buyerGroup3, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerRelationship(buyerGroup4, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerRelationship(buyerGroup5, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerRelationship(buyerGroup6, BuyerGroup.B2B_Localisation__c, localisation);
        uow.registerNew(buyerGroups);

        return buyerGroups;
    }

	/**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a list of B2B_ProductBusinessUnitInfo__c with Localisation and product
    * @date         2022-02-09
    * @return       List<B2B_ProductBusinessUnitInfo__c>
    **************************************************************************************************************************************************************************/
	public static List<B2B_ProductBusinessUnitInfo__c> createProductBusinessUnitInfo(UTL_SObjectUnitOfWork uow, Product2 product, B2B_Localisation__c localisation) {
        List<B2B_ProductBusinessUnitInfo__c> productBusinessUnitInfos = new List<B2B_ProductBusinessUnitInfo__c>();

        B2B_ProductBusinessUnitInfo__c productBusinessUnitInfo1 = new B2B_ProductBusinessUnitInfo__c(B2B_ExternalId__c = '01');
        B2B_ProductBusinessUnitInfo__c productBusinessUnitInfo2 = new B2B_ProductBusinessUnitInfo__c(B2B_ExternalId__c = '02');
        B2B_ProductBusinessUnitInfo__c productBusinessUnitInfo3 = new B2B_ProductBusinessUnitInfo__c(B2B_ExternalId__c = '03');

        productBusinessUnitInfos.add(productBusinessUnitInfo1);
        productBusinessUnitInfos.add(productBusinessUnitInfo2);
        productBusinessUnitInfos.add(productBusinessUnitInfo3);

        uow.registerRelationship(productBusinessUnitInfo1, B2B_ProductBusinessUnitInfo__c.B2B_Product__c, product);
        uow.registerRelationship(productBusinessUnitInfo1, B2B_ProductBusinessUnitInfo__c.B2B_Localisation__c, localisation);
        uow.registerRelationship(productBusinessUnitInfo2, B2B_ProductBusinessUnitInfo__c.B2B_Product__c, product);
        uow.registerRelationship(productBusinessUnitInfo2, B2B_ProductBusinessUnitInfo__c.B2B_Localisation__c, localisation);
        uow.registerRelationship(productBusinessUnitInfo3, B2B_ProductBusinessUnitInfo__c.B2B_Product__c, product);
        uow.registerRelationship(productBusinessUnitInfo3, B2B_ProductBusinessUnitInfo__c.B2B_Localisation__c, localisation);
        uow.registerNew(productBusinessUnitInfos);

        return productBusinessUnitInfos;
    }

	/**************************************************************************************************************************************************************************
    * @author       Deloitte
    * @description  This method creates a list of CommerceEntitlementPolicy with Localisation
    * @date         2022-02-09
    * @return       List<CommerceEntitlementPolicy>
    **************************************************************************************************************************************************************************/
	public static List<CommerceEntitlementPolicy> createEntitlementPolicies(UTL_SObjectUnitOfWork uow, B2B_Localisation__c localisation) {
        List<CommerceEntitlementPolicy> entitlementPolicies = new List<CommerceEntitlementPolicy>();

        CommerceEntitlementPolicy entitlementPolicy = new CommerceEntitlementPolicy(Name = '01');

        entitlementPolicies.add(entitlementPolicy);

        uow.registerRelationship(entitlementPolicy, CommerceEntitlementPolicy.B2B_Localisation__c, localisation);
        uow.registerNew(entitlementPolicies);

        return entitlementPolicies;
    }


    public static List<ProductCategory> createCategoriesAllForCatalogs(UTL_SObjectUnitOfWork uow, List<ProductCatalog> productCatalogs) {
        List<ProductCategory> categories = new List<ProductCategory>();
        for (Integer i=0; i < productCatalogs.size(); i++) {
            for (Integer j=0; j < productCategories.size(); j++) {
                ProductCategory parentCategory = new ProductCategory();
                parentCategory.Name = productCatalogs[i].Name;
                parentCategory.B2B_ExternalId__c = productCategories[j] + '_ALLPRODUCTS' + '_' + productCatalogs[i].Name ;
                uow.registerRelationship(parentCategory, ProductCategory.CatalogId, productCatalogs[i]);
                uow.registerNew(parentCategory);
                ProductCategory pc = new ProductCategory();
                pc.Name = productCatalogs[i].Name;
                uow.registerRelationship(pc, ProductCategory.ParentCategoryId, parentCategory);
                uow.registerRelationship(pc, ProductCategory.CatalogId, productCatalogs[i]);
                categories.add(pc);
            }
        }
        uow.registerNew(categories);
        return categories;
    }

    public static List<ProductCategoryProduct> createProductAllCategoryProducts(UTL_SObjectUnitOfWork uow, List<Product2> products, List<ProductCategory> categories) {
        List<ProductCategoryProduct> categoryProducts = new List<ProductCategoryProduct>();


        for (Integer i=0; i < 4; i++) {
            ProductCategoryProduct pc = new ProductCategoryProduct();
            uow.registerRelationship(pc,ProductCategoryProduct.ProductId, products[i]);
            uow.registerRelationship(pc,ProductCategoryProduct.ProductCategoryId,categories[i]);
            categoryProducts.add(pc);
        }
        uow.registerNew(categoryProducts);
        return categoryProducts;
    }

	public class B2B_UTL_DataFactoryException extends Exception {}

    public static void createTechnicalAttributeSetting(UTL_SObjectUnitOfWork uow) {
        B2B_TechnicalAttributeSetting__c technical = new B2B_TechnicalAttributeSetting__c();
        technical.B2B_Enabled__c = true;
        technical.B2B_FieldName__c = 'true';
        technical.B2B_DisplayRank__c = 1;
        uow.registerNew(technical);
    }
}