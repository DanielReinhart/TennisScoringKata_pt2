//
//  TennisScoringKata_Round2Tests.swift
//  TennisScoringKata_Round2Tests
//
//  Created by Daniel Reinhart on 5/19/17.
//  Copyright © 2017 Daniel Reinhart. All rights reserved.
//

import XCTest
@testable import TennisScoringKata_Round2

class TennisScoringKata_Round2Tests: XCTestCase {
    
    func testThatScoreIsInitialized() {
        let game = Game()

        XCTAssertEqual(game.score(), "0 - 0")
    }

    func testThatServingPlayerWonOnePoint() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")
        }

        XCTAssertEqual(game.score(), "15 - 0")
    }

    func testThatReceivingPlayerWonOnePoint() {
        let game = Game()

        do {
            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")
        }

        XCTAssertEqual(game.score(), "0 - 15")
    }

    func testThatScoreIs30All() {
        let game = Game()
        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()

            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")
        }

        XCTAssertEqual(game.score(), "30 - 30")
    }

    func testThatScoreIsDeuce() {

        let game = Game()
        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()


            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")
        }

        XCTAssertEqual(game.score(), "Deuce")
    }

    func testThatScoreIsAdvServer() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()


            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.servingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Adv. Server")
    }

    func testThatScoreIsAdvServerAfterBackAndForthOnePoint() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()


            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.servingPlayerWonPoint()

            try game.receivingPlayerWonPoint()
            try game.servingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Adv. Server")

    }

    func testThatScoreisAdvReceiver() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()


            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Adv. Receiver")
    }

    func testThatScoreisAdvReceiverAfterBackAndForthOnePoint() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()


            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.receivingPlayerWonPoint()

            try game.servingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

        } catch {
            XCTFail("Error adding point to game")

        }


        XCTAssertEqual(game.score(), "Adv. Receiver")
    }

    func testThatServerWonGame() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Game - Server")
    }

    func testThatServerWonGameAfterDeuce() {
        let game = Game()

        do {
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()

        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Game - Server")
    }


    func testThatReceiverWonGame() {
        let game = Game()

        do {
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Game - Receiver")
    }

    func testThatReceiverWonGameAfterDeuce() {
        let game = Game()

        do {
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()

            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
        } catch {
            XCTFail("Error adding point to game")

        }

        XCTAssertEqual(game.score(), "Game - Receiver")
    }

    //MARK:- Tougher Cases

    func testThatDeuceLogicIsCorrect() {
        let game = Game()

        do {
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.servingPlayerWonPoint()
            try game.servingPlayerWonPoint()

            XCTAssertEqual(game.score(), "30 - 30")

            try game.receivingPlayerWonPoint()
            XCTAssertEqual(game.score(), "30 - 40")

            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Deuce")

            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Adv. Server")

            try game.receivingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Deuce")

            try game.receivingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Adv. Receiver")

            try game.receivingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Game - Receiver")
        } catch {
            XCTFail("Error adding point to game")
        }
    }

    func testThatGameHasEnded() {
        let game = Game()

        let expectation = XCTestExpectation(description: "hit game error")
        do {
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()
            try game.receivingPlayerWonPoint()

            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Game - Receiver")
            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Game - Receiver")
            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Game - Receiver")
            try game.servingPlayerWonPoint()
            XCTAssertEqual(game.score(), "Game - Receiver")
        } catch GameError.gameEnded {
            expectation.fulfill()
        } catch {
            XCTFail("that shouldnt have happened")
        }

    }
}
