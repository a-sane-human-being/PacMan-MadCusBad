import Igis
import Scenes

/*
 This class is responsible for rendering the background.
 */

class Background : RenderableEntity {
    let fillStyle : FillStyle
    let rectangle : Rectangle

    var didBack = false
    
    init() {
        // Initialize Objects
        fillStyle = FillStyle(color:Color(.black))
        rectangle = Rectangle(rect:Rect.zero, fillMode:.fill)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        rectangle.rect.size = canvasSize
    }

    override func render(canvas:Canvas) {
        // render the fillstyle modifier before the rectangle object
        canvas.render(fillStyle, rectangle)
    }
}
