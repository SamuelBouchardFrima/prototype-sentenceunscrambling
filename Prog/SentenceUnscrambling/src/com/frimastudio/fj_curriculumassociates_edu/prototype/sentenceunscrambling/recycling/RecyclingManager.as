package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.recycling
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class RecyclingManager extends EventDispatcher implements IRecyclingManager
	{
		private static var mInstance:RecyclingManager = new RecyclingManager();
		
		public static function get Instance():IRecyclingManager
		{
			return mInstance;
		}
		
		private var mRecyclingUnit:int;
		
		public function get RecyclingUnit():int
		{
			return mRecyclingUnit;
		}
		public function set RecyclingUnit(aValue:int):void
		{
			mRecyclingUnit = aValue;
			
			dispatchEvent(new RecyclingManagerEvent(RecyclingManagerEvent.UNIT_CHANGE));
		}
		
		public function RecyclingManager(target:IEventDispatcher = null)
		{
			super(target);
			
			if (mInstance)
			{
				throw new Error("RecyclingManager is a singleton not intended for instantiation. Use RecyclingManager.Instance instead.");
			}
		}
	}
}