import XCTest

class Game {
    var score = "0:0"
    
    func serverWinsPoint() {
        score = "15:0"
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
