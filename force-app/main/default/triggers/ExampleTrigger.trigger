trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert) {      
Integer triggerCounter= Trigger.new.size();

EmailMissionSpecialist.sendMail('sergeybaklanov468@gmail.com','Contact was successfully created',' '+ triggerCounter);
}
else if(Trigger.isDelete){
    EmailMissionSpecialist.sendMail('sergeybaklanov468@gmail.com','Contact was successfully deleted','');
}
}