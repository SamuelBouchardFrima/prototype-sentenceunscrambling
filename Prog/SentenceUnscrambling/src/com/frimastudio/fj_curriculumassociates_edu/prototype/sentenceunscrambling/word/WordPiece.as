package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word
{
	public class WordPiece
	{
		private var mPieceString:String;
		
		public function get PieceString():String
		{
			return mPieceString;
		}
		protected function set PieceString(aValue:String):void
		{
			mPieceString = aValue;
		}
		
		public function WordPiece(aPieceString:String)
		{
			mPieceString = aPieceString;
		}
		
		public function toString():String
		{
			return mPieceString;
		}
	}
}