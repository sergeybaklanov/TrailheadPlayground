Map<String,Support_Tier__mdt> result = Support_Tier__mdt.getAll(); 
System.debug(result);
for(String key : result.keySet()){
    System.debug(key+' : '+result.get(key));
}
System.debug('DefaultDiscount: '+Support_Tier__mdt.getInstance('Silver').get('Default_Discount__c'));
System.debug(Support_Tier__mdt.getInstance('m007R000000PFxW').Language);