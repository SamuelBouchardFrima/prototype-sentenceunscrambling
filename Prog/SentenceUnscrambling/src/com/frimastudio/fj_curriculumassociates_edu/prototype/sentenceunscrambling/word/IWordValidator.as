package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word
{
	import flash.events.IEventDispatcher;
	
	public interface IWordValidator extends IEventDispatcher
	{
		function get RandomWord():String;
		
		function Load():void;
		
		function Validate(aWord:String):Boolean;
	}	
}