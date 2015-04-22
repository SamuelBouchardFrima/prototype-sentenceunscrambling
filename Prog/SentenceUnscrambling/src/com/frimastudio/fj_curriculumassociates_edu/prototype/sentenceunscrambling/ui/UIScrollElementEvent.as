package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui
{
	import flash.events.Event;
	
	public class UIScrollElementEvent extends Event
	{
		public static const DELETE:String = "UIScrollElementEvent::DELETE";
		
		public function UIScrollElementEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new UIScrollElementEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("UIScrollElementEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}