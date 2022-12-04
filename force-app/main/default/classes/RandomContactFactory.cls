public with sharing class RandomContactFactory {
   public static List <Contact> generateRandomContacts(Integer numUniqueContacts, String nameContacts){
    List<Contact> listContacts = new List<Contact>();
    for (Integer i = 0; i < numUniqueContacts; i++) {
        Contact contact = new Contact(FirstName='Test '+i, LastName=nameContacts);
        listContacts.add(contact);
    }
    return listContacts;
   }
}
