import Igis
import Scenes

class Player : RenderableEntity, KeyDownHandler {

    let player:Ellipse

    var direction = 0

    // 1 = up, 2 = right, 3 = down, 4 = left

    //Movement Keys
    let upKey:String
    let downKey:String
    let leftKey:String
    let rightKey:String
    
    init() {
        // Initialize Objectx

        player = Ellipse(center:Point.zero, radiusX:20, radiusY:20, fillMode:.fillAndStroke)

        //Key Objects
        upKey = "w"
        downKey = "s"
        leftKey = "a"
        rightKey = "d"
        
        
    }

    
    
    override func setup(canvasSize:Size, canvas:Canvas) {

        player.center = canvasSize.center
        
        dispatcher.registerKeyDownHandler(handler:self)
    }

    override func render(canvas:Canvas){
        move()
        canvas.render(FillStyle(color:Color(.yellow)), player)
    }


    func move(){
        switch direction{
        case 0:
            player.center += Point(x:0, y:0)
        case 1:
            player.center += Point(x:0, y:-5)
        case 2:
            player.center += Point(x:5, y:0)
        case 3:
            player.center += Point(x:0, y:5)
        case 4:
            player.center += Point(x:-5, y:0)
        default:
            player.center += Point(x:0, y:0)
        }
    }

    func boundingRectangle() -> Rect{
        let topLeft = player.center + Point(x:20, y:20)
        let rect = Rect(topLeft:topLeft, size:Size(width:40, height:40))
        return rect
    }
        
        

    override func teardown() {
        dispatcher.unregisterKeyDownHandler(handler:self)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        switch key{
        case upKey:
            direction = 1
        case rightKey:
            direction = 2
        case downKey:
            direction = 3
        case leftKey:
            direction = 4
        default:
            direction = 0
        }
            
    }
    
}
