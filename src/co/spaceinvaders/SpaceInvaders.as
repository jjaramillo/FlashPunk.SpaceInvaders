package co.spaceinvaders
{
	import co.spaceinvaders.worlds.SpaceInvaderWorld;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class SpaceInvaders extends Engine
	{
		public function SpaceInvaders()
		{
			super(800,600, 60, false);	
			FP.world = new SpaceInvaderWorld();
		}
		
		override public function init():void
		{
			trace("Game engine initialized");	
		}
	}
}