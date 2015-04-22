package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling
{
	import flash.events.IEventDispatcher;
	
	public interface IRecyclingManager extends IEventDispatcher
	{
		function get RecyclingUnit():int;
		function set RecyclingUnit(aValue:int):void;
	}
}