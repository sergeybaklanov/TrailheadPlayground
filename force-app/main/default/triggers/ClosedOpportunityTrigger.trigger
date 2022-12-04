trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> listTasks = new List<Task>();

    for(Opportunity opp : Trigger.new){
        if(opp.StageName=='Closed Won'){
            Task task = new Task();
            task.Subject='Follow Up Test Task';
            task.WhatId=opp.Id;
            listTasks.add(task);
        }
    }
    if(listTasks.size()>0){
        insert listTasks;
    }
}