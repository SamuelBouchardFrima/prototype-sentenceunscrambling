package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling
{
	public class SentenceDictionary
	{
		public static const GRADE_1:XML = new XML("<data>" + (<![CDATA[
mad is . Sam~Sam is mad .
Sam ? mad is~is Sam mad ?
			]]>).toString() + "</data>");
		
		public function SentenceDictionary()
		{
			throw new Error("SentenceDictionary is static and not intended for instantiation.");
		}
	}
}