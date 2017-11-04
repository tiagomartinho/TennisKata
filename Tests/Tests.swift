import XCTest

class Game {
    let score = "0:0"
}

class Tests: XCTestCase {
    
    func testWhenGameStartsTheScoreIsZero() {
        let game = Game()
        
        XCTAssertEqual("0:0", game.score)
    }
}
