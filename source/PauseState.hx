package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class PauseState extends FlxState {
	override public function create() {
		super.create();

		var pauseText = new FlxText(0, 20, 0, "PAUSED", 40);
		pauseText.screenCenter(X);
		add(pauseText);

		var resumeButton = new FlxButton(0, 0, "Resume", resumeGame);
		resumeButton.screenCenter();
		add(resumeButton);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.P) {
			resumeGame();
		}
	}

	private function resumeGame():Void {
		FlxG.switchState(GameState.new);
	}
}
