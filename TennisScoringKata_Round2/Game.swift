//
//  Game.swift
//  TennisScoringKata_Round2
//
//  Created by Daniel Reinhart on 5/19/17.
//  Copyright © 2017 Daniel Reinhart. All rights reserved.
//

//In this iteration, I want to have a class/struct that converts points to "game states". Last iteration, things got confusing because I tried mapping points directly to strings, but that doesnt work/gets difficult when we get into Deuce, adv, and game scenarios
//A single game of tennis can be interpreted as a state machine. States include: Pre-Deuce (anything that includes scores other than Deuce, Game, Or Advantage states), Game, Deuce, Adv. server, Adv. receiver, Game server, Game Receiver
//I want this class to take two Ints, and figure out what the state of the game is. Based on the game state, we can print out a user facing string to tell us what the score is. 
//Pre-Deuce is the trickiest state because it encompasses many combinations of points. the logic for that state is: (score1 <= 3 || score2 <= 3) && (score1 != 3 && score2 != 3)
//When in the Pre-Deuce state, we can map 0,1,2,3 points to strings and print out the score using those strings. Anything other than the pre-deuce state has a fixed user-facing string which makes those cases easy

import Foundation

class Game {

    private(set) var servingPlayerTotalPoints: Int = 0
    private(set) var receivingPlayerTotalPoints: Int = 0
    var gameState: GameState = .preDeuce

    let pointsToStringDictionary = [0 : "0", 1: "15", 2: "30", 3: "40"]

    func score() -> String {
        if let gameState =  GameState.evaluateGameState(servingPlayerPoints: servingPlayerTotalPoints, receivingPlayerPoints: receivingPlayerTotalPoints) {

            switch gameState {
            case .preDeuce:
                return "\(pointsToStringDictionary[servingPlayerTotalPoints]!) - \(pointsToStringDictionary[receivingPlayerTotalPoints]!)"
            case .deuce:
                return "Deuce"
            default:
                return "0 - 0"
            }
        } else {
            return "Error Computing Score"
        }
    }

    func servingPlayerWonPoint() {
        servingPlayerTotalPoints += 1
    }

    func receivingPlayerWonPoint() {
        receivingPlayerTotalPoints += 1
    }

}

enum GameState {
    case preDeuce
    case deuce
    case advServer
    case advReceiver
    case game

    static func evaluateGameState(servingPlayerPoints score1: Int, receivingPlayerPoints score2: Int) -> GameState? {
        if (score1 <= 3 || score2 <= 3) && (score1 != 3 && score2 != 3) {
            return .preDeuce
        } else if (score1 == 3 && score2 == 3) {
            return .deuce
        }
        return nil
    }
}
