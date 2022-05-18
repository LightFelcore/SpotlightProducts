/**
 * Created by mdesmedt on 3/02/2021.
 */

public with sharing class B2B_UTL_GlobalConstants
{
    public static final String API_SYSTEM = 'Booster';

	public static final String ADDRESS_TYPE_HOME = 'Home';
	public static final String ADDRESS_TYPE_OFFICE = 'Office';
	public static final String ADDRESS_TYPE_SHIPPING = 'Shipping';

	public static final String PHONE_TYPE_MOBILE = 'Mobile';
	public static final String PHONE_TYPE_HOME = 'Home';
	public static final String PHONE_TYPE_OFFICE = 'Work';

	public static final String CFS_CHECKOUT_TYPE = 'Click from Store';

	public static final String REASON_CODE_Y00 = 'Y00';

	public static final String PRODUCT_TYPE_FINISHED_GOODS = '01';
	public static final String PRODUCT_TYPE_SPARE_PARTS = '02';
	public static final String PRODUCT_TYPE_STRAPS = '04';

	public static final Map<String, String> PRODUCT_TYPES = new Map<String, String> {
			'01'	=>	'Finished Goods',
			'04'	=>	'Straps'
	};

	// This maps the API names for the custom permissions to the DeveloperName of the Site records that describe the UrlPrefixes to redirect the User
    // either automatically when he/she has access to only one brand or manually through the maison selection component
	public static final Map<String, String> MAISON_ACCESS_CUST_PERM_TO_SITE_NAME = new Map<String, String> {
		'B2B_CP_StoreAccess_Cartier' => 'Cartier',
		'B2B_CP_StoreAccess_JaegerLeCoultre' => 'Jaeger Le Coultre',
		'B2B_CP_StoreAccess_Montblanc' => 'Montblanc',
		'B2B_CP_StoreAccess_MultiMaison' => 'Maison Selector',
		'B2B_CP_StoreAccess_IWC' => 'IWC',
		'B2B_CP_StoreAccess_Panerai' => 'Panerai',
		'B2B_CP_StoreAccess_Piaget' => 'Piaget',
		'B2B_CP_StoreAccess_RogerDubuis' => 'Roger Dubuis',
		'B2B_CP_StoreAccess_VacheronConstantin' => 'Vacheron Constantin',
		'B2B_CP_StoreAccess_ALangeShone' => 'A Lange et Shone',
		'B2B_CP_StoreAccess_BaumeMercier' => 'Baume et Mercier',
		'B2B_CP_StoreAccess_VanCleefArples' => 'Van Cleef et Arples'

	};

	public static final Map<String, String> BRAND_ID_TO_PERM_SET = new Map<String, String> {
		'B2B_CommerceUserCartier' => 'CA',
		'B2B_CommerceUserMontblanc' => 'MB',
		'B2B_CommerceUserJaegerLeCoultre' => 'JL',
		'B2B_CommerceUserMultiMaison' => 'RIC',
		'B2B_CommerceUserPanerai' => 'PA',
		'B2B_CommerceUserPiaget' => 'PI',
		'B2B_CommerceUserRogerDubuis' => 'RD',
		'B2B_CommerceUserBaumeMercier' => 'BM',
		'B2B_CommerceUserVacheronConstantin' => 'VA',
		'B2B_CommerceUserVanCleefArples' => 'VC',
		'B2B_CommerceUserIWC' => 'IW',
		'B2B_CommerceUserALangeShone' => 'LS'
	};

	public static final Map<String, String> LOGIN_AS_PERM_SET_TO_BRAND = new Map<String, String> {
		'B2B_LoggingAsExternalUserCartier' => 'CA',
		'B2B_LoggingAsExternalUserMontblanc' => 'MB',
		'B2B_LoggingAsExternalUserJaegerLeCoultre' => 'JL',
		'B2B_LoggingAsExternalUserPanerai' => 'PA',
		'B2B_LoggingAsExternalUserPiaget' => 'PI',
		'B2B_LoggingAsExternalUserRogerDubuis' => 'RD',
		'B2B_LoggingAsExternalUserBaumeMercier' => 'BM',
		'B2B_LoggingAsExternalUserVacheronConstantin' => 'VA',
		'B2B_LoggingAsExternalUserVanCleefArples' => 'VC',
		'B2B_LoggingAsExternalUserIWC' => 'IW',
		'B2B_LoggingAsExternalUserALangeShone' => 'LS'
	};

	// This maps the API names for the Add To Cart custom permissions for each Maison
	public static final Map<String,String> ADD_TO_CART_CUST_PERM = new Map<String,String> {
		'CA' => 'B2B_CP_AddToCart_Cartier',
		'JL' => 'B2B_CP_AddToCart_JaegerLeCoultre',
		'MB' => 'B2B_CP_AddToCart_Montblanc',
		'PA' => 'B2B_CP_AddToCart_Panerai',
		'PI' => 'B2B_CP_AddToCart_Piaget',
		'RD' => 'B2B_CP_AddToCart_RogerDubuis',
		'BM' => 'B2B_CP_AddToCart_BaumeMercier',
		'VA' => 'B2B_CP_AddToCart_VacheronConstantin',
		'VC' => 'B2B_CP_AddToCart_VanCleefArples',
		'IW' => 'B2B_CP_AddToCart_IWC',
		'LS' => 'B2B_CP_AddToCart_ALangeShone'
	};

	// This string contain the API names for the Access My Orders Section custom permissions
	public static final String MY_ORDERS_SECTION_CUST_PERM  = 'B2B_CP_AccessMyOrdersSection';

	// This string contain the API names for the Access Sell-out Section custom permissions
	public static final String SELL_OUT_SECTION_CUST_PERM  = 'B2B_CP_AccessSellOutSection';

	// This string contain the API names for the Declare Sell-out Section custom permissions
	public static final String DECLARE_SELL_OUT_CUST_PERM  = 'B2B_SellOut';

	// This string contain the API names for the Access Sell-out Section permission set
	public static final String SELL_OUT_SECTION_PERM = 'B2B_AccessSellOutRecords';

	// Custom Permission API Name for tracking Multi Maison access
    public static final String MULTI_MAISON_ACCESS_CUST_PERM = 'B2B_CP_StoreAccess_MultiMaison';

    public static final String B2B_SYS_ADMIN_PROFILE_NAME = 'B2B System Admin';
	public static final String B2B_POS_DEALER_PROFILE_NAME = 'B2B POS Manager';
	public static final String B2B_SALES_ASSOCIATE_PROFILE_NAME = 'B2B Sales Associate';
	public static final String B2B_RICHEMONT_STAFF_PROFILE_NAME = 'B2B Richemont Staff';
	public static final String B2B_CARTIER_STAFF_PROFILE_NAME = 'B2B Cartier Staff';
	public static final String B2B_MAISON_STAFF_PROFILE_NAME = 'B2B Maison Staff';
	public static final String B2B_STRAPS_SPECIALIST_PROFILE_NAME = 'B2B Sales Associate with limited access';

    public static final Integer MAX_AMOUNT_OF_ITEMS_TO_ADD_TO_CART = 100;

    public static final List<Schema.SObjectType> SOBJECTS_DML_DEPENDENCIES =
            new List<Schema.SObjectType>{
                    B2B_Localisation__c.SObjectType
                    , Account.SObjectType
                    , Product2.SObjectType
                    , Contact.SObjectType
                    , User.SObjectType
                    , DelegatedAccount.SObjectType
                    , WebStore.SObjectType
                    , NavigationMenuItemLocalization.SObjectType
		            , B2B_ProductAsset__c.SObjectType
		            , ProductCatalog.SObjectType
                    , ProductCategory.SObjectType
					, ProductCategoryProduct.SObjectType
                    , B2B_ProductAvailability__c.SObjectType
		            , B2B_ProductAvailabilityRange__c.SObjectType
                    , WebStoreCatalog.SObjectType
                    , B2B_CatalogDefaultCategory__c.SObjectType
					, AccountShare.SObjectType
					, ProductCategoryDataTranslation.SObjectType
					, PermissionSetAssignment.SObjectType
                    , B2B_ModelStock__c.SObjectType
                    , ProductAttributeSetProduct.SObjectType
                    , ProductAttribute.SObjectType
		            , B2B_ProductAttribute__c.SObjectType
                    , PriceBook2.SObjectType
                    , PriceBookEntry.SObjectType
                    , BuyerGroup.SObjectType
					, BuyerGroupMember.SObjectType
                    , BuyerGroupPricebook.SObjectType
                    , WebCart.SObjectType
                    , CartDeliveryGroup.SObjectType
                    , CartItem.SObjectType
                    , CartValidationOutput.SObjectType
					, B2B_TranslationAttribute__c.SObjectType
                    , ContactPointAddress.SObjectType
                    , Order.SObjectType
                    , OrderDeliveryGroup.SObjectType
                    , OrderDeliveryMethod.SObjectType
                    , CartDeliveryGroupMethod.SObjectType
					, OrderItem.SObjectType
                    , Product2DataTranslation.SObjectType
                    , B2B_OrderType__c.SObjectType
					, B2B_OrderDeliveryItem__c.SObjectType
					, BuyerAccount.SObjectType
					, ContentVersion.SObjectType
					, ContentDocumentLink.SObjectType
					, B2B_OpeningHour__c.SObjectType
					, B2B_OrderDocument__c.SObjectType
					, B2B_SellOut__c.SObjectType
					, TRG_TriggerActivationSettings__c.SObjectType
					, B2B_SellOutItem__c.SObjectType
					, B2B_DefaultPriceList__c.SObjectType
					, WebStoreBuyerGroup.SObjectType
					, B2B_CheckoutSettings__c.SObjectType
					, B2B_ProductSettings__c.SObjectType
					, B2B_CustomerInformation__c.SObjectType
					, B2B_ReturnDocument__c.SObjectType
					, B2B_WebserviceCalloutSettings__c.SObjectType
					, Group.SObjectType
					, GroupMember.SObjectType
					, B2B_CustomerDatabaseGroup__c.SObjectType
					, B2B_ClickFromStoreProductEligibility__c.SObjectType
					, B2B_ClickFromStorePOSEligibility__c.SObjectType
					, B2B_ReservedPosStock__c.SObjectType
					, LOG_LogMessage__c.SObjectType
					, B2B_POSCluster__c.SObjectType
					, B2B_GlobalContstants__c.SObjectType
					, B2B_OrdersInProcess__c.SObjectType
					, B2B_JWTConversionSettings__c.SObjectType
					, B2B_CategoryHierarchy__c.SObjectType
					, B2B_POSLocation__c.SObjectType
					, B2B_OrderDeliveryPriority__c.SObjectType
					, B2B_PrivacyPolicy__c.SObjectType
					, ContentDocument.SObjectType
					, ContentWorkspace.SObjectType
					, ContentWorkspaceDoc.SObjectType
					, B2B_ConsignmentStockTransfer__c.SObjectType
					, B2B_QuickAction__c.SObjectType
					, B2B_SerialNumber__c.SObjectType
					, UserRole.SObjectType
					, B2B_ProductBusinessUnitInfo__c.SObjectType
					, CommerceEntitlementPolicy.SObjectType
					, B2B_TechnicalAttributeSetting__c.SObjectType
					, B2B_TrafficCount__c.SObjectType
					, B2B_SpotlightProduct__c.SObjectType
            };
    // External ID fields
    public static final String ACC_EXT_ID_FIELD  = 'B2B_ExternalId__c';
    public static final String SKU_FIELD = 'B2B_GlobalReference__c';

    // see: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_ConnectAPI_CommerceCart_static_methods.htm#apex_ConnectAPI_CommerceCart_static_methods

    public static final Map<String,String> brandNameByBrandId = new Map<String,String>{
            'RIC' => 'Richemont'
            , 'CA' => 'Cartier'
            , 'MB' => 'Montblanc'
            , 'JL' => 'Jaeger-LeCoultre'
            , 'BM' => 'Baume-et-Mercier'
			, 'PI' => 'Piaget'
            , 'PA' => 'Panerai'
            , 'RD' => 'Roger-Dubuis'
            , 'LS' => 'ALange-Sohne'
			, 'IW' => 'IWC'
            , 'VA' => 'Vacheron-Constantin'
            , 'VC' => 'VanCleefArples'
    };

	// LMGTFY
	public static final Map<String,String> brandNameByBrandIdCorrectlySpelled = new Map<String,String>{
		'RIC' => 'Richemont'
		, 'CA' => 'Cartier'
		, 'MB' => 'Montblanc'
		, 'JL' => 'Jaeger-LeCoultre'
		, 'BM' => 'Baume & Mercier'
		, 'PI' => 'Piaget'
		, 'PA' => 'Panerai'
		, 'RD' => 'Roger Dubuis'
		, 'LS' => 'A.Lange & Söhne'
		, 'IW' => 'IWC'
		, 'VA' => 'Vacheron Constantin'
		, 'VC' => 'Van Cleef & Arpels'
	};

    @TestVisible
    public static String webStoreId {
        get {
            if (webStoreId == null) {
                Map<String, Object> commerceContext = AppLauncher.CommerceStoreController.getCommerceContext();
                if (commerceContext != null && !commerceContext.isEmpty()) {
                    webStoreId = (String) commerceContext.get('webstoreId');
                }
            }
            return webStoreId;
        }
        public set;
	}

	@TestVisible
    public static WebStore currentWebStore {
        get {
            if (currentWebStore == null) {
                if (String.isNotBlank(webStoreId)) {
					B2B_WebStore_XDomSel webStoreXDom = (B2B_WebStore_XDomSel) B2B_WebStore_XDomSel.getNewInstance();
					currentWebStore = (WebStore) webStoreXDom.webStoreById.get(webstoreId);
                }
            }
            return currentWebStore;
        }
        public set;
	}
	
	public static String brandId;

	// List containing all Product2 fields that have to be excluded from the response of the webstore product-search.
	public static final List<String> B2B_PRODUCT2_TECHNICAL_FIELDS_TO_EXCLUDE = new List<String> {
		'LastModifiedById', 'CreatedDate', 'QuantityUnitOfMeasure', 'IsArchived', 'SystemModstamp', 'LastViewedDate',
			'IsDeleted', 'CreatedById', 'ExternalDataSourceId', 'LastReferencedDate', 'IsActive', 'LastModifiedDate'
	};

	public static final String AZURE_B2C_AUTH_PROVIDER_DEVELOPER_NAME = 'AzureB2C';
	public static final String AZURE_B2C_AUTH_PROVIDER_NAME = 'Azure B2C';

	public static final String AZURE_B2C_AUTH_APPLICATION_DEVELOPER_NAME = 'AzureB2CAppAuth';
	public static final String AZURE_B2C_AUTH_APPLICATION_NAME = 'Azure B2C Application Auth';

    /*******************************************************************************************************************
    * @author       Kürsad Görgülü (kgorgulu@deloitte.com)
    * @description  This property contains the correct (brand specific) warehouse stock field per brand id.
    * @date         March 2021
    *******************************************************************************************************************/
    public static final Map<String, Schema.SObjectField> warehouseStockFieldByBrandId = new Map<String, Schema.SObjectField> {
            'CA' => Product2.B2B_WarehouseStock_CA__c,
            'MB' => Product2.B2B_WarehouseStock_MB__c,
            'JL' => Product2.B2B_WarehouseStock_JL__c,
            'PI' => Product2.B2B_WarehouseStock_PI__c,
            'PA' => Product2.B2B_WarehouseStock_PA__c,
            'RD' => Product2.B2B_WarehouseStock_RD__c,
            'BM' => Product2.B2B_WarehouseStock_BM__c,
            'CH' => Product2.B2B_WarehouseStock_CH__c,
            'DU' => Product2.B2B_WarehouseStock_DU__c,
            'IW' => Product2.B2B_WarehouseStock_IW__c,
            'LS' => Product2.B2B_WarehouseStock_LS__c,
            'VA' => Product2.B2B_WarehouseStock_VA__c,
            'VC' => Product2.B2B_WarehouseStock_VC__c
    };

    public static final Map<String, Schema.SObjectField> cfsEligibilityFieldByBrandId = new Map<String, Schema.SObjectField> {
            'CA' => Product2.B2B_CfsEligibility_CA__c,
            'MB' => Product2.B2B_CfsEligibility_MB__c,
            'JL' => Product2.B2B_CfsEligibility_JL__c,
            'PI' => Product2.B2B_CfsEligibility_PI__c,
            'PA' => Product2.B2B_CfsEligibility_PA__c,
            'RD' => Product2.B2B_CfsEligibility_RD__c,
            'BM' => Product2.B2B_CfsEligibility_BM__c,
            'CH' => Product2.B2B_CfsEligibility_CH__c,
            'DU' => Product2.B2B_CfsEligibility_DU__c,
            'IW' => Product2.B2B_CfsEligibility_IW__c,
            'LS' => Product2.B2B_CfsEligibility_LS__c,
            'VA' => Product2.B2B_CfsEligibility_VA__c,
            'VC' => Product2.B2B_CfsEligibility_VC__c
    };

	// Enum containing the possible color values for Product Availability (Ranges)
	public static final String RED = 'Red',
			ORANGE = 'Orange',
			GREEN = 'Green';
	public enum PRODUCT_AVAILABILITY_COLOR { RED, ORANGE, GREEN }

	// Color codes for the Warehouse Stock
	public static final String WH_STOCK_CODE_RED = '#BC1500',
			WH_STOCK_CODE_ORANGE = '#FFB300',
			WH_STOCK_CODE_GREEN = '#4CBC00';

	public static String STOCK_DETAILS_STANDARD_ORDER_TYPE_VALUE = 'standard';
	public static String STOCK_DETAILS_CONSIGNMENT_ORDER_TYPE_VALUE = 'consignment';

	public static final String ORDER_REASON_CODE_FIRM_ORDER = 'Y06';
	public static final String ORDER_REASON_CODE_STANDARD_ORDER = 'Y00';
	public static final String ORDER_REASON_CODE_CONSIGNMENT_ORDER = 'Z8A';
	public static final String ORDER_REASON_CODE_CONSIGNMENT_AUTOREP_ORDER = 'Z89';
	public static final String ORDER_REASON_CODE_AUTOREP_ORDER = 'Z22';
	public static final String ORDER_REASON_CODE_MANUAL_MODEL_STOCK = 'Z26';
	public static final String ORDER_REASON_CODE_MANUAL_MODEL_STOCK_CONSIGNED = 'Z87';
	public static final String ORDER_REASON_CODE_FIRM_ORDER_OTHER = 'Y42';
	public static final String CLICKFROMSTOREORDER_NAME = 'Click from Store';

	public static Map<String, String> REASON_CODE_KEY_TO_KEY = new Map<String, String> {
		ORDER_REASON_CODE_STANDARD_ORDER 			=> ORDER_REASON_CODE_STANDARD_ORDER,
		ORDER_REASON_CODE_FIRM_ORDER 				=> ORDER_REASON_CODE_FIRM_ORDER,
		ORDER_REASON_CODE_CONSIGNMENT_ORDER 		=> ORDER_REASON_CODE_CONSIGNMENT_ORDER,
		ORDER_REASON_CODE_MANUAL_MODEL_STOCK		=> ORDER_REASON_CODE_MANUAL_MODEL_STOCK,
		ORDER_REASON_CODE_AUTOREP_ORDER 			=> ORDER_REASON_CODE_AUTOREP_ORDER,
		ORDER_REASON_CODE_CONSIGNMENT_AUTOREP_ORDER => ORDER_REASON_CODE_CONSIGNMENT_AUTOREP_ORDER
};

	public static Map<String, String> REASON_CODE_KEY_TO_LABEL = new Map<String, String> {
			ORDER_REASON_CODE_STANDARD_ORDER 	=> 'standardOrder',
			ORDER_REASON_CODE_FIRM_ORDER 		=> 'firmOrder',
			ORDER_REASON_CODE_CONSIGNMENT_ORDER => 'consignmentOrder'
	};

	public static List<String> REASON_CODE_KEYS_FOR_CART_ITEM = new List<String>{
			ORDER_REASON_CODE_STANDARD_ORDER,
			ORDER_REASON_CODE_FIRM_ORDER,
			ORDER_REASON_CODE_CONSIGNMENT_ORDER
	};

	public static final String CFS_ORDER_TYPE = 'WCFS';
	public static final String ORDER_TYPE_B2B = 'B2B';
	public static final String ORDER_TYPE_B2BCON = 'B2BCON';
	public static Map<String, String> ORDER_TYPE_FOR_REASON_CODE = new Map<String, String>{
			'Y00'	=> ORDER_TYPE_B2B,
			'Y06'	=> ORDER_TYPE_B2B,
			'Z22'	=> ORDER_TYPE_B2B,
			'Z26'	=> ORDER_TYPE_B2B,
			'Z89'	=> ORDER_TYPE_B2BCON,
			'Z8A'	=> ORDER_TYPE_B2BCON,
			'Z87'	=> ORDER_TYPE_B2BCON
	};

	public static Map<String, String> ORDER_TYPE_LABEL = new Map<String, String>{
			'Y00'	=> System.Label.B2B_StandardOrder,
			'Y06'	=> UTL_DynamicApex.getsPickListValueDescription('Order', 'B2B_ReasonCode__c', 'Y06').getLabel(),
			'Z22'	=> System.Label.B2B_StandardOrder,
			'Z26'	=> System.Label.B2B_StandardOrder,
			'Z89'	=> System.Label.B2B_ConsignmentOrder,
			'Z8A'	=> System.Label.B2B_ConsignmentOrder
	};

	public static List<String> STANDARD_ORDER_REASON_CODES = new List<String>{
			ORDER_REASON_CODE_STANDARD_ORDER,
			ORDER_REASON_CODE_AUTOREP_ORDER
	};

	public static List<String> CONSIGNMENT_ORDER_REASON_CODES = new List<String>{
			ORDER_REASON_CODE_CONSIGNMENT_AUTOREP_ORDER,
			ORDER_REASON_CODE_CONSIGNMENT_ORDER
	};

	public static List<String> FIRM_ORDER_REASON_CODES = new List<String>{
			ORDER_REASON_CODE_FIRM_ORDER
	};

	public static List<String> MANUAL_MODEL_STOCK_REASON_CODES = new List<String> {
			ORDER_REASON_CODE_MANUAL_MODEL_STOCK
	};

	public static String B2B_ACCOUNT_POS_RECORD_TYPE_DEV_NAME = 'B2B_Account_POS';
	public static String B2B_ACCOUNT_DOOR_RECORD_TYPE_DEV_NAME = 'B2B_Door';
	public static String B2B_ACCOUNT_CHAIN_RECORD_TYPE_DEV_NAME = 'B2B_Chain';
	public static String B2B_PERSONACCOUNT_RECORD_TYPE_DEV_NAME = 'PersonAccount';

	// Reason codes that indicate an auto replenishment.
	public static List<String> AUTO_REPLENISHMENT_REASON_CODES = new List<String>{
			ORDER_REASON_CODE_CONSIGNMENT_AUTOREP_ORDER,
			ORDER_REASON_CODE_AUTOREP_ORDER
	};

	public static final String ORDER_STATUS_CODE_SENT_TO_BOO1 = 'ST';

	public static final String ORDER_DELIVERY_ITEM_STATUS_CODES_SHIPPED = 'P';
	public static final String ORDER_DELIVERY_ITEM_STATUS_CODES_CANCELLED = 'Z';

	public static final String ORDER_ITEM_STATUS_INTRANSIT = 'I',
			ORDER_ITEM_STATUS_PENDING = 'C',
			ORDER_ITEM_STATUS_REQUESTED = 'N',
			ORDER_ITEM_STATUS_VALIDATED = 'B',
			ORDER_ITEM_STATUS_DRAFT = 'D',
			ORDER_ITEM_STATUS_RESERVED = 'R',
			ORDER_ITEM_STATUS_RECEIVED = 'S',
			ORDER_ITEM_STATUS_RPSIMULATED = 'X',
			ORDER_ITEM_STATUS_CANCELLED = 'Z',
			ORDER_ITEM_STATUS_SHIPPED = 'P',
			ORDER_ITEM_STATUS_PARTIALLY_SHIPPED = 'PS',
			ORDER_ITEM_STATUS_CANCELLATIONREQUESTED = 'CR';

	/*public static final String ORDER_ITEM_STATUS_INTRANSIT = 'In Transit',
			ORDER_ITEM_STATUS_CREATED = 'Pending',
			ORDER_ITEM_STATUS_PENDING = 'Requested',
			ORDER_ITEM_STATUS_BACKORDER = 'Validated',
			ORDER_ITEM_STATUS_DRAFT = 'Draft',
			ORDER_ITEM_STATUS_RESERVED = 'Reserved',
			ORDER_ITEM_STATUS_SHIPPED = 'Received',
			ORDER_ITEM_STATUS_RPSIMULATED = 'RP simulated',
			ORDER_ITEM_STATUS_CANCELLED = 'Cancelled',
			ORDER_ITEM_STATUS_PARTIALLYSHIPPED = 'Partially Shipped',
			ORDER_ITEM_STATUS_CANCELLATIONREQUESTED = 'Cancellation Requested';*/

	public static Map<String, String> ORDER_ITEM_STATUS_KEYS_BY_LABEL = new Map<String, String> {
			ORDER_ITEM_STATUS_INTRANSIT => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_INTRANSIT, 'order'),
			ORDER_ITEM_STATUS_SHIPPED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_SHIPPED, 'order'),
			ORDER_ITEM_STATUS_REQUESTED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_REQUESTED, 'order'),
			ORDER_ITEM_STATUS_PENDING => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_PENDING, 'order'),
			ORDER_ITEM_STATUS_VALIDATED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_VALIDATED, 'order'),
			ORDER_ITEM_STATUS_RECEIVED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_RECEIVED, 'order'),
			ORDER_ITEM_STATUS_PARTIALLY_SHIPPED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_PARTIALLY_SHIPPED, 'order'),
			ORDER_ITEM_STATUS_DRAFT => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_DRAFT, 'B2B_OrderDeliveryItem__c'),
			ORDER_ITEM_STATUS_RESERVED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_RESERVED, 'B2B_OrderDeliveryItem__c'),
			ORDER_ITEM_STATUS_RPSIMULATED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_RPSIMULATED, 'B2B_OrderDeliveryItem__c'),
			ORDER_ITEM_STATUS_CANCELLED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_CANCELLED, 'order'),
			ORDER_ITEM_STATUS_CANCELLATIONREQUESTED => getOrderItemStatusKeyForLabel(ORDER_ITEM_STATUS_CANCELLATIONREQUESTED, 'order')
	};

	public static String getOrderItemStatusKeyForLabel(String label, String objectName) {
		return UTL_DynamicApex.getsPickListValueDescription(objectName, 'B2B_Status__c', label).getValue();
	}

	public static final Integer B2B_WEBSTORE_DEFAULT_PAGE_SIZE = 10;

	public static Map<String, String> B2B_BOOSTER1_API_DEFAULT_HEADERS(){
		Map<String, String> returnMap = new Map<String, String> {
				'X-Booster-App' => 'BOO2'
		};

		if(B2B_UTL_GlobalUtility.activeUserIsImpersonated){
			User user = B2B_User_Sel.getUser(B2B_UTL_GlobalUtility.realUser);
			User impersonatedForUser = B2B_User_Sel.getUser(UserInfo.getUserId());
			if(user != null && user.FederationIdentifier == null){
				throw new userException('Internal user\'s Federation Identifier field is not populated. Please populate the Federation Identifier with the email address. ');
			}
			if(impersonatedForUser != null && impersonatedForUser.FederationIdentifier == null){
				throw new userException('External user\'s Federation Identifier field is not populated. Please populate the Federation Identifier with the email address. ');
			}
			returnMap.put('X-Registered-By', user.FederationIdentifier);
			returnMap.put('X-Impersonated-For', impersonatedForUser.FederationIdentifier);
		}

		return returnMap;
	}

	public static final List<String> nonOrderableSapLifeCycleCodes = new List<String>{
			'00', '25'
	};

	public static final String EGON_PARTIAL_RESEARCH_FLAG_ENABLED = 'S';
	public static final String EGON_PARTIAL_RESEARCH_FLAG_DISABLED = 'N';

	public static final String EGON_EXTRACTION_LEVEL_STREET = 'S'; // Use with JPN and GRB
	public static final String EGON_EXTRACTION_LEVEL_LOCALITY = 'L'; // Use in other cases

	public static final Map<String, String> EGON_ADDRESS_SF_ADDRESS_PARAM_CONVERSIONS = new Map<String, String> {
			'postalCode' => 'CDXZIP',
			'state' => 'DSXDPT',
			'city' => 'DSXCNL',
			'street' => 'DSXVIA'
	};

	public static final Map<String, String> EGON_ADDRESS_B2B_CUSTOMER_INFORMATION_PARAM_CONVERSIONS = new Map<String, String> {
			'B2B_ZipCode__c' => 'CDXZIP',
			'B2B_Region__c' => 'DSXDPT',
			'B2B_City__c' => 'DSXCNL',
			'B2B_District__c' => 'DSXDS1',
			'B2B_Building__c' => 'DSXVIA',
			'B2B_Street__c' => 'DSXVIA',
			'B2B_AdditionalInformation__c' => 'DSXESP',
			'B2B_HouseNumber__c' => 'DSXESP'
	};

	public static String UNKNOWN_EXTERNAL_SYSTEM = 'Unknown';
	public static String SAVIYNT_EXTERNAL_SYSTEM = 'Saviynt';

	public static final Boolean useIntegrationUser {
		get {
			return System.isBatch() || B2B_UTL_GlobalUtility.activeUserIsImpersonated;
		}
		private set;
	}

	public static final Map<String, String> B2B_UserLanguageKey = new Map<String, String> {
			'English' => 'en_US'
	};

	//public static final String CREDIT_NOTES_INVOICE = 'CRN';

	public static final Integer B2B_DEFAULT_ORDER_PRIORITY_VALUE = 50;

	public static final String B2B_SELLOUTITEM_SOLD_RECORD_TYPE_DEV_NAME = 'B2B_Sold';
	public static final String B2B_SELLOUTITEM_RETURNED_RECORD_TYPE_DEV_NAME = 'B2B_Returned';

	public static final String RETURN_TYPE_AUTHORIZATION_FORM = 'ZB06';
	public static final String RETURN_TYPE_RETURN_NOTE = 'ZB14';

	public static List<String> POS_TYPES_FOR_PRODUCT_ELIGIBILITY = new List<String>{
		'1', '2', '7'
	};

	public class userException extends Exception {}

}
