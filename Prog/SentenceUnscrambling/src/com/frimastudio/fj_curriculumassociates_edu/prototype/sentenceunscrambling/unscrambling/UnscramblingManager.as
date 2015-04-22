package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.unscrambling
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.util.Random;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class UnscramblingManager extends EventDispatcher implements IUnscramblingManager
	{
		private static var mInstance:UnscramblingManager = new UnscramblingManager();
		
		public static function get Instance():IUnscramblingManager
		{
			return mInstance;
		}
		
		private var mSentenceList:Vector.<Sentence>;
		
		public function get RandomSentence():Sentence
		{
			return Random.FromList(mSentenceList);
		}
		
		public function UnscramblingManager(target:IEventDispatcher = null)
		{
			super(target);
			
			if (mInstance)
			{
				throw new Error("UnscramblingManager is a singleton not intended for instantiation. Use UnscramblingManager.Instance instead.");
			}
			
			var data:XML = new XML(SentenceDictionary.GRADE_1);
			var parsedData:Array/*String*/ = data.text()[0].split("\n");
			var splitIndex:int;
			mSentenceList = new Vector.<Sentence>();
			for (var i:int = 1, end:int = parsedData.length - 1; i < end; ++i)
			{
				splitIndex = parsedData[i].indexOf("~");
				mSentenceList.push(new Sentence(i, parsedData[i].substring(0, splitIndex),
					parsedData[i].substring(splitIndex + 1, parsedData[i].length - 1)));
			}
		}
	}
}