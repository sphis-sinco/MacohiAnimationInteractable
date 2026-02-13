import macohi.objects.MedalPopup;
import macohi.funkin.pre_vslice.NGio;
import macohi.util.StringUtil;
import macohi.funkin.koya.backend.plugins.Cursor;
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
	public var apistuff:Array<String> = StringUtil.splitTextAssetByNewlines(AssetPaths.txt('data/apistuff', 'medals'));

	#if (ENABLE_NEWGROUNDS && newgrounds)
	public static var NEWGROUNDS:NGio;
	#end

	public static var save:MAISave;

	override public function create()
	{
		super.create();

		if (apistuff == [] || apistuff == null)
			apistuff = ['', ''];

		Log.trace = CustomTrace.newTrace;

		CrashHandler.initalize('', 'MAI_', '', 'MacohiAnimationInteractable');

		AssetPaths.setCurrentLevel('main');
		AssetPaths.soundExt = 'wav';

		FlxSprite.defaultAntialiasing = true;

		FlxG.plugins.addPlugin(new Cursor());
		FlxG.plugins.addPlugin(new MedalPopup());
		FlxG.plugins.drawOnTop = true;

		MegaVars.VCR_LIBRARY = 'main';

		MegaVars.SOUND_MENU_BACK = '';
		MegaVars.SOUND_MENU_CONFIRM = '';
		MegaVars.SOUND_MENU_SCROLL = '';

		MegaVars.KOYA_MENUBG_PINK = function(lib)
		{
			return '';
		}
		MegaVars.KOYA_MENUBG_DESAT = function(lib)
		{
			return '';
		}

		save = new MAISave();

		#if (ENABLE_NEWGROUNDS && newgrounds)
		NEWGROUNDS = new NGio(apistuff[0], apistuff[1]);
		#end

		FlxG.switchState(AnimationSelect.new);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
