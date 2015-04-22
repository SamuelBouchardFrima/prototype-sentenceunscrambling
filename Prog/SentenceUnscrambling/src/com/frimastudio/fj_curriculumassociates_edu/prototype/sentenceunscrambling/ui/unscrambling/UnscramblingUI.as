package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.unscrambling
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling.RecyclingManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UI;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling.Sentence;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling.UnscramblingManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.LetterType;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.LetterWordPiece;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.Word;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordCollection;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordPiece;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class UnscramblingUI extends UI
	{
		private var mDictionaryButton:UIButton;
		private var mSubmitButton:UIButton;
		private var mWordList:Vector.<WordUIButton>;
		private var mDraggedWord:WordUIButton;
		private var mSentence:Sentence;
		private var mFirstPosition:Number;
		
		public function get DraggedWordPosition():int
		{
			for (var i:int = 0, end:int = mWordList.length; i < end; ++i)
			{
				if (mWordList[i] != mDraggedWord)
				{
					if (mDraggedWord.x <= mWordList[i].x)
					{
						return i;
					}
					if (mDraggedWord.x > mWordList[i].x && mDraggedWord.x <= mWordList[i].x + (mWordList[i].width * 0.5))
					{
						return i + 1;
					}
				}
			}
			return -1;
		}
		
		public function UnscramblingUI()
		{
			super();
			
			var buttonSize:Point = new Point(50, 50);
			
			mDictionaryButton = new IconUIButton(buttonSize, Asset.DictionaryButtonBitmap);
			mDictionaryButton.x = 50;
			mDictionaryButton.y = 50;
			mDictionaryButton.addEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
			addChild(mDictionaryButton);
			
			mSubmitButton = new UIButton(buttonSize, ">");
			mSubmitButton.x = 400;
			mSubmitButton.y = 400;
			mSubmitButton.addEventListener(MouseEvent.CLICK, OnClickSubmitButton);
			addChild(mSubmitButton);
			
			mSentence = UnscramblingManager.Instance.RandomSentence;
			
			mWordList = new Vector.<WordUIButton>();
			var wordList:Array/*String*/ = mSentence.Scrambled.split(" ");
			var i:int, end:int;
			var word:WordUIButton;
			var sentenceWidth:Number = 0;
			for (i = 0, end = wordList.length; i < end; ++i)
			{
				word = new WordUIButton(buttonSize, wordList[i]);
				word.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownWord);
				mWordList.push(word);
				sentenceWidth += word.width;
			}
			
			mFirstPosition = 400 - (sentenceWidth * 0.5);
			trace("First position: " + mFirstPosition);
			var offset:Number = mFirstPosition;
			for (i = 0, end = mWordList.length; i < end; ++i)
			{
				mWordList[i].x = offset + (mWordList[i].width * 0.5);
				mWordList[i].y = 250;
				trace("Word " + mWordList[i].Word + ": " + mWordList[i].x);
				addChild(mWordList[i]);
				offset += mWordList[i].width;
			}
		}
		
		override public function Dispose():void
		{
			mDictionaryButton.removeEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
			
			for (var i:int = 0, end:int = mWordList.length; i < end; ++i)
			{
				mWordList[i].removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownWord);
			}
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			
			super.Dispose();
		}
		
		private function OnClickDictionaryButton(aEvent:MouseEvent):void
		{
			UIManager.Instance.CurrentUI = new UIType.DICTIONARY.UIClass();
		}
		
		private function OnClickSubmitButton(aEvent:MouseEvent):void
		{
			var wordList:Vector.<String> = new Vector.<String>();
			var i:int, endi:int;
			for (i = 0, endi = mWordList.length; i < endi; ++i)
			{
				wordList.push(mWordList[i].Word);
			}
			
			if (wordList.join(" ") == mSentence.Unscrambled)
			{
				var j:int, endj:int;
				var pieceList:Vector.<WordPiece>;
				for (i = 0, endi = wordList.length; i < endi; ++i)
				{
					pieceList = new Vector.<WordPiece>();
					for (j = 0, endj = wordList[i].length; j < endj; ++j)
					{
						pieceList.push(new LetterWordPiece(LetterType.RANDOM, wordList[i].charAt(j).toLowerCase()));
					}
					WordCollection.Instance.AddWord(new Word(pieceList));
				}
				RecyclingManager.Instance.RecyclingUnit -= 5;
				UIManager.Instance.CurrentUI = new UIType.DICTIONARY.UIClass();
			}
		}
		
		private function OnMouseDownWord(aEvent:MouseEvent):void
		{
			mDraggedWord = aEvent.currentTarget as WordUIButton;
			mDraggedWord.x = mouseX;
			addChild(mDraggedWord);
			
			for (var i:int = mWordList.indexOf(mDraggedWord) + 1, end:int = mWordList.length; i < end; ++i)
			{
				mWordList[i].x -= mDraggedWord.width;
			}
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
		}
		
		private function OnMouseMove(aEvent:MouseEvent):void
		{
			mDraggedWord.x = mouseX;
			
			var current:int = mWordList.indexOf(mDraggedWord);
			var position:int = DraggedWordPosition;
			
			var offset:Number = mFirstPosition;
			for (var i:int = 0, end:int = mWordList.length; i < end; ++i)
			{
				if (i == position)
				{
					offset += mDraggedWord.width;
				}
				if (mWordList[i] != mDraggedWord)
				{
					mWordList[i].x = offset + (mWordList[i].width * 0.5);
					offset += mWordList[i].width;
				}
			}
		}
		
		private function OnMouseUp(aEvent:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			
			var current:int = mWordList.indexOf(mDraggedWord);
			var position:int = DraggedWordPosition;
			if (position != current)
			{
				mWordList.splice(current, 1);
				if (position == -1)
				{
					mWordList.push(mDraggedWord);
				}
				else if (position < current)
				{
					mWordList.splice(position, 0, mDraggedWord);
				}
				else if (position > current)
				{
					mWordList.splice(position - 1, 0, mDraggedWord);
				}
			}
			
			var offset:Number = mFirstPosition;
			for (var i:int = 0, end:int = mWordList.length; i < end; ++i)
			{
				mWordList[i].x = offset + (mWordList[i].width * 0.5);
				offset += mWordList[i].width;
			}
			
			mDraggedWord = null;
		}
	}
}