package co.spaceinvaders.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class CthulhuSpaceInvader extends Entity
	{
		[Embed(source = 'assets/sprites/cthulhulikealien.png')]		
		private const SPRITE:Class;
		public static const WIDTH:Number = 66;
		public static const HEIGHT:Number = 65;
		
		private var _SpaceInvader:Spritemap = new Spritemap(SPRITE, WIDTH, HEIGHT);
		private var _time:Number = 0;
		private var _Speed:Number = 10;
		
		private var direction:Number = 1;		
		
		public function CthulhuSpaceInvader(startingX:Number, startingY:Number)
		{
			_SpaceInvader.scale = 0.5;
			_SpaceInvader.add("move", [0, 1], 1, true);
			graphic = _SpaceInvader;			
			this.x= startingX;
			this.y = startingY;
			_SpaceInvader.play("move");
			collidable = true;
			setHitbox(CthulhuSpaceInvader.WIDTH * _SpaceInvader.scale, CthulhuSpaceInvader.HEIGHT* _SpaceInvader.scale);
		}
		
		override public function update():void
		{
			_time += FP.elapsed;
			if(_time >= 1)
			{
				CheckDirection();
				Move();		
				_time = 0;
			}
			CheckBulletHit();
		}
		
		private function CheckBulletHit():void
		{
			var b:Bullet = collide("bullet", x, y) as Bullet;
			if(b)
			{
				this.world.remove(b);
				this.world.remove(this);
			}
		}
		
		private function CheckDirection():void
		{
			if(this.x + (WIDTH*this._SpaceInvader.scale) > FP.width)
			{ 
				this.direction = -1;
				this.y += HEIGHT * this._SpaceInvader.scale;
			}
			if(this.x < 0){ 
				this.direction = 1;
				this.y += HEIGHT * this._SpaceInvader.scale;
			}
		}
		
		private function Move():void
		{
			this.x += this._Speed * this.direction;	
		}
	}
}