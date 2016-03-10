public with sharing class SLDS_WizardFormController {

    /**
     * コンストラクタ
     */
    public SLDS_WizardFormController() {
        
    }

    /**
     * 保存処理
     */
    @RemoteAction
    public static SLDS_WizardFormApexResult doSave(Account account, Contact contact, Opportunity opportunity) {
        SLDS_WizardFormApexResult result = new SLDS_WizardFormApexResult();
        Savepoint sp = Database.setSavepoint();

        try {
            // Account
            upsert account;
            // Contact
            contact.AccountId = account.Id;
            upsert contact;
            // Opportunity
            opportunity.AccountId = account.Id;
            opportunity.StageName = 'Won';
            opportunity.CloseDate = System.today();
            upsert opportunity;
            // Set ResultID
            result.recordId = account.Id;
        } catch(DmlException e) {
            Database.rollback(sp);
            result.messages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            Database.rollback(sp);
            result.messages.add(e.getMessage());
            return result;
        }

        return result;
    }
}