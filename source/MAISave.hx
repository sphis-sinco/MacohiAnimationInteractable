import macohi.objects.MedalPopup;
import macohi.funkin.pre_vslice.NGio;
import macohi.save.SaveField;
import macohi.save.Save;

class MAISave extends Save
{
	public var medals:SaveField<Array<String>>;

	override public function new()
	{
		super();

		SAVE_VERSION = 1;
		init('MacohiAnimationInteractable', null);
	}

	override function initFields()
	{
		super.initFields();

		medals = new SaveField<Array<String>>('medals', [], 'Medals');
	}

	public function addMedal(medal:String, ?ngID:Int = 0)
	{
		if (!medals.get().contains(medal))
		{
			medals.get().push(medal);

			MedalPopup.displayMedal(medal);

			#if (ENABLE_NEWGROUNDS && newgrounds)
			if (ngID != 0)
				NGio.unlockMedal(ngID);
			#end
		}
	}
}
