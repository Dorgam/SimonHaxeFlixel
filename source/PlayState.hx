package;

import de.polygonal.ds.DLLNode;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import de.polygonal.ds.DLL;
import flixel.util.FlxTimer;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxTimer;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	//Variables
	var zones:Array<Zone> =  new Array<Zone>();
	var seqs:DLL<Int> = new DLL<Int>();
	var activeZone:Int;
	var tempPointer:DLLNode<Int>; //Used to check user Input
	var displayPointer:DLLNode<Int>; //Used to display
	var counter:Int;
	var restartVal:Int;
	public static var score(default,null):Int = 0;
	var scoreTxt:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.plugins.add(new MouseEventManager());
		scoreTxt = new FlxText(0, 0, "Score : " + score);
		scoreTxt.setFormat(12);
		zones[0] = new Zone(110, 20, FlxColor.YELLOW, 0);
		zones[1] = new Zone(330, 20, FlxColor.BLUE, 1);
		zones[2] = new Zone(110, 260, FlxColor.RED, 2);
		zones[3] = new Zone(330, 260, FlxColor.GREEN, 3);
		add(zones[0]);
		add(zones[1]);
		add(zones[2]);
		add(zones[3]);
		add(scoreTxt);
		new FlxTimer(2 , gameLoop, 1);
		super.create();
	}
	
	public function getScore():Int
	{
		return score;
	}
	
	private function gameLoop(Timer:FlxTimer):Void
	{
		populate();
		displayPointer = seqs.head;
		display();
		tempPointer = seqs.head;
		counter = seqs.size();
		listen();
	}
	
	private function display(): Void
	{
		if(displayPointer != null)
		{
			activeZone = displayPointer.val;
			trace("displaying " + displayPointer.val + " ...");
			new FlxTimer(1, displayZone, 1);
			displayPointer = displayPointer.next;
        }
	}
	
	private function displayZone(Timer:FlxTimer):Void
	{
		trace("Displaying zone : " + activeZone);
		FlxG.sound.play(""+activeZone);
		zones[activeZone].changeColor();
		new FlxTimer(0.5, restartZone, 1);
	}
	
	private function restartZone(Timer:FlxTimer)
	{
		zones[activeZone].firstColor();
		display();
	}
	
	private function restartZoneClick(Timer:FlxTimer)
	{
		zones[restartVal].firstColor();
	}
	
	private function populate():Void
	{
		var num:Int;
		num = Std.random(4);
		seqs.append(num);
	}
	
	private function firstPopulate():Void
	{
		var num:Int;
		num = Std.random(4);
		seqs.append(num);
		trace(num);
		tempPointer = seqs.head;
	}
	
	private function listen():Void
	{
		MouseEventManager.add(zones[0], clicked);
		MouseEventManager.add(zones[1], clicked);
		MouseEventManager.add(zones[2], clicked);
		MouseEventManager.add(zones[3], clicked);
	}
	
	private function clicked(Sprite:FlxSprite)
	{
		var zone:Zone = cast Sprite;
		var val:Int = zone.index;
		trace("clicked " + val);
		FlxG.sound.play("" + val);
		zones[val].changeColor();
		restartVal = val;
		new FlxTimer(0.5, restartZoneClick, 1);
		if (tempPointer.val != val)
		{
			FlxG.switchState(new EndState());
		}
		else if (tempPointer.val == val && counter > 1)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			counter--;
			tempPointer = tempPointer.next;
			listen();
		}
		else if (tempPointer.val == val && counter <= 1)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			remove(scoreTxt);
			score++;
			scoreTxt = new FlxText(0, 0, "Score : " + score);
			scoreTxt.setFormat(12);
			add(scoreTxt);
			new FlxTimer(0.1, gameLoop, 1);
		}
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