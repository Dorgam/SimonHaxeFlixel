package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	//Variables
	var zones:Array<Zone> =  new Array<Zone>();
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		zones[0] = new Zone(110, 20, FlxColor.YELLOW);
		zones[1] = new Zone(330, 20, FlxColor.BLUE);
		zones[2] = new Zone(110, 260, FlxColor.RED);
		zones[3] = new Zone(330, 260, FlxColor.GREEN);
		add(zones[0]);
		add(zones[1]);
		add(zones[2]);
		add(zones[3]);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}