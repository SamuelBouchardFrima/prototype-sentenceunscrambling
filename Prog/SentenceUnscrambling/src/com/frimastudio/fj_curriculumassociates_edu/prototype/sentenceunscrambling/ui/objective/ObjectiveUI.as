package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.objective
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UI;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class ObjectiveUI extends UI
	{
		private var mHomeButton:UIButton;
		private var mScrollbox:ObjectiveScrollbox;
		
		public function ObjectiveUI()
		{
			super();
			
			var buttonSize:Point = new Point(50, 50);
			
			mHomeButton = new IconUIButton(buttonSize, Asset.HomeButtonBitmap);
			mHomeButton.x = 50;
			mHomeButton.y = 50;
			mHomeButton.addEventListener(MouseEvent.CLICK, OnClickHomeButton);
			addChild(mHomeButton);
			
			mScrollbox = new ObjectiveScrollbox(new Point(600, 400));
			mScrollbox.x = 400;
			mScrollbox.y = 300;
			addChild(mScrollbox);
		}
		
		override public function Dispose():void
		{
			mHomeButton.removeEventListener(MouseEvent.CLICK, OnClickHomeButton);
			
			mScrollbox.Dispose();
			
			super.Dispose();
		}
		
		private function OnClickHomeButton(aEvent:MouseEvent):void
		{
			UIManager.Instance.CurrentUI = new UIType.HOME.UIClass();
		}
	}
}