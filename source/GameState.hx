package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeBox;
import flixel.text.FlxText;

class GameState extends FlxState {
	private var player:Player;
	private var border:FlxShapeBox;
	private var tilemap:Tilemap;
	private var debugText:FlxText;

	override public function create() {
		super.create();

		// Create border
		border = new FlxShapeBox(0, 0, FlxG.width, FlxG.height, {thickness: 2, color: FlxColor.BLUE}, FlxColor.TRANSPARENT);
		add(border);

		// Create ground line
		var ground = new FlxShapeBox(0, FlxG.height - 32, FlxG.width, 1, {thickness: 1, color: FlxColor.GREEN}, FlxColor.TRANSPARENT);
		add(ground);

		// Create tilemap
		tilemap = new Tilemap();
		add(tilemap);

		// Create player at bottom center of screen
		player = new Player((FlxG.width - 32) / 2, FlxG.height - 64);
		add(player);

		// Create debug text
		debugText = new FlxText(10, 10, 200, "Jump State: ", null, null);
		debugText.color = FlxColor.WHITE;
		add(debugText);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.P) {
			FlxG.switchState(PauseState.new);
		}

		var jumpStateString:String = switch (player.jumpState) {
			case GROUNDED: "GROUNDED";
			case RISING: "RISING";
			case FALLING: "FALLING";
		}

		debugText.text = "Jump State: " + jumpStateString;
	}
}
