import macohi.funkin.MegaVars;
import flixel.FlxSprite;
import macohi.debugging.CrashHandler;
import macohi.debugging.CustomTrace;
import haxe.Log;
import macohi.funkin.koya.backend.AssetPaths;
import flixel.FlxG;
import macohi.overrides.MState;

class InitState extends MState
{
	override public function create()
	{
		super.create();

		Log.trace = CustomTrace.newTrace;

		CrashHandler.initalize('', 'MAI_', '', 'MacohiAnimationInteractable');

		AssetPaths.setCurrentLevel('main');
		AssetPaths.soundExt = 'wav';

		FlxSprite.defaultAntialiasing = true;

		MegaVars.VCR_LIBRARY = 'main';

		FlxG.switchState(AnimationSelect.new);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
