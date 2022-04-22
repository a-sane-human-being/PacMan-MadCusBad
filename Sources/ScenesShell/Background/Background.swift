import Igis
import Scenes
import Foundation

/*
 This class is responsible for rendering the background.
 */

class Background : RenderableEntity {
    let fillStyle : FillStyle
    let rectangle : Rectangle

    let audio : Audio 
    
    var didAudio = false
    
    init() {
        // Initialize Objects
        fillStyle = FillStyle(color:Color(.black))
        rectangle = Rectangle(rect:Rect.zero, fillMode:.fill)

        guard let audioURL = URL(string:"https://www.fesliyanstudios.com/soundeffects-download.php?id=5637") else {
            fatalError("Failled to fetch Never Gonna Give You Up")
        }
        audio = Audio(sourceURL:audioURL, shouldLoop:true) 
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        rectangle.rect.size = canvasSize
    }

    override func render(canvas:Canvas) {
        // render the fillstyle modifier before the rectangle object
        canvas.render(fillStyle, rectangle)
        if audio.isReady && !didAudio{
            print("playing Audio")
            audio.mode = .play
            canvas.render(audio)
            didAudio = true
        }
    }
}
