import macohi.save.Save;

class MAISave extends Save
{
	override public function new()
	{
		super();

		SAVE_VERSION = 1;
		init('MacohiAnimationInteractable', null);
	}
}
