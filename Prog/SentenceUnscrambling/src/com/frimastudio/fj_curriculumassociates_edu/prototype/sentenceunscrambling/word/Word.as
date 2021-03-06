package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word
{
	public class Word
	{
		private var mPieceList:Vector.<WordPiece>;
		private var mWordString:String;
		
		public function get PieceList():Vector.<WordPiece>
		{
			return mPieceList;
		}
		public function set PieceList(aValue:Vector.<WordPiece>):void
		{
			mPieceList = aValue;
		}
		
		public function get WordString():String
		{
			return mWordString;
		}
		public function set WordString(aValue:String):void
		{
			mWordString = aValue;
		}
		
		public function get Valid():Boolean
		{
			return WordValidator.Instance.Validate(mWordString);
		}
		
		public function get RecyclingValue():int
		{
			return Math.max(Math.round(mWordString.length / mPieceList.length), 1);
		}
		
		public function Word(aPieceList:Vector.<WordPiece>)
		{
			mPieceList = aPieceList;
			mWordString = "";
			
			for (var i:int = 0, end:int = mPieceList.length; i < end; ++i)
			{
				mWordString += mPieceList[i].PieceString;
			}
		}
	}
}