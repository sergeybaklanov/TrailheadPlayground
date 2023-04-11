@RestResource(urlMapping='/Project__c')
global with sharing class DeveloperWebServices {

    @HttpGet
    global static List<Project__c> getTopProjects() {
        List<Project__c> top5Projects =  [SELECT Id, Name, CreatedDate, Project_Budget__c, Is_Billable__c,Start_Date__c
        FROM Project__c ORDER BY Project_Budget__c DESC LIMIT 5];

        return top5Projects;
    }
}