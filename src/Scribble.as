package
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import flash.display.Sprite;
   
    [SWF(frameRate = "60", backgroundColor = 0xffffff)]
	
	public class Scribble extends Sprite
	{
		private var myStarling:Starling;
        private var blackboard:Blackboard;
        private var viewPort:Rectangle;
        private var starlingClass:MyApp;

		
		public function Scribble()
		{
			//super();
            //initialize();
            Config.appHeight = stage.stageHeight;
            Config.appWidth = stage.stageWidth;

            // viewPort = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
            // this.stage.align = StageAlign.TOP_LEFT;
            // this.stage.scaleMode = StageScaleMode.NO_SCALE;
            
            myStarling = new Starling(MyApp, stage);
            // myStarling.viewPort = viewPort;
            // myStarling.stage.stageWidth = stage.stageWidth;
            // myStarling.stage.stageHeight = stage.stageHeight;
            // myStarling.simulateMultitouch = true;
            myStarling.start();
            
            
            trace("stageWidth and stageHeight:" + stage.stageWidth, stage.stageHeight);
		}
		
        private function onAddedToStage(event:Event):void
        {
            trace("added to stage");
            this.myStarling.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            
        }

        public function initialize():void
		{
			
		}

	}
}