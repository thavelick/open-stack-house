package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
    private static inline var SPEED:Float = 200;
    private static inline var GRAVITY:Float = 0;
    private static inline var JUMP_FORCE:Float = -300;
    private var canJump:Bool = true;

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
        if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.X)
        {
            trace("Jump pressed");
            if (canJump)
            {
                trace("Applying jump force");
                velocity.y = JUMP_FORCE;
                canJump = false;
            }
            else
            {
                trace("Can't jump - already in air");
            }
        }
        
        trace('Player position: (${x}, ${y}) Velocity: (${velocity.x}, ${velocity.y})');

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
