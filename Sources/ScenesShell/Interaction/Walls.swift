import Igis
import Scenes

class Walls : RenderableEntity {

    let levelTop:Rectangle
    let levelLeft:Rectangle
    let levelRight:Rectangle
    let levelBottom:Rectangle
    let levelWall1:Rectangle

    let levelFill:FillStyle

    let levelStroke:StrokeStyle

    var levelRectangles:Array<Rectangle> = []
    
    init() {
        //Initialize Object
        levelTop = Rectangle(rect:Rect.zero, fillMode:.fillAndStroke)
        levelLeft = Rectangle(rect:Rect.zero, fillMode:.fillAndStroke)
        levelRight = Rectangle(rect:Rect.zero, fillMode:.fillAndStroke)
        levelBottom = Rectangle(rect:Rect.zero, fillMode:.fillAndStroke)
        levelWall1 = Rectangle(rect:Rect.zero, fillMode:.fillAndStroke)

        levelFill = FillStyle(color:Color(.blue))
        levelStroke = StrokeStyle(color:Color(.blue))
        
        super.init(name:"Walls")
    }
    

    override func setup(canvasSize:Size, canvas:Canvas){
        let canvasSize = canvas.canvasSize!

        levelTop.rect = Rect(topLeft:Point(x:50, y:50), size:Size(width:canvasSize.width - 100, height: 10))
        levelRectangles.append(levelTop)

        levelLeft.rect = Rect(topLeft:Point(x:canvasSize.width - 60, y:50), size:Size(width:10, height: canvasSize.height - 100))
        levelRectangles.append(levelLeft)

        levelRight.rect = Rect(topLeft:Point(x:50, y:50), size:Size(width:10, height: canvasSize.height - 100))
        levelRectangles.append(levelRight)
        
        levelBottom.rect = Rect(topLeft:Point(x:50, y:canvasSize.height - 60), size:Size(width:canvasSize.width - 100, height: 10))
        levelRectangles.append(levelBottom)

        levelWall1.rect = Rect(topLeft:Point(x:150, y:60), size:Size(width:10, height: canvasSize.height - 200))
        levelRectangles.append(levelWall1)
    }

    override func render(canvas:Canvas) {
        for rect in levelRectangles{
            canvas.render(levelFill, levelStroke, rect)
        }
    }

}
