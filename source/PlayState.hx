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
	var game:Bool = true;
	var tempPointer:DLLNode<Int>;
	var input:Int;
	var whichClicked:Int;
	var counter:Int;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		counter = 0;
		tempPointer = seqs.head;
		FlxG.plugins.add(new MouseEventManager());
		zones[0] = new Zone(110, 20, FlxColor.YELLOW);
		zones[1] = new Zone(330, 20, FlxColor.BLUE);
		zones[2] = new Zone(110, 260, FlxColor.RED);
		zones[3] = new Zone(330, 260, FlxColor.GREEN);
		add(zones[0]);
		add(zones[1]);
		add(zones[2]);
		add(zones[3]);
		gameLoop();
		super.create();
	}
	
	private function gameLoop():Void
	{
		populate();
		display();
		trace(seqs.toString());
		trace(tempPointer.val);
		listen();
	}
	
	private function display(): Void
	{
		var tmp:DLLNode<Int> = seqs.head;
		do 
		{
			Sys.sleep(1);
			switch (tmp.val)
			{
				case 0: displayZone(0);
				case 1: displayZone(1);
				case 2: displayZone(2);
				case 3: displayZone(3);
			}
			counter++;
			tmp = tmp.next;
		}while (tmp != null);
	}
	
	private function displayZone(zonesIndex:Int):Void
	{
		zones[zonesIndex].changeColor();
		Sys.sleep(0.5);
		zones[zonesIndex].firstColor();
	}
	
	private function populate():Void
	{
		var num:Int;
		num = Std.random(4);
		seqs.append(num);
	}
	
	private function listen():Void
	{
		if (tempPointer != null)
		{
			MouseEventManager.add(zones[0], clicked0 , null, null, null);
			MouseEventManager.add(zones[1], clicked1 , null, null, null);
			MouseEventManager.add(zones[2], clicked2 , null, null, null);
			MouseEventManager.add(zones[3], clicked3 , null, null, null);
		}
	}
	
	private function clicked0(Sprite:FlxSprite)
	{
		trace("clicked 0");
		if (tempPointer.val != 0)
		{
			FlxG.switchState(new EndState());
		}
		else if (tempPointer.val == 0 && counter != 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			counter--;
			tempPointer = tempPointer.next;
			listen();
		}
		else if (tempPointer.val == 0 && counter == 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			gameLoop();
		}
	}
	
	private function clicked1(Sprite:FlxSprite)
	{
		trace("clicked 1");
		if (tempPointer.val != 1)
		{
			FlxG.switchState(new EndState());
		}
		else if (tempPointer.val == 1 && counter != 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			counter--;
			tempPointer = tempPointer.next;
			listen();
		}
		else if (tempPointer.val == 1 && counter == 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			gameLoop();
		}
	}
	
	private function clicked2(Sprite:FlxSprite)
	{
		trace("clicked 2");
		whichClicked = 2;
		if (tempPointer.val != 2)
		{
			FlxG.switchState(new EndState());
		}
		else if (tempPointer.val == 2 && counter != 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			counter--;
			tempPointer = tempPointer.next;
			listen();
		}
		else if (tempPointer.val == 2 && counter == 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			gameLoop();
		}
	}
	
	private function clicked3(Sprite:FlxSprite)
	{
		trace("clicked 3");
		whichClicked = 3;
		if (tempPointer.val != 3)
		{
			FlxG.switchState(new EndState());
		}
		else if (tempPointer.val == 3 && counter != 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			counter--;
			tempPointer = tempPointer.next;
			listen();
		}
		else if (tempPointer.val == 3 && counter == 0)
		{
			MouseEventManager.remove(zones[0]);
			MouseEventManager.remove(zones[1]);
			MouseEventManager.remove(zones[2]);
			MouseEventManager.remove(zones[3]);
			gameLoop();
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