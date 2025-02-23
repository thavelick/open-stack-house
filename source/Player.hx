package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
    private static inline var SPEED:Float = 200;
    private static inline var GRAVITY:Float = 600;
    private static inline var JUMP_FORCE:Float = -300;
    private var canJump:Bool = false;

    public function new(x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(32, 32, FlxColor.PURPLE);
        acceleration.y = GRAVITY; // Add gravity
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        
        // Reset velocity
        velocity.x = 0;

        // Movement
        if (FlxG.keys.pressed.LEFT)
        {
            velocity.x = -SPEED;
        }
        if (FlxG.keys.pressed.RIGHT)
        {
            velocity.x = SPEED;
        }

        // Jumping
        if ((FlxG.keys.justPressed.UP || FlxG.keys.justPressed.X) && canJump)
        {
            velocity.y = JUMP_FORCE;
            canJump = false;
        }

        // Ground collision check
        if (y >= FlxG.height - 64)
        {
            y = FlxG.height - 64;
            velocity.y = 0;
            canJump = true;
        }

        // Screen bounds
        if (x < 0)
        {
            x = 0;
        }
        else if (x > FlxG.width - width)
        {
            x = FlxG.width - width;
        }
    }
}
