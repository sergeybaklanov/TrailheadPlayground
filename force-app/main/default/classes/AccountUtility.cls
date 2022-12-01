public with sharing class AccountUtility {
   public static void viewAnnualRevenue(){
    List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];

    for (Account variable : accountsList) {
        String acctRev=variable.Name+':'+variable.AnnualRevenue;
        System.debug(acctRev);
    }
   }
}