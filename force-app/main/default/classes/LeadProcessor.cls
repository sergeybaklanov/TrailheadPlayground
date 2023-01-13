public class LeadProcessor implements Database.Batchable<SObject> {
    public Database.QueryLocator start (Database.BatchableContext dc){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute (Database.BatchableContext bc, List<Lead> leads){
        List<Lead> updateLead = new List<Lead>();
        for(Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
            updateLead.add(lead);
        }
        update updateLead;
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Finished processing of Lead updating');
    }
}
