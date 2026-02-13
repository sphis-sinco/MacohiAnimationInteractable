package anims;

import macohi.funkin.koya.backend.plugins.Cursor;
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

		ogNicom.setPosition(
			-150.15,
			-180
		);
		villianAurora.setPosition(
			-235.4,
			-184.9
		);

		ogAurora.setPosition(
			378.6,
			476.85
		);
		heroNicom.setPosition(
			797.85,
			398.4
		);

		for (prop in [bg, ogAurora, heroNicom, villianAurora, ogNicom])
		{
			prop.addFrameLabelAnim('main', 'main', 24, false);
			prop.playAnim('main');

			add(prop);
		}

		bg.scale.set(2, 2);
		bg.screenCenter();

		bg.anim.onFinish.add(function(a)
		{
			trace('Done');
			FlxG.switchState(AnimationSelect.new);
		});

		FlxG.sound.play(AssetPaths.sound('DISLOCATE_A_SHOULDER_fixedvol'));
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);

		if (bg.anim.frameIndex == 153)
			Cursor.cursorVisible = true;
	}
}
