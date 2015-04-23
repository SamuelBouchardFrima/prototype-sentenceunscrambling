package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word
{
	import flash.utils.Dictionary;
	
	public class WordCollection implements IWordCollection
	{
		private static var mInstance:WordCollection = new WordCollection();
		
		public static function get Instance():IWordCollection
		{
			return mInstance;
		}
		
		public var mCollection:Dictionary/*Vector.<Word>*/;
		
		public function get Collection():Dictionary/*Vector.<Word>*/
		{
			return mCollection;
		}
		
		public function WordCollection()
		{
			if (mInstance)
			{
				throw new Error("WordCollection is a singleton, and thus not intended for instantiation. Use WordCollection.Instance instead.");
			}
			
			mCollection = new Dictionary();
			
			AddWord(new Word(new <WordPiece>[new LetterWordPiece(LetterType.CONSONANT, "f"),
				new LetterWordPiece(LetterType.VOWEL, "a"), new LetterWordPiece(LetterType.CONSONANT, "n")]));
			AddWord(new Word(new <WordPiece>[new LetterWordPiece(LetterType.CONSONANT, "f"),
				new LetterWordPiece(LetterType.VOWEL, "u"), new LetterWordPiece(LetterType.CONSONANT, "n")]));
			AddWord(new Word(new <WordPiece>[new LetterWordPiece(LetterType.CONSONANT, "m"),
				new LetterWordPiece(LetterType.VOWEL, "a"), new LetterWordPiece(LetterType.CONSONANT, "d")]));
			AddWord(new Word(new <WordPiece>[new LetterWordPiece(LetterType.CONSONANT, "m"),
				new LetterWordPiece(LetterType.VOWEL, "a"), new LetterWordPiece(LetterType.CONSONANT, "t")]));
			AddWord(new Word(new <WordPiece>[new LetterWordPiece(LetterType.CONSONANT, "s"),
				new LetterWordPiece(LetterType.VOWEL, "a"), new LetterWordPiece(LetterType.CONSONANT, "d")]));
		}
		
		public function ContainWord(aWord:Word):Boolean
		{
			return mCollection[aWord.WordString];
		}
		
		public function AddWord(aWord:Word):void
		{
			if (!ContainWord(aWord))
			{
				mCollection[aWord.WordString] = new Vector.<Word>();
			}
			mCollection[aWord.WordString].push(aWord);
		}
		
		public function RemoveWord(aWord:Word):void
		{
			if (ContainWord(aWord))
			{
				var wordList:Vector.<Word> = mCollection[aWord.WordString] as Vector.<Word>;
				for (var i:int = 0, end:int = wordList.length; i < end; ++i)
				{
					if (aWord == wordList[i])
					{
						wordList.splice(i, 1);
						break;
					}
				}
				if (wordList.length <= 0)
				{
					delete mCollection[aWord.WordString];
				}
			}
		}
	}
}