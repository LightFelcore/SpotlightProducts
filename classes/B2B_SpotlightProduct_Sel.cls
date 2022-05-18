/**
 * Created by andeville on 30/03/2022.
 */

    public without sharing class B2B_SpotlightProduct_Sel {
        /***********************************************************PUBLIC PROPERTIES***********************************************/
        /*******************************************************************************************************************
        * @author       Anthony Deville (andeville@deloitte.com)
        * @description  Private property of type List<String> that is used to select all necessary fields of the spotlight product object
        *******************************************************************************************************************/
        public static final List<String> SPOTLIGHT_PRODUCTS_FIELDS = new List<String>{
                'B2B_IsSpotlightProductEnabled__c', 'B2B_Maison__c', 'B2B_RelatedProduct__r.Id',
                'B2B_RelatedProduct__r.Name', 'B2B_ExternalId__c', 'B2B_RelatedProduct__r.B2B_GlobalReference__c'
        };

        /***********************************************************PUBLIC METHODS***********************************************/
        /*******************************************************************************************************************
        * @author       Anthony Deville (andeville@deloitte.com)
        * @description  This method is used for querying the needed data using Query Builder and return a list of spotlight product objects based on the maison given by parameter
        * @date         March 2022
        * @param        maison (String) : a string that specifies the maison
        * @return       (List<B2B_SpotlightProduct__c>): a list of spotlight product objects
        *******************************************************************************************************************/
        public static List<B2B_SpotlightProduct__c> getAllSpotlightProductsForMaison(String maison) {
            UTL_QueryBuilder qb = new UTL_QueryBuilder('B2B_SpotlightProduct__c');
            qb.addFields(SPOTLIGHT_PRODUCTS_FIELDS, false);
            qb.addCondition(new UTL_QB_ConditionMgr.PrimitiveCondition('B2B_Maison__c', maison, UTL_QB_ConditionMgr.ComparisonOperatorType.EQUAL));
            qb.addCondition(new UTL_QB_ConditionMgr.PrimitiveCondition('B2B_IsSpotlightProductEnabled__c', true, UTL_QB_ConditionMgr.ComparisonOperatorType.EQUAL));
            return Database.query(qb.toString());
        }
    }



