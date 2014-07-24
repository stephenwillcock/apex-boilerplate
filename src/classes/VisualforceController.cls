public with sharing class VisualforceController {
	public VisualforceController() {
		LineItems = new List<LineItem> {
			new LineItem('FooString',new Opportunity(Name='FooOpp')),
			new LineItem('BarString',new Opportunity(Name='BarOpp'))
		};
	}

	public PageReference doSomething() {
		ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, 'Did something ' + Datetime.now().format()));
		return null; // stay put
	}

	public List<LineItem> LineItems {get;set;}

	public class LineItem {
		public Boolean Selected {get;set;}
		public String StringProperty {get;set;}
		public Opportunity OpportunityProperty {get;set;}
		public LineItem(String stringValue, Opportunity opportunityValue) {
			this.StringProperty = stringValue;
			this.OpportunityProperty = opportunityValue;
		}
	}
}