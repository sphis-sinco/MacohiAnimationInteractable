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

		addItem('Dislocate a Shoulder', 'Created 2/12/2026', function() {});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		valueText.text = '${this.itemList[currentSelection]}';
		if (this.itemListValues.get(this.itemList[currentSelection]) != null)
			valueText.text += '\n${this.itemListValues.get(this.itemList[currentSelection])}';
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
