public with sharing class TriggerHandler_AccountContactsCount {
    // TODO :: implement try-catch and error handling
    public static void handleContactsCount(List<Contact> newContactList, Map<Id, Contact> oldContactsMap) {
        Set<Id> accountIdSet = new Set<Id>();

        // Collect Account IDs from new Contacts
        for (Contact contact : newContactList) {
            if (contact.AccountId != null) {
                accountIdSet.add(contact.AccountId);
            }
        }

        // Collect Account IDs from old Contacts
        for (Contact contact : oldContactsMap.values()) {
            if (contact.AccountId != null) {
                accountIdSet.add(contact.AccountId);
            }
        }

        List<Account> accountsToUpdateList = new List<Account>();

        // Query for related Account records and update the Number_of_Contacts__c field
        for (Id accountId : accountIdSet) {
            Account acc = new Account(Id = accountId);
            acc.Number_of_Contacts__c = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId AND IsDeleted = false];
            accountsToUpdateList.add(acc);
        }

        // Update the Account records 
        if (!accountsToUpdateList.isEmpty()) {
            update accountsToUpdateList;
        }
    }
}