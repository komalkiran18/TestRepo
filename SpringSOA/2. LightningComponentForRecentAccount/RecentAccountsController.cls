public with sharing class RecentAccountsController {
    @AuraEnabled
    public static List<Account> getRecentAccounts() {
        // Query and return the 10 most recently created Accounts
        return [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}