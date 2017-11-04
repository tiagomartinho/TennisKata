import XCTest

class Game {
    
    private var serverPoints = 0
    
    var score: String {
        return "\(serverPoints):0"
    }
    
    func serverWinsPoint() {
        serverPoints += 15
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
}
