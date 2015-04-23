package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class UIButton extends Sprite
	{
		private var mSize:Point;
		private var mColor:int;
		protected var mFormat:TextFormat;
		protected var mLabel:TextField;
		
		public function set Color(aValue:int):void
		{
			mColor = aValue;
			
			graphics.lineStyle(2);
			graphics.beginFill(mColor);
			graphics.moveTo(mSize.x * -0.5, mSize.y * -0.5);
			graphics.lineTo(mSize.x * 0.5, mSize.y * -0.5);
			graphics.lineTo(mSize.x * 0.5, mSize.y * 0.5);
			graphics.lineTo(mSize.x * -0.5, mSize.y * 0.5);
			graphics.lineTo(mSize.x * -0.5, mSize.y * -0.5);
			graphics.endFill();
		}
		
		public function UIButton(aSize:Point, aLabel:String = null, aColor:int = 0xFFFFFF)
		{
			super();
			
			mSize = aSize;
			Color = aColor;
			
			mFormat = new TextFormat();
			mFormat.size = mSize.y * 0.75;
			mFormat.bold = true;
			mFormat.align = "center";
			
			if (aLabel)
			{
				InitLabel(aLabel);
			}
		}
		
		protected function InitLabel(aLabel:String):void
		{
			mLabel = new TextField();
			mLabel.text = aLabel;
			mLabel.x = mSize.x * -0.5;
			mLabel.y = mSize.y * -0.5;
			mLabel.width = mSize.x;
			mLabel.height = mSize.y;
			mLabel.selectable = false;
			mLabel.setTextFormat(mFormat);
			mLabel.autoSize = TextFieldAutoSize.CENTER;
			addChild(mLabel);
		}
	}
}