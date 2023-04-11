public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String abbreviationState;

    public AddPrimaryContact(Contact contact, String abbreviationState) {
        this.contact=contact;
        this.abbreviationState = abbreviationState;
    } 

    public void execute (QueueableContext context){
        List<Account> accounts = [
            SELECT Id,Name,(SELECT Id,FirstName,LastName FROM Contacts) 
            FROM Account 
            WHERE BillingState=:abbreviationState LIMIT 200];

            List<Contact> contactsToUpdate = new List<Contact>();

        for (Account account : accounts) {
            Contact cont = contact.clone();
            cont.AccountId=account.Id;
            contactsToUpdate.add(cont);
        }
        update accounts;
    }
}