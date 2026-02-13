import macohi.debugging.CrashHandler;
import macohi.debugging.CustomTrace;
import haxe.Log;
import anims.DislocateAShoulder;
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

		FlxG.switchState(DislocateAShoulder.new);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
