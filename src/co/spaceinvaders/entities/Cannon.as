package co.spaceinvaders.entities
{
	import co.spaceinvaders.worlds.SpaceInvaderWorld;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Cannon extends Entity
	{
		[Embed(source = 'assets/sprites/canon.png')]		
		private const SPRITE:Class;
		public static const WIDTH:Number = 104;		 
		
		private var _Speed:Number = 5;
		private var _Image:Image = new Image(SPRITE);
		
		
		public function Cannon()
		{
			name = "Cannon";
			_Image.scale = 0.5;
			graphic = _Image;
			this.y = (FP.height - (_Image.height * _Image.scale));
			this.x = ((FP.width / 2) - (_Image.width * _Image.scale));
		}
		
		public override function update():void
		{
			if (Input.pressed(Key.SPACE))
			{
				var currentWord:SpaceInvaderWorld = this.world as SpaceInvaderWorld;
				currentWord.add(new Bullet());
			}
			
			if (Input.check(Key.RIGHT))
			{
				this.x += _Speed;
			}
			
			if (Input.check(Key.LEFT))
			{
				this.x -= _Speed;
			}
		}
	}
}