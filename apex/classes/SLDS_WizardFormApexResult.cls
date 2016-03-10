public with sharing class SLDS_WizardFormApexResult {

    public Id recordId {get; set;}
    public List<String> messages {get; set;}

    /**
     * コンストラクタ
     */
    public SLDS_WizardFormApexResult() {
        this.recordId = null;
        this.messages = new List<String>();
    }
}