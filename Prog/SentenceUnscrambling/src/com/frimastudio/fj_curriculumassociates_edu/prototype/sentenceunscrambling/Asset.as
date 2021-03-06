package com.frimastudio.fj_curriculumassociates_edu.prototype.sentenceunscrambling
{
	public class Asset
	{
		[Embed(source = "../../../../../../art/icon-home-128.png")]
		public static var HomeButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-radio.png")]
		public static var CraftingButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-food.png")]
		public static var GroomingButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-book.png")]
		public static var DictionaryButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-star.png")]
		public static var ObjectiveButtonBitmap:Class;
		
		[Embed(source = "../../../../../../art/icon-mini.png")]
		public static var MiniBitmap:Class;
		[Embed(source = "../../../../../../art/icon-signal.png")]
		public static var RadioSignalBitmap:Class;
		[Embed(source = "../../../../../../art/icon-recycle.png")]
		public static var RecyclingBitmap:Class;
		[Embed(source = "../../../../../../art/icon-pizza.png")]
		public static var PizzaButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-coffe-maker.png")]
		public static var CoffeeButtonBitmap:Class;
		[Embed(source = "../../../../../../art/icon-cupcake.png")]
		public static var CupcakeButtonBitmap:Class;
		
		[Embed(source = "../../../../../../art/icon-pizza-part.png")]
		public static var PizzaFoodBitmap:Class;
		[Embed(source = "../../../../../../art/icon-coffee-cup.png")]
		public static var CoffeeFoodBitmap:Class;
		[Embed(source = "../../../../../../art/icon-cupcake.png")]
		public static var CupcakeFoodBitmap:Class;
		
		public function Asset()
		{
			throw new Error("Asset is a static class not intended for instantiation.");
		}
	}
}