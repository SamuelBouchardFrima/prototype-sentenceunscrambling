package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling
{
	public class Sentence
	{
		private var mIndex:int;
		private var mScrambled:String;
		private var mUnscrambled:String;
		
		public function get Index():int
		{
			return mIndex;
		}
		
		public function get Scrambled():String
		{
			return mScrambled;
		}
		
		public function get Unscrambled():String
		{
			return mUnscrambled;
		}
		
		public function Sentence(aIndex:int, aScrambled:String, aUnscrambled:String)
		{
			mIndex = aIndex;
			mScrambled = aScrambled;
			mUnscrambled = aUnscrambled;
		}
		
		public function toString():String
		{
			return "[Sentence::" + mIndex + "::" + mScrambled + "::" + mUnscrambled + "]";
		}
	}
}