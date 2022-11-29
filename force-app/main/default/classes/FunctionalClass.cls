//This class can delete not unique contacts in datbase
public class FunctionalClass {
 public static void printListInfo(List<Contact> listForPrint) {

        for (Contact contact : listForPrint) {
            System.debug('Id = ' + contact.get('Id') + ' First Name = ' + contact.get('FirstName') +
                    ' Last Name = ' + contact.get('LastName') + 'EMail = ' + contact.get('Email') + ' ' +
                    ' Phone = ' + contact.get('Phone'));
        }
    }

    public static List<Contact> deleteCopy(List<Contact> listEdit) {

        List<Contact> contToDelete = new List<Contact>();

        for (Integer i = 0; i - 1 < listEdit.size(); i++) {
            for (Integer j = i + 1; j < listEdit.size(); j++) {
                if (listEdit.get(i).FirstName==listEdit.get(j).FirstName &&
                        listEdit.get(i).LastName==listEdit.get(j).LastName){
                    contToDelete.add(listEdit.get(i));
                }
            }
        }
        return contToDelete;
    }
}

/*List<Contact> listContacts = [SELECT FirstName, LastName, Email, Phone FROM Contact WHERE CreatedDate > 2022-10-13T01:02:03Z];
Set<Contact> uniqueContacts = new Set<Contact>(listContacts);

Database.DeleteResult [] res = Database.delete (FunctionalClass.deleteCopy(listContacts));
for(Database.DeleteResult result :res){
    if(result.success){
        System.debug('Contact with ID ='+ result.getId() +' deleted successfully\n');
    }
    else{
        for(Database.Error err : result.getErrors()){
            System.debug('The following error has occurred.');
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Contact fields that affected this error: ' + err.getFields());
        }
    }
}
*/