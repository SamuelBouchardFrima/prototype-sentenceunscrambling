package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.crafting
{
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.Asset;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.IconUIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.ui.UIButton;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.Word;
	import com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling.word.WordPiece;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class UIWordPieceGroup extends Sprite
	{
		private var mGroupBackground:Sprite;
		private var mPieceList:Vector.<UIWordPiece>;
		private var mDictionaryButton:UIButton;
		
		public function get PieceList():Vector.<UIWordPiece>
		{
			return mPieceList;
		}
		
		public function get WordPieceList():Vector.<WordPiece>
		{
			var list:Vector.<WordPiece> = new Vector.<WordPiece>();
			for (var i:int = 0, end:int = mPieceList.length; i < end; ++i)
			{
				list.push(mPieceList[i].Piece);
			}
			return list;
		}
		
		private function get Valid():Boolean
		{
			var pieceList:Vector.<WordPiece> = new Vector.<WordPiece>();
			for (var i:int = 0, end:int = mPieceList.length; i < end; ++i)
			{
				pieceList.push(mPieceList[i].Piece);
			}
			return new Word(pieceList).Valid;
		}
		
		public function UIWordPieceGroup(aPieceList:Vector.<UIWordPiece>)
		{
			super();
			
			mGroupBackground = new Sprite();
			addChild(mGroupBackground);
			
			mPieceList = aPieceList;
			
			x = mPieceList[0].x;
			y = mPieceList[0].y;
			
			for (var i:int = 0, end:int = mPieceList.length; i < end; ++i)
			{
				mPieceList[i].x -= x;
				mPieceList[i].y -= y;
				mPieceList[i].addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownUIWordPiece);
				addChild(mPieceList[i]);
			}
			
			DrawGroupBackground();
			
			mDictionaryButton = new IconUIButton(new Point(25, 25), Asset.DictionaryButtonBitmap, 0x00FF00);
			mDictionaryButton.x = -12.5;
			mDictionaryButton.y = 37.5;
			mDictionaryButton.visible = Valid;
			mDictionaryButton.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownDictionaryButton);
			mDictionaryButton.addEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
			addChild(mDictionaryButton);
		}
		
		public function Dispose():void
		{
			for (var i:int = 0, end:int = mPieceList.length; i < end; ++i)
			{
				mPieceList[i].removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownUIWordPiece);
			}
			
			mDictionaryButton.removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownDictionaryButton);
			mDictionaryButton.removeEventListener(MouseEvent.CLICK, OnClickDictionaryButton);
		}
		
		public function InsertPiece(aPiece:UIWordPiece, aIndex:int):void
		{
			if (aIndex > mPieceList.length)
			{
				throw new Error("Index " + aIndex + " outside of range " + mPieceList.length);
			}
			
			var firstLocation:Number = mPieceList[0].x;
			aPiece.y = mPieceList[0].y;
			
			mPieceList.splice(aIndex, 0, aPiece);
			aPiece.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownUIWordPiece);
			addChild(aPiece);
			
			for (var i:int = aIndex, end:int = mPieceList.length; i < end; ++i)
			{
				mPieceList[i].x = (i * aPiece.width) + firstLocation;
			}
			
			DrawGroupBackground();
			
			mDictionaryButton.visible = Valid;
		}
		
		private function DrawGroupBackground():void 
		{
			mGroupBackground.graphics.clear();
			mGroupBackground.graphics.beginFill(0xEEEEEE, 0.5);
			mGroupBackground.graphics.lineStyle(3, (Valid ? 0x00FF00 : 0xFF0000));
			mGroupBackground.graphics.moveTo(mPieceList[0].x - (mPieceList[0].width / 2) - 10,
				mPieceList[0].y - (mPieceList[0].height / 2) - 10);
			mGroupBackground.graphics.lineTo(mPieceList[mPieceList.length - 1].x + (mPieceList[0].width / 2) + 10,
				mPieceList[0].y - (mPieceList[0].height / 2) - 10);
			mGroupBackground.graphics.lineTo(mPieceList[mPieceList.length - 1].x + (mPieceList[0].width / 2) + 10,
				mPieceList[0].y + (mPieceList[0].height / 2) + 10);
			mGroupBackground.graphics.lineTo(mPieceList[0].x - (mPieceList[0].width / 2) - 10,
				mPieceList[0].y + (mPieceList[0].height / 2) + 10);
			mGroupBackground.graphics.lineTo(mPieceList[0].x - (mPieceList[0].width / 2) - 10,
				mPieceList[0].y - (mPieceList[0].height / 2) - 10);
			mGroupBackground.graphics.endFill();
		}
		
		private function OnMouseDownUIWordPiece(aEvent:MouseEvent):void
		{
			aEvent.stopPropagation();
			
			var piece:UIWordPiece = aEvent.currentTarget as UIWordPiece;
			piece.removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDownUIWordPiece);
			
			var firstLocation:Number = 0;
			var index:int = mPieceList.indexOf(piece);
			mPieceList.splice(index, 1);
			for (var i:int = index, end:int = mPieceList.length; i < end; ++i)
			{
				mPieceList[i].x = (i * piece.width) + firstLocation;
			}
			
			dispatchEvent(new UIWordPieceGroupEvent(UIWordPieceGroupEvent.DRAG_PIECE, piece));
			
			if (mPieceList.length == 1)
			{
				removeChild(mPieceList[0]);
				dispatchEvent(new UIWordPieceGroupEvent(UIWordPieceGroupEvent.RELEASE_PIECE, mPieceList[0]));
			}
			else
			{
				DrawGroupBackground();
				
				mDictionaryButton.visible = Valid;
			}
		}
		
		private function OnMouseDownDictionaryButton(aEvent:MouseEvent):void
		{
			aEvent.stopPropagation();
		}
		
		private function OnClickDictionaryButton(aEvent:MouseEvent):void
		{
			aEvent.stopPropagation();
			
			dispatchEvent(new UIWordPieceGroupEvent(UIWordPieceGroupEvent.SEND_TO_DICTIONARY));
		}
	}
}