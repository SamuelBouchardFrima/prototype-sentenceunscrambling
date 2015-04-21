package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.dictionary
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UI;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class DictionaryUI extends UI
	{
		private var mHomeButton:UIButton;
		private var mCraftingButton:UIButton;
		private var mScrollbox:DictionaryScrollbox;
		
		public function DictionaryUI()
		{
			super();
			
			var buttonSize:Point = new Point(50, 50);
			
			mHomeButton = new IconUIButton(buttonSize, Asset.HomeButtonBitmap);
			mHomeButton.x = 50;
			mHomeButton.y = 50;
			mHomeButton.addEventListener(MouseEvent.CLICK, OnClickHomeButton);
			addChild(mHomeButton);
			
			mCraftingButton = new IconUIButton(buttonSize, Asset.CraftingButtonBitmap);
			mCraftingButton.x = 750;
			mCraftingButton.y = 50;
			mCraftingButton.addEventListener(MouseEvent.CLICK, OnClickCraftingButton);
			addChild(mCraftingButton);
			
			mScrollbox = new DictionaryScrollbox(new Point(600, 400));
			mScrollbox.x = 400;
			mScrollbox.y = 300;
			addChild(mScrollbox);
		}
		
		override public function Dispose():void
		{
			mHomeButton.removeEventListener(MouseEvent.CLICK, OnClickHomeButton);
			mCraftingButton.removeEventListener(MouseEvent.CLICK, OnClickCraftingButton);
			
			mScrollbox.Dispose();
			
			super.Dispose();
		}
		
		private function OnClickHomeButton(aEvent:MouseEvent):void
		{
			UIManager.Instance.CurrentUI = new UIType.HOME.UIClass();
		}
		
		private function OnClickCraftingButton(aEvent:MouseEvent):void
		{
			UIManager.Instance.CurrentUI = new UIType.CRAFTING.UIClass();
		}
	}
}