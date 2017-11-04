import XCTest

class Game {
    
    private var serverPoints = 0
    private var receiverPoints = 0

    var score: String {
        return "\(serverPoints):\(receiverPoints)"
    }
    
    func serverWinsPoint() {
        serverPoints = winsPoint(currentPoint: serverPoints)
    }
    
    func receiverWinsPoint() {
        receiverPoints = winsPoint(currentPoint: receiverPoints)
    }
    
    private func winsPoint(currentPoint: Int) -> Int {
        var points = currentPoint
        points += 10
        if points < 40 {
            points += 5
        }
        return points
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
    
    func testWhenGameIsOnTieReceiverWinsPoint() {
        // Arrange, Given
        let game = Game()
        game.serverWinsPoint()
        game.receiverWinsPoint()

        // Act, When
        game.receiverWinsPoint()
        
        // Assert, Then
        XCTAssertEqual("15:30", game.score)
    }
    
    func testThirdPoint() {
        let game = Game()
        game.serverWinsPoint()
        game.receiverWinsPoint()
        game.serverWinsPoint()
        game.receiverWinsPoint()
        XCTAssertEqual("30:30", game.score)

        game.serverWinsPoint()
        
        XCTAssertEqual("40:30", game.score)
    }
    
    func testThirdPointReceiver() {
        let game = Game()
        game.serverWinsPoint()
        game.receiverWinsPoint()
        game.serverWinsPoint()
        game.receiverWinsPoint()
        XCTAssertEqual("30:30", game.score)
        
        game.receiverWinsPoint()
        
        XCTAssertEqual("30:40", game.score)
    }
}
