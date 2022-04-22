import Igis
import Scenes

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */

class InteractionLayer : Layer {
    // let ball = Ball()
    // let leftPaddle = Paddle(position:.left)
    // let rightPaddle = Paddle(position:.right)
    let wall = Walls()

    let player = Player()

    let coin = Coins()
    
    var enableHitTesting = false


    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        
        // We insert our RenderableEntities in the constructor
        // insert(entity:ball, at:.front)
        insert(entity:player, at:.front)

        insert(entity:coin, at:.back)
        
        insert(entity:wall, at:.back)

       
    }

    func touchingWall() {
        for rectangle in wall.levelRectangles{
            if rectangle.rect.containment(target:player.player.boundingRect()).contains(.overlapsRight) && rectangle.rect.containment(target:player.player.boundingRect()).contains(.contact){
                player.direction = 0
                player.player.center += Point(x:5, y:0)
            }
            if rectangle.rect.containment(target:player.player.boundingRect()).contains(.overlapsLeft) && rectangle.rect.containment(target:player.player.boundingRect()).contains(.contact){
                player.direction = 0
                player.player.center += Point(x:-5, y:0)
            }
            if rectangle.rect.containment(target:player.player.boundingRect()).contains(.overlapsBottom) && rectangle.rect.containment(target:player.player.boundingRect()).contains(.contact){
                player.direction = 0
                player.player.center += Point(x:0, y:5)
            }
            if rectangle.rect.containment(target:player.player.boundingRect()).contains(.overlapsTop) && rectangle.rect.containment(target:player.player.boundingRect()).contains(.contact){
                player.direction = 0
                player.player.center += Point(x:0, y:-5)
            }
        }
    }

    
    func touchingCoin() {
        for i in 0...coin.coins.count-1{
            if player.player.boundingRect().containment(target:coin.coins[i].0.boundingRect()).contains(.contact){
                coin.coins[i].1 = false
            }
        }
    }
    override func postCalculate(canvas:Canvas){
        touchingWall()
        touchingCoin()
    }
    /* override func postCalculate(canvas:Canvas) {
        if enableHitTesting {
            let leftPaddleBoundingRect = leftPaddle.boundingRect()
            let rightPaddleBoundingRect = rightPaddle.boundingRect()
            
            let ballBoundingRect = ball.boundingRect()
            
            // calculate the balls position relative to the
            // specified paddle to determine if they have come into contact.
            let leftPaddleHitTest = leftPaddleBoundingRect.containment(target:ballBoundingRect)
            let rightPaddleHitTest = rightPaddleBoundingRect.containment(target:ballBoundingRect)
            
            // If the hit results specify the ball has come into contact
            // with the paddle, we want to change its velocity.
            if leftPaddleHitTest.contains(.contact) && ball.velocityX < 0 {
                ball.velocityX = -ball.velocityX
            } else if rightPaddleHitTest.contains(.contact) && ball.velocityX > 0 {
                ball.velocityX = -ball.velocityX
            }
        }
    }
     */

    
     
}
