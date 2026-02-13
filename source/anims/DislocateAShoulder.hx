package anims;

import flixel.FlxG;
import macohi.funkin.koya.backend.AssetPaths;
import macohi.overrides.MSprite;
import macohi.overrides.MState;

class DislocateAShoulder extends MState
{
	public var bg:MSprite = new MSprite();

	public var ogAurora:MSprite = new MSprite();
	public var ogNicom:MSprite = new MSprite();

	public var villianAurora:MSprite = new MSprite();
	public var heroNicom:MSprite = new MSprite();

	override function create()
	{
		super.create();

		AssetPaths.setCurrentLevel('dislocate_a_shoulder');

		bg.frames = AssetPaths.getAnimateAtlas('bg');

		ogAurora.frames = AssetPaths.getAnimateAtlas('ogAurora');
		ogNicom.frames = AssetPaths.getAnimateAtlas('ogNicom');
		villianAurora.frames = AssetPaths.getAnimateAtlas('villianAurora');
		heroNicom.frames = AssetPaths.getAnimateAtlas('heroNicom');

		for (prop in [bg, ogAurora, heroNicom, villianAurora, ogNicom])
		{
			prop.addFrameLabelAnim('main', 'main', 24, false);
			prop.playAnim('main');

			add(prop);
		}

		bg.setPosition(0, 0);
		
		ogAurora.setPosition(0, 0);
		ogNicom.setPosition(0, 0);
		villianAurora.setPosition(0, 0);
		heroNicom.setPosition(0, 0);

		FlxG.sound.play(AssetPaths.sound('DISLOCATE_A_SHOULDER_fixedvol'), 1.0, false, null, true, function()
		{
			trace('Done');
		});
	}
}
