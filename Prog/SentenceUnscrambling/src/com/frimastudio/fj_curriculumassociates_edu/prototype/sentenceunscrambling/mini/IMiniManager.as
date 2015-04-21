package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.mini
{
	import flash.events.IEventDispatcher;
	
	public interface IMiniManager extends IEventDispatcher
	{
		function get MiniList():Vector.<Mini>;
	}
}