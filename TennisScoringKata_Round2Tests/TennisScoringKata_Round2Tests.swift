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

}
