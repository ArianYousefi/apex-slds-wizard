@isTest
private class SLDS_WizardFormApexResultTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void SLDS_WizardFormApexResultTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            SLDS_WizardFormApexResult cls = new SLDS_WizardFormApexResult();
            
            Test.stopTest();
        }
    }
}