package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.dictionary
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling.RecyclingManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling.RecyclingManagerEvent;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class RecyclingUIProgressBar extends Sprite
	{
		private static const HALF_BAR_SIZE:Point = new Point(270, 25);
		
		private var mBox:Sprite;
		private var mBar:Sprite;
		private var mProgress:TextField;
		private var mFormat:TextFormat;
		private var mUnscrambling:UIButton;
		
		private function get UnscramblingAvailable():Boolean
		{
			return RecyclingManager.Instance.RecyclingUnit >= 5;
		}
		
		public function RecyclingUIProgressBar()
		{
			super();
			
			mBox = new Sprite();
			mBox.x = -30;
			mBox.y = 0;
			mBox.graphics.lineStyle(1, 0xCCCCCC);
			mBox.graphics.moveTo(-HALF_BAR_SIZE.x, -HALF_BAR_SIZE.y);
			mBox.graphics.lineTo(HALF_BAR_SIZE.x, -HALF_BAR_SIZE.y);
			mBox.graphics.lineTo(HALF_BAR_SIZE.x, HALF_BAR_SIZE.y);
			mBox.graphics.lineTo(-HALF_BAR_SIZE.x, HALF_BAR_SIZE.y);
			mBox.graphics.lineTo(-HALF_BAR_SIZE.x, -HALF_BAR_SIZE.y);
			addChild(mBox);
			
			mBar = new Sprite();
			mBar.x = -30;
			mBar.y = 0;
			addChild(mBar);
			
			mProgress = new TextField();
			mProgress.width = mProgress.height = 2 * HALF_BAR_SIZE.y;
			mProgress.x = -HALF_BAR_SIZE.y - 30;
			mProgress.y = -HALF_BAR_SIZE.y;
			mProgress.selectable = false;
			addChild(mProgress);
			
			mFormat = new TextFormat();
			mFormat.size = 2 * HALF_BAR_SIZE.y * 0.75;
			mFormat.bold = true;
			mFormat.align = "center";
			
			mUnscrambling = new UIButton(new Point(50, 50), ">", (UnscramblingAvailable ? 0x00FF00 : 0xFF0000));
			mUnscrambling.x = HALF_BAR_SIZE.x + 5;
			mUnscrambling.y = 0;
			mUnscrambling.addEventListener(MouseEvent.CLICK, OnClickUnscrambling);
			addChild(mUnscrambling);
			
			RecyclingManager.Instance.addEventListener(RecyclingManagerEvent.UNIT_CHANGE, OnRecyclingUnitChange);
			
			UpdateStatus();
		}
		
		public function Dispose():void
		{
			mUnscrambling.removeEventListener(MouseEvent.CLICK, OnClickUnscrambling);
			
			RecyclingManager.Instance.removeEventListener(RecyclingManagerEvent.UNIT_CHANGE, OnRecyclingUnitChange);
		}
		
		public function UpdateStatus():void
		{
			mBar.graphics.clear();
			
			var ratio:Number = Math.min(RecyclingManager.Instance.RecyclingUnit / 5, 1);
			var length:Number = 2 * (HALF_BAR_SIZE.x - 5) * ratio;
			
			mBar.graphics.beginFill(0x00FF00);
			mBar.graphics.moveTo(-(HALF_BAR_SIZE.x - 5), -(HALF_BAR_SIZE.y - 5));
			mBar.graphics.lineTo(length - (HALF_BAR_SIZE.x - 5), -(HALF_BAR_SIZE.y - 5));
			mBar.graphics.lineTo(length - (HALF_BAR_SIZE.x - 5), (HALF_BAR_SIZE.y - 5));
			mBar.graphics.lineTo(-(HALF_BAR_SIZE.x - 5), (HALF_BAR_SIZE.y - 5));
			mBar.graphics.lineTo(-(HALF_BAR_SIZE.x - 5), -(HALF_BAR_SIZE.y - 5));
			mBar.graphics.endFill();
			
			mProgress.text = "" + RecyclingManager.Instance.RecyclingUnit;
			mProgress.setTextFormat(mFormat);
			
			mUnscrambling.Color = (UnscramblingAvailable ? 0x00FF00 : 0xFF0000);
		}
		
		private function OnClickUnscrambling(aEvent:MouseEvent):void
		{
			if (UnscramblingAvailable)
			{
				UIManager.Instance.CurrentUI = new UIType.UNSCRAMBLING.UIClass();
			}
		}
		
		private function OnRecyclingUnitChange(aEvent:RecyclingManagerEvent):void
		{
			UpdateStatus();
		}
	}
}