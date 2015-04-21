package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word
{
	public class LetterWordPiece extends WordPiece
	{
		private var mType:LetterType;
		
		public function get Type():LetterType
		{
			return mType;
		}
		
		public function LetterWordPiece(aType:LetterType, aPieceString:String)
		{
			super(aPieceString);
			
			mType = aType;
		}
	}
}