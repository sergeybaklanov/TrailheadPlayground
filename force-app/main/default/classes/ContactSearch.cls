public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String maillingPostalCode){
List<Contact> contacts =[SELECT Id, Name 
        FROM Contact 
        WHERE LastName =:lastName AND MailingPostalCode =:maillingPostalCode];
    return contacts;
    }
}