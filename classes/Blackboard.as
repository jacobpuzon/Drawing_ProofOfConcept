package 
{
   

    import starling.display.Sprite;
    import starling.events.TouchEvent;
    import starling.events.Touch;
    import starling.events.TouchPhase;

    public class Blackboard extends Sprite
    {
        private var container:Sprite;

        public function Blackboard()
        {
            trace("blackboard initialized");
            container = new Sprite;
            addChild(container);
            
            container.addEventListener(TouchEvent.TOUCH, onTouch);
        }

        public function onTouch(e:TouchEvent):void
        {
            trace("ontouch")
            var t:Touch = e.getTouch(this);
			if(t==null) return;
			if(t.phase == TouchPhase.BEGAN)
            {
                trace("i was touched");
            }
        }
    }
}