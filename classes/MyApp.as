package
{
    import starling.display.Sprite;
    
    
    import starling.events.TouchEvent;
    import starling.events.Touch;
    import starling.events.Event;
    import starling.core.Starling;
    import flash.geom.Rectangle;
    import starling.display.Quad;
    import starling.events.TouchPhase;
    import flash.geom.Point;
    
    
    
    public class MyApp extends Sprite
    {

        private var container:Quad;
        private var blackboard:Blackboard;

        protected var prevPt:Point = new Point();
		protected var currPt:Point = new Point();
		protected var startPt:Point = new Point();
		protected var movePt:Point = new Point();

        public function MyApp()
        {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        public function initialize():void
        {
            // container = new Sprite();
            // this.addChild(container);

            // this.width = Config.appWidth;
            // this.height = Config.appHeight;

            // container.addEventListener(TouchEvent.TOUCH, onTouch);
            // trace("check bounds:" + this.bounds, container.bounds);
            // trace("viewport:" + Starling.current.viewPort);
        }

        

        private function onAddedToStage(event:Event):void
        {
            trace("on added to stage")
            container = new Quad(Config.appWidth, Config.appHeight, 0x333333)
            this.addChild(container);

            container.addEventListener(TouchEvent.TOUCH, onTouch);
            trace("check bounds:" + this.bounds, container.bounds);
            trace("viewport:" + Starling.current.viewPort);
        
        }

        public function onTouch(e:TouchEvent):void
        {
            var t:Touch = e.getTouch(this);
            var brush:Quad = new Quad(10, 10, 0xffffff);
            
            if(t==null) return;
            if(t.phase == TouchPhase.BEGAN)
            {
                trace("ontouchbegan");
                prevPt.x = movePt.x = currPt.x = startPt.x = t.globalX;
				prevPt.y = movePt.y = currPt.y = startPt.y = t.globalY;
                brush.x = currPt.x;
                brush.y = currPt.y;
                addChild(brush);
            }
            if(t.phase == TouchPhase.MOVED)
            {
                trace("ontouchmoved");
                prevPt.x = currPt.x;
				prevPt.y = currPt.y;
				currPt.x = movePt.x;
				currPt.y = movePt.y;
                movePt.x = t.globalX;
                movePt.y = t.globalY;
                brush.x = currPt.x;
                brush.y = currPt.y;
                addChild(brush);
            }
        }

    }
}