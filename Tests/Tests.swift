import XCTest

class Game {
    
    private var serverPoints = 0
    private var receiverPoints = 0

    var score: String {
        return "\(serverPoints):\(receiverPoints)"
    }
    
    func serverWinsPoint() {
        serverPoints += 15
    }
    
    func receiverWinsPoint() {
        receiverPoints += 15
    }
}

class Tests: XCTestCase {
    
    func testWhenGameStartsTheScoreIsZero() {
        let game = Game()
        
        XCTAssertEqual("0:0", game.score)
    }
    
    func testWhenServerWinsPoint() {
        let game = Game()
        
        game.serverWinsPoint()

        XCTAssertEqual("15:0", game.score)
    }
    
    func testWhenReceiverWinsPoint() {
        let game = Game()
        
        game.receiverWinsPoint()
        
        XCTAssertEqual("0:15", game.score)
    }
}
