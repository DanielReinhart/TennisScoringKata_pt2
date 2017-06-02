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

        game.servingPlayerWonPoint()

        XCTAssertEqual(game.score(), "15 - 0")
    }

    func testThatReceivingPlayerWonOnePoint() {
        let game = Game()

        game.receivingPlayerWonPoint()

        XCTAssertEqual(game.score(), "0 - 15")
    }

    func testThatScoreIs30All() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()

        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        XCTAssertEqual(game.score(), "30 - 30")
    }

    func testThatScoreIsDeuce() {

        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()


        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()


        XCTAssertEqual(game.score(), "Deuce")
    }

    func testThatScoreIsAdvServer() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()


        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        game.servingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Adv. Server")
    }

    func testThatScoreIsAdvServerAfterBackAndForthOnePoint() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()


        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        game.servingPlayerWonPoint()

        game.receivingPlayerWonPoint()
        game.servingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Adv. Server")

    }

    func testThatScoreisAdvReceiver() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()


        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        game.receivingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Adv. Receiver")
    }

    func testThatScoreisAdvReceiverAfterBackAndForthOnePoint() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()


        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        game.receivingPlayerWonPoint()

        game.servingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        
        XCTAssertEqual(game.score(), "Adv. Receiver")
    }

    func testThatServerWonGame() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Game - Server")
    }

    func testThatServerWonGameAfterDeuce() {
        let game = Game()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Game - Server")
    }


    func testThatReceiverWonGame() {
        let game = Game()

        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Game - Receiver")
    }

    func testThatReceiverWonGameAfterDeuce() {
        let game = Game()

        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()
        game.servingPlayerWonPoint()

        game.receivingPlayerWonPoint()
        game.receivingPlayerWonPoint()

        XCTAssertEqual(game.score(), "Game - Receiver")
    }


}
