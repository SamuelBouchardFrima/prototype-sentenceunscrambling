package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.dictionary
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIScrollbox;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIScrollElement;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.Word;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordCollection;
	import flash.geom.Point;
	
	public class DictionaryScrollbox extends UIScrollbox
	{
		public function DictionaryScrollbox(aSize:Point)
		{
			super(aSize);
			
			for each (var wordList:Vector.<Word> in WordCollection.Instance.Collection)
			{
				for (var i:int = 0, end:int = wordList.length; i < end; ++i)
				{
					AddElement(new DictionaryScrollElement(new Point(aSize.x, 30), wordList[i]));
				}
			}
		}
	}
}