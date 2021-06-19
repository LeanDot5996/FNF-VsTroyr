package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";

	private var bgColors:Array<String> = ['#314d7f', '#4e7093', '#70526e', '#594465'];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);

		var kadeLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('KadeEngineLogo'));
		kadeLogo.scale.y = 0.3;
		kadeLogo.scale.x = 0.3;
		kadeLogo.x -= kadeLogo.frameHeight;
		kadeLogo.y -= 180;
		kadeLogo.alpha = 0.8;
		add(kadeLogo);

		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Congratulations!\n\n"
			+ "You complete the Week T in the Hard difficulty\n"
			+ "You unlocked an extra song to play\n"
			+ "Go to Freeplay Menu to Play it\n\n"
			+ "Press ENTER to Continue",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
