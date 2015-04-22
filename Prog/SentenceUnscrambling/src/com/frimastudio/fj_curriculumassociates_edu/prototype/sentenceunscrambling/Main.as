package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.objective.ObjectiveManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.HomeUI;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIManager;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIType;
	import flash.display.Sprite;
	import flash.events.Event;
	
	XML.ignoreWhitespace = false;
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			if (stage)
			{
				Init();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, Init);
			}
		}
		
		private function Init(aEvent:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			// entry point
			
			addChild(UIManager.Instance.UIContainer);
			
			ObjectiveManager.Instance.Init();
			
			UIManager.Instance.CurrentUI = new UIType.HOME.UIClass();
		}
	}
}