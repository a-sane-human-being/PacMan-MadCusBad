import Igis
import Scenes

class Coins : RenderableEntity {

    var didDraw = false
    
    let coin:Ellipse

    var coins:Array<(Ellipse, Bool)> = []

    // 1 = up, 2 = right, 3 = down, 4 = left

    //Movement Keys
    
    init() {
        // Initialize Objectx

        coin = Ellipse(center:Point.zero, radiusX:5, radiusY:5, fillMode:.fillAndStroke)
        
        
    }

    
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        coin.center = Point(x:100, y:100)
        let xCoins = 40
        let yCoins = 19
        for y in 0...yCoins{
            for x in 0...xCoins{
                coin.center += Point(x:40, y:0)
                coins.append((Ellipse(center:coin.center, radiusX:5, radiusY:5, fillMode:.fillAndStroke), true))
            }
            coin.center += Point(x:-((xCoins+1) * 40), y:40)
        }
    }

    override func render(canvas:Canvas){
        for c in coins{
            if c.1 == true{
                canvas.render(FillStyle(color:Color(.goldenrod)), StrokeStyle(color:Color(.white)), c.0)
            }
        }
    }


    
    func boundingRectangle(_ ellipse:Ellipse) -> Rect{
        let topLeft = ellipse.center + Point(x:5, y:5)
        let rect = Rect(topLeft:topLeft, size:Size(width:10, height:10))
        return rect
    }

    
}
