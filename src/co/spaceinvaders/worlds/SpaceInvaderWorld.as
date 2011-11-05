package co.spaceinvaders.worlds
{
	import co.spaceinvaders.entities.Cannon;
	import co.spaceinvaders.entities.CthulhuSpaceInvader;
	import co.spaceinvaders.entities.MetroidSpaceInvader;
	import co.spaceinvaders.entities.StandardSpaceInvader;
	
	import flashx.textLayout.formats.FormatValue;
	
	import net.flashpunk.World;
	
	public class SpaceInvaderWorld extends World
	{	
		private var _SpaceInvadersCount:Number = 14;
		private var _MetroidSpaceInvadersCount:Number = 10;
		private var _CthulhuSpaceInvadersCount:Number = 17;
		
		private var _NormalSpaceInvaders:Array = new Array();
		private var _MetroidSpaceInvaders:Array = new Array();
		private var _CthulhuSpaceInvaders:Array = new Array();
		
		public function SpaceInvaderWorld()
		{
			PopulateWorldWithSpaceInvaders();			
			_NormalSpaceInvaders.forEach(AddInvaderToWorld);
			_MetroidSpaceInvaders.forEach(AddInvaderToWorld);
			_CthulhuSpaceInvaders.forEach(AddInvaderToWorld);
			add(new Cannon());
		}
		
		private function AddInvaderToWorld(element:*, index:int, arr:Array):void
		{
			add(element);
		}
				
		private function PopulateWorldWithSpaceInvaders():void
		{
			for(var i:Number = 0; i <= _SpaceInvadersCount; i++)
			{
				_NormalSpaceInvaders.push(new StandardSpaceInvader(((i * StandardSpaceInvader.WIDTH) / 2) + (10 * i) / 2,
					0));
			}
			
			for(var j:Number = 0; j <= _MetroidSpaceInvadersCount; j++)
			{
				_MetroidSpaceInvaders.push(new MetroidSpaceInvader(((j * MetroidSpaceInvader.WIDTH) / 2) + (43 * j) / 2, 
					(MetroidSpaceInvader.HEIGHT / 2) + 10));
			}
			
			for(var k:Number = 0; k <= _CthulhuSpaceInvadersCount; k++)
			{
				_CthulhuSpaceInvaders.push(new CthulhuSpaceInvader(((k * CthulhuSpaceInvader.WIDTH) / 2) + (17.5 * k) / 2, 
					((CthulhuSpaceInvader.HEIGHT / 2) * 2) + 20));
			}
		}
	}
}