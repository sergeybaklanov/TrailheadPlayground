trigger AccountTrigger on Account(before update, after update, before insert, after insert ){
   if (Trigger.isBefore){
      if (Trigger.isUpdate){
         AccountTriggerHelper.beforeUpdate(Trigger.old, Trigger.new );
      }
      if (Trigger.isInsert){
         AccountTriggerHandler.CreateAccounts(Trigger.new );
      }
   }
   if (Trigger.isAfter){
      if (Trigger.isUpdate){
         AccountTriggerHelper.afterUpdate(Trigger.old, Trigger.new );
      }
   }
}