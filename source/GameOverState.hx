package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class GameOverState extends FlxState {
	override public function create() {
		super.create();

		var gameOverText = new FlxText(0, 20, 0, "Game Over", 40);
		gameOverText.screenCenter(X);
		add(gameOverText);

		var menuButton = new FlxButton(0, 0, "Main Menu", goToMenu);
		menuButton.screenCenter();
		add(menuButton);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	private function goToMenu():Void {
		FlxG.switchState(new MenuState());
	}
}
