package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling
{
	import flash.events.Event;
	
	public class RecyclingManagerEvent extends Event
	{
		public static const UNIT_CHANGE:String = "RecyclingManagerEvent::UNIT_CHANGE";
		
		public function RecyclingManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new RecyclingManagerEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("RecyclingManagerEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}