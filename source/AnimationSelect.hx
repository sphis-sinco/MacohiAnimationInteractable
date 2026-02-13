import macohi.funkin.koya.backend.plugins.Cursor;
import macohi.objects.MedalPopup;
import macohi.funkin.koya.backend.AssetPaths;
import anims.DislocateAShoulder;
import flixel.FlxG;
import macohi.funkin.koya.frontend.scenes.menustates.OptionsMenuState;

class AnimationSelect extends OptionsMenuState
{
	override public function new()
	{
		super();
		this.atlasText = false;
	}

	override function addItems()
	{
		super.addItems();

		addItem('Dislocate a Shoulder', 'Created 2/12/2026', function()
		{
			FlxG.switchState(DislocateAShoulder.new);
		});
	}

	override function create()
	{
		AssetPaths.setCurrentLevel('main');
		flashBG.lib = pinkBG.lib = null;
		flashBG.reloadBG = pinkBG.reloadBG = function(?pink:Bool)
		{
			// pinkBG.loadGraphic();
			// flashBG.loadGraphic();
		};

		flashBG.reloadBG(false);
		pinkBG.reloadBG(false);

		flashBG.visible = false;
		pinkBG.visible = false;

		super.create();

		Cursor.cursorVisible = false;

		MedalPopup.displayMedal(AssetPaths.image('dislocate_a_shoulder', 'medals'));
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		valueText.text = 'Animation: ${this.itemList[currentSelection]}';
		if (this.itemListValues.get(this.itemList[currentSelection]) != null)
			valueText.text += '\nDescription:${this.itemListValues.get(this.itemList[currentSelection])}';
	}

	override function controlsMoveVertical()
	{
		super.controlsMoveVertical();

		if (FlxG.keys.anyJustReleased([W, UP]))
			select(-1);
		if (FlxG.keys.anyJustReleased([S, DOWN]))
			select(1);
	}

	override function controlsOther()
	{
		super.controlsOther();

		if (FlxG.keys.anyJustReleased([ENTER]))
			acceptFunction();

		// if (FlxG.keys.anyJustReleased([ESCAPE]))
		// acceptFunction();
	}
}
