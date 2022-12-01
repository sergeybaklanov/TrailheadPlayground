public with sharing class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String search){
        List<List< sObject>> result = [FIND :search IN NAME FIELDS 
        RETURNING Contact(Id,Name), Lead(Id,Name)];
        return result;
    }
}