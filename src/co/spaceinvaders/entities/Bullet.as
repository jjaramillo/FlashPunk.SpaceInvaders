package co.spaceinvaders.entities
{
	import flashx.textLayout.elements.OverflowPolicy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		[Embed(source = 'assets/sprites/bullet.png')]		
		private const SPRITE:Class;
		
		private var _Speed:Number = 5;
		private var _Image:Image = new Image(SPRITE);
		
		public function Bullet()
		{			
			graphic = _Image;
			var cannon:Cannon = FP.world.getInstance("Cannon") as Cannon;
			this.y = cannon.y;
			this.x = cannon.x + ((Cannon.WIDTH * 0.5) / 2);
			this.collidable = true;
			setHitbox(2,10);
			type = "bullet";
		}
		
		override public function update():void
		{
			this.y -= _Speed;
			if(this.y < 0){
				this.world.remove(this);
				trace("Removing bullet: ".concat(this.toString()));
			}
				
			
		}
	}
}