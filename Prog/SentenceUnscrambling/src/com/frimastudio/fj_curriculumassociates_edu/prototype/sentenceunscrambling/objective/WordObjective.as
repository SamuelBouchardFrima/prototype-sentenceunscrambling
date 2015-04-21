package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.objective
{
	public class WordObjective extends Objective
	{
		public function WordObjective(aName:String)
		{
			super(aName);
		}
		
		override public function CompleteObjective(aName:String):Boolean
		{
			if (mComplete)
			{
				return false;
			}
			
			mComplete = (aName == mName);
			return mComplete;
		}
	}
}