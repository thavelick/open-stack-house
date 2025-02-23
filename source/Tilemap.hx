package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class Tilemap extends FlxGroup
{
    private static inline var TILE_SIZE:Int = 32;
    private static inline var GROUND_LEVEL:Int = 6; // 6th row from bottom (shifted up one row)
    private static inline var PLAYER_START_X:Int = 3; // Player starts at 4th column (0-based index)
    private static inline var PLAYER_START_Y:Int = 6; // Player starts at 7th row from top

    public function new()
    {
        super();
        immovable = true; // Make entire tilemap immovable
        createTiles();
    }

    private function createTiles():Void
    {
        // Define the block colors
        var blockColors:Array<FlxColor> = [
            FlxColor.GRAY,
            FlxColor.fromRGB(101, 67, 33), // Dark Brown
            FlxColor.fromRGB(181, 101, 29), // Light Brown
            FlxColor.ORANGE,
            FlxColor.RED,
            FlxColor.YELLOW,
            FlxColor.fromRGB(0, 100, 0), // Dark Green
            FlxColor.fromRGB(34, 139, 34), // Lighter Green
            FlxColor.fromRGB(173, 216, 230), // Light Blue
            FlxColor.PURPLE
        ];

        // Create blocks only on the ground line
        for (x in 0...8) // 8 columns
        {
            // Skip player start column
            if (x == PLAYER_START_X)
                continue;

            // 50% chance to create a ground block
            if (FlxG.random.bool(50))
            {
                var tile = new FlxSprite(x * TILE_SIZE, GROUND_LEVEL * TILE_SIZE);
                tile.makeGraphic(TILE_SIZE, TILE_SIZE, blockColors[FlxG.random.int(0, blockColors.length - 1)]);
                add(tile);
            }
        }

        // Create stacked blocks above ground
        for (y in GROUND_LEVEL - 2...GROUND_LEVEL) // Create 2 rows above ground
        {
            for (x in 0...8) // 8 columns
            {
                // Skip player start column
                if (x == PLAYER_START_X)
                    continue;

                // Only create block if there's a block below
                if (getTileAt(x, y + 1) != null && FlxG.random.bool(30)) // 30% chance to create a block
                {
                    var tile = new FlxSprite(x * TILE_SIZE, y * TILE_SIZE);
                    tile.makeGraphic(TILE_SIZE, TILE_SIZE, blockColors[FlxG.random.int(0, blockColors.length - 1)]);
                    tile.immovable = true; // Blocks are immovable
                    add(tile);
                }
            }
        }
    }

    private function getTileAt(x:Int, y:Int):FlxSprite
    {
        for (member in members)
        {
            var tile:FlxSprite = cast member;
            if (tile.x == x * TILE_SIZE && tile.y == y * TILE_SIZE)
            {
                return tile;
            }
        }
        return null;
    }
}
