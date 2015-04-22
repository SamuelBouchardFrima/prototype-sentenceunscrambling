package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.unscrambling
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class WordUIButton extends UIButton
	{
		private var mWord:String;
		
		public function get Word():String
		{
			return mWord;
		}
		
		public function WordUIButton(aSize:Point, aWord:String, aColor:int=0xFFFFFF)
		{
			var size:Point = aSize.clone();
			size.x *= aWord.length * 0.6;
			
			mWord = aWord;
			
			super(size, mWord, aColor);
		}
	}
}