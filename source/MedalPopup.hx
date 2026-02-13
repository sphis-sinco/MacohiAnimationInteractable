import flixel.tweens.FlxTween;
import flixel.FlxG;
import macohi.overrides.MSprite;
import flixel.FlxBasic;

class MedalPopup extends FlxBasic
{
	public static var medal:MSprite = new MSprite();

	override public function new()
	{
		super();
	}

	public static function displayMedal(mp:String)
	{
		medal.destroy();

		medal = new MSprite().loadGraphic(mp);
		medal.screenCenter();

		medal.y = FlxG.height * 0.8;

		medal.alpha = 1;

		FlxTween.tween(medal, {alpha: 0}, 0.5, {
			startDelay: 1,
		});

		if (!FlxG.state.members.contains(medal))
			FlxG.state.add(medal);
		else
		{
			FlxG.state.remove(medal);
			FlxG.state.add(medal); // stay at the front
		}
	}
}
