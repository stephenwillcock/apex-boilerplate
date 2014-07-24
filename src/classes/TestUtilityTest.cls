@isTest
private class TestUtilityTest {
	
	static TestUtility util  = new TestUtility();

	@isTest
	static void test_getFakeId()
	{
		String idString1 = util.getFakeId(Account.SobjectType);
		system.assertEquals('001000000000001',idString1);
		Id id1 = (ID) idString1;
		String idString2 = util.getFakeId(Account.SobjectType);
		system.assertEquals('001000000000002',idString2);
	}

	@isTest
	static void test_assertSobjectListEquals()
	{
		List<Account> listA;
		List<Account> listB;
		util.assertSobjectListEquals(listA,ListB);
		listA = new List<Account>{new Account(Name='Name1'),new Account(Name='Name2')};
		listB = new List<Account>{new Account(Name='Name1'),new Account(Name='Name2')};
		util.assertSobjectListEquals(listA,ListB);
	}	
	
}