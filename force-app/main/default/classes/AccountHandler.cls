public class AccountHandler {

    public static void insertAccount(Integer num){

        List<Account> addAccounts = new List<Account>();
        for (Integer i = 0; i < num; i++) {
            Account a = new Account(Name=('Acme Inc '+i),AccountNumber='A000'+i);
            addAccounts.add(a);
        }
            insert addAccounts;
    }

    public static Account insertNewAccount(String name)
    {
        try{
            Account account = new Account(Name=name,AccountNumber='AC000000');
            insert account;
            return account;
        }
        catch(DmlException e){
            System.debug('A DML exception has occurred'+ 
                            e.getMessage());
            return null;
        }
}
}