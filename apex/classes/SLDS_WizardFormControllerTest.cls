@isTest
private class SLDS_WizardFormControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void SLDS_WizardFormControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            SLDS_WizardFormController cls = new SLDS_WizardFormController();
            
            Test.stopTest();
        }
    }

    /**
     * 保存処理
     */
    static testMethod void doSaveTest() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'Sample');
            Contact contact = new Contact(LastName = 'Sample');
            Opportunity opportunity = new Opportunity(Name = 'Sample');

            Test.startTest();
            
            SLDS_WizardFormApexResult result = SLDS_WizardFormController.doSave(account, contact, opportunity);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
        }
    }
}