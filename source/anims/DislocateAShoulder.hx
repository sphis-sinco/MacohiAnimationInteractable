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

		bg.screenCenter();

		ogNicom.setPositionBasedOnDimensions(-127.95, -163.75, 640, 480);
		villianAurora.setPositionBasedOnDimensions(-291.9, -452, 640, 480);

		ogAurora.setPositionBasedOnDimensions(121.25, 209.7, 640, 480);
		heroNicom.setPositionBasedOnDimensions(369, 131.25, 640, 480);

		bg.anim.onFinish.add(function(a)
		{
			trace('Done');
			FlxG.switchState(AnimationSelect.new);
		});

		FlxG.sound.play(AssetPaths.sound('DISLOCATE_A_SHOULDER_fixedvol'));
	}
}
