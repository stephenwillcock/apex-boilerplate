/**
 * Copyright (c) 2014, Stephen Willcock
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * + Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * + Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * + Neither the name of the copyright holder nor the names of its 
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 **/

public virtual class TestUtility
{
	static Integer m_num = 1;
	
	@TestVisible String getFakeId(Schema.SObjectType sot)
	{
		String result = String.valueOf(m_num++);
		return sot.getDescribe().getKeyPrefix() + '0'.repeat(12-result.length()) + result;
	}

	@TestVisible void assertSobjectListEquals(List<SObject> listA, List<SObject> listB)
	{
		if(listA==null || listB==null)
		{
			system.assert(listA==null && listB==null);
		}
		else
		{
			system.assert(listA.size()==listB.size(), listA.size() + ' <> ' + listB.size());
			Iterator<SObject> iterB = listB.iterator();
			for(SObject itemA : listA)
			{
				sObject itemB = iterB.next();
				system.assertEquals(itemA, itemB, itemA + ' <> ' + itemB);
			}
		}
	}
}