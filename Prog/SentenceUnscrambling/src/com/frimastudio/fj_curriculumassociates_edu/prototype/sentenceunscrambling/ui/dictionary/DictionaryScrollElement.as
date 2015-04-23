package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.dictionary
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.objective.ObjectiveManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling.RecyclingManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIScrollElement;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIScrollElementEvent;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.Word;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordCollection;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class DictionaryScrollElement extends UIScrollElement
	{
		private static const COLOR:Vector.<int> = new <int>
			[
				0x0000FF, 0xCCCC00, 0x00FF00, 0xCC00CC, 0xFF0000, 0x00CCCC
			];
		private static var COLOR_LENGTH:int = COLOR.length;
		
		private var mWord:Word;
		private var mWordField:TextField;
		private var mRadioButton:UIButton;
		private var mObjectiveButton:UIButton;
		private var mRecycleButton:UIButton;
		
		public function DictionaryScrollElement(aSize:Point, aWord:Word)
		{
			super(aSize);
			
			mWord = aWord;
			
			var buttonSize:Point = new Point(aSize.y - 5, aSize.y - 5);
			
			var format:TextFormat = new TextFormat();
			format.size = buttonSize.y * 0.75;
			format.align = "center";
			
			mWordField = new TextField();
			mWordField.width = aSize.x - (buttonSize.x * 3) - 20;
			mWordField.height = buttonSize.y;
			mWordField.x = 4;
			mWordField.y = buttonSize.y * -0.5;
			mWordField.text = mWord.WordString;
			mWordField.selectable = false;
			var index:int = 0, next:int;
			for (var i:int = 0, end:int = mWord.PieceList.length; i < end; ++i)
			{
				format.color = COLOR[i % COLOR_LENGTH];
				next = index + mWord.PieceList[i].PieceString.length;
				mWordField.setTextFormat(format, index, next);
				index = next;
			}
			addChild(mWordField);
			
			mRadioButton = new IconUIButton(buttonSize, Asset.RadioSignalBitmap);
			mRadioButton.x = aSize.x - (buttonSize.x * 2.5) - 12;
			mRadioButton.y = 0;
			mRadioButton.addEventListener(MouseEvent.CLICK, OnClickRadioButton);
			addChild(mRadioButton);
			
			var objective:Boolean = ObjectiveManager.Instance.HasWordObjective(mWord);
			mObjectiveButton = new IconUIButton(buttonSize, Asset.ObjectiveButtonBitmap, (objective ? 0x00FF00 : 0xFF0000));
			mObjectiveButton.x = aSize.x - (buttonSize.x * 1.5) - 8;
			mObjectiveButton.y = 0;
			if (objective)
			{
				mObjectiveButton.addEventListener(MouseEvent.CLICK, OnClickObjectiveButton);
			}
			addChild(mObjectiveButton);
			
			mRecycleButton = new IconUIButton(buttonSize, Asset.RecyclingBitmap);
			mRecycleButton.x = aSize.x - (buttonSize.x * 0.5) - 4;
			mRecycleButton.y = 0;
			mRecycleButton.addEventListener(MouseEvent.CLICK, OnClickRecycleButton);
			addChild(mRecycleButton);
		}
		
		override public function Dispose():void
		{
			mRadioButton.removeEventListener(MouseEvent.CLICK, OnClickRadioButton);
			mObjectiveButton.removeEventListener(MouseEvent.CLICK, OnClickObjectiveButton);
			
			super.Dispose();
		}
		
		private function OnClickRadioButton(aEvent:MouseEvent):void
		{
			WordCollection.Instance.RemoveWord(mWord);
			UIManager.Instance.CurrentUI = new UIType.CRAFTING.UIClass(mWord);
		}
		
		private function OnClickObjectiveButton(aEvent:MouseEvent):void
		{
			if (ObjectiveManager.Instance.CompleteWordObjective(mWord))
			{
				WordCollection.Instance.RemoveWord(mWord);
				UIManager.Instance.CurrentUI = new UIType.OBJECTIVE.UIClass();
			}
		}
		
		private function OnClickRecycleButton(aEvent:MouseEvent):void
		{
			RecyclingManager.Instance.RecyclingUnit += mWord.RecyclingValue;
			WordCollection.Instance.RemoveWord(mWord);
			dispatchEvent(new UIScrollElementEvent(UIScrollElementEvent.DELETE));
		}
	}
}