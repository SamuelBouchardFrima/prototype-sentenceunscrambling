package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.unscrambling
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling.RecyclingManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UI;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.Word;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordCollection;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class SelectWordUI extends UI
	{
		private var mDictionaryButton:UIButton;
		private var mWordButtonList:Vector.<WordUIButton>;
		private var mWordList:Vector.<Word>;
		
		public function SelectWordUI(aWordList:Vector.<Word>)
		{
			super();
			
			mWordList = aWordList;
			
			var buttonSize:Point = new Point(50, 50);
			
			mDictionaryButton = new IconUIButton(buttonSize, Asset.DictionaryButtonBitmap);
			mDictionaryButton.x = 50;
			mDictionaryButton.y = 50;
			mDictionaryButton.addEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
			addChild(mDictionaryButton);
			
			mWordButtonList = new Vector.<WordUIButton>();
			var wordButton:WordUIButton;
			var sentenceWidth:Number = (mWordList.length - 1) * 5;
			for (var i:int = 0, end:int = mWordList.length; i < end; ++i)
			{
				wordButton = new WordUIButton(buttonSize, mWordList[i].WordString);
				wordButton.addEventListener(MouseEvent.CLICK, OnClickWord);
				mWordButtonList.push(wordButton);
				sentenceWidth += wordButton.width;
			}
			
			var offset:Number = 400 - (sentenceWidth * 0.5);
			for (i = 0, end = mWordButtonList.length; i < end; ++i)
			{
				mWordButtonList[i].x = offset + (mWordButtonList[i].width * 0.5);
				mWordButtonList[i].y = 250;
				addChild(mWordButtonList[i]);
				offset += mWordButtonList[i].width + 5;
			}
		}
		
		override public function Dispose():void
		{
			mDictionaryButton.removeEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
			
			for (var i:int = 0, end:int = mWordButtonList.length; i < end; ++i)
			{
				mWordButtonList[i].removeEventListener(MouseEvent.CLICK, OnClickWord);
			}
			
			super.Dispose();
		}
		
		private function OnClickDictionaryButton(aEvent:MouseEvent):void
		{
			UIManager.Instance.CurrentUI = new UIType.DICTIONARY.UIClass();
		}
		
		private function OnClickWord(aEvent:MouseEvent):void
		{
			WordCollection.Instance.AddWord(mWordList[mWordButtonList.indexOf(aEvent.currentTarget as WordUIButton)]);
			RecyclingManager.Instance.RecyclingUnit -= 5;
			UIManager.Instance.CurrentUI = new UIType.DICTIONARY.UIClass();
		}
	}
}