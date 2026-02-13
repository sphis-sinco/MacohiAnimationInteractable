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

		ogNicom.setPosition(-127.95, -163.75);
		villianAurora.setPosition(-291.9, -452);

		ogAurora.setPosition(121.25, 209.7);
		heroNicom.setPosition(369, 131.25);

		bg.anim.onFinish.add(function(a) {
			trace('Done');
			FlxG.resetState();
		});

		FlxG.sound.play(AssetPaths.sound('DISLOCATE_A_SHOULDER_fixedvol'));
	}
}
