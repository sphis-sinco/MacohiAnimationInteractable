package anims;

import macohi.objects.MedalPopup;
import macohi.backend.PauseMState;
import flixel.util.FlxTimer;
import macohi.funkin.koya.backend.plugins.Cursor;
import flixel.FlxG;
import macohi.funkin.koya.backend.AssetPaths;
import macohi.overrides.MSprite;

class DislocateAShoulder extends PauseMState
{
	public var bg:MSprite = new MSprite();

	public var ogAurora:MSprite = new MSprite();
	public var ogNicom:MSprite = new MSprite();

	public var villianAurora:MSprite = new MSprite();
	public var heroNicom:MSprite = new MSprite();

	override function create()
	{
		AssetPaths.setCurrentLevel('dislocate_a_shoulder');

		bg.frames = AssetPaths.getAnimateAtlas('bg');

		ogAurora.frames = AssetPaths.getAnimateAtlas('ogAurora');
		ogNicom.frames = AssetPaths.getAnimateAtlas('ogNicom');
		villianAurora.frames = AssetPaths.getAnimateAtlas('villianAurora');
		heroNicom.frames = AssetPaths.getAnimateAtlas('heroNicom');

		ogNicom.setPosition(-150.15, -180);
		villianAurora.setPosition(-235.4, -184.9);

		ogAurora.setPosition(378.6, 476.85);
		heroNicom.setPosition(797.85, 398.4);

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
			FlxG.sound.music.stop();

			if (interupt)
				InitState.save.addMedal('dont_dislocate_a_shoulder', 88414);
			else
				InitState.save.addMedal('dislocate_a_shoulder', 88413);

			FlxG.switchState(AnimationSelect.new);
		});

		FlxG.sound.playMusic(AssetPaths.sound('DISLOCATE_A_SHOULDER_fixedvol'));

		super.create();
	}

	public var interupt:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (paused)
		{
			if (FlxG.keys.anyJustReleased([ENTER]))
				FlxG.switchState(AnimationSelect.new);
		}

		if ((bg.anim.frameIndex == 180) && interupt)
		{
			canPause = false;

			trace('You saved him');
			FlxG.sound.music.stop();

			bg.anim.frameIndex = 179;
			bg.anim.pause();
			ogAurora.anim.pause();
			heroNicom.anim.pause();

			villianAurora.frames = AssetPaths.getAnimateAtlas('villianAurora-miss');
			villianAurora.addFrameLabelAnim('main', 'miss', 24, false);

			ogNicom.frames = AssetPaths.getAnimateAtlas('ogNicom-dodge');
			ogNicom.addFrameLabelAnim('main', 'dodge', 24, false);

			for (prop in [villianAurora, ogNicom])
				prop.playAnim('main');

			villianAurora.setPosition(300.75, 537.65,);
			ogNicom.setPosition(242.7, 471.35,);

			FlxG.sound.play(AssetPaths.sound('weirdRoute', 'main'));
			FlxTimer.wait(1.0, function()
			{
				bg.anim.onFinish.dispatch('none');
			});

			// FlxG.switchState(AnimationSelect.new);
		}

		FlxG.watch.addQuick('mouseOverlapsAurora()', mouseOverlapsAurora());

		if (!paused)
		{
			if (villianAurora.brightness > 0)
				villianAurora.brightness = 0;

			if ((bg.anim.frameIndex >= 152 && bg.anim.frameIndex <= 176) && !interupt)
			{
				if (!Cursor.cursorVisible && !interupt)
					Cursor.cursorVisible = true;
				if (Cursor.cursorVisible && interupt)
					Cursor.cursorVisible = false;

				if (mouseOverlapsAurora() && !interupt)
				{
					villianAurora.brightness = 0.5;

					if (FlxG.mouse.justReleased && !interupt)
						interupt = true;
				}
			}
			else
			{
				if (Cursor.cursorVisible)
					Cursor.cursorVisible = false;
			}
		}
		else if (Cursor.cursorVisible)
			Cursor.cursorVisible = false;
	}

	public function mouseOverlapsAurora():Bool
	{
		if ((bg.anim.frameIndex >= 153 && bg.anim.frameIndex <= 181))
		{
			if (FlxG.mouse.x < (FlxG.width / 4) * 1.25)
				if (FlxG.mouse.y > (FlxG.height / 4) * 2)
					return true;
		}

		return false;
	}

	override function togglePaused()
	{
		super.togglePaused();

		if (paused)
			FlxG.sound.music?.pause();
		else
			FlxG.sound.music?.resume();
		for (prop in [bg, ogAurora, ogNicom, heroNicom, villianAurora])
		{
			if (prop != null)
				if (paused)
					prop.anim.pause();
				else
					prop.anim.resume();
		}
	}
}
