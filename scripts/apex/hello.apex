/*  Use .apex files to store anonymous Apex.
 You can execute anonymous Apex in VS Code by selecting the
    apex text and running the command:
     SFDX: Execute Anonymous Apex with Currently Selected Text
You can also execute the entire file by running the command:
     SFDX: Execute Anonymous Apex with Editor Contents

 Add account and related contact */

// AnimalsCallouts.makeGetCallout();
// AnimalsCallouts.makePostCallout();

List<Id> accounts = new List<Id>{'0017R00002u7KyVQAU'};
AccountProcessor.countContacts(accounts);