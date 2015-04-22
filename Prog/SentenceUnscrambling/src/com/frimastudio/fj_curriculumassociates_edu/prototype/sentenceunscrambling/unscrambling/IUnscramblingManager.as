package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling
{
	import flash.events.IEventDispatcher;
	
	public interface IUnscramblingManager extends IEventDispatcher
	{
		function get RandomSentence():Sentence;
	}
}