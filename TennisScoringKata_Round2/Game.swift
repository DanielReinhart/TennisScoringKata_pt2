//
//  Game.swift
//  TennisScoringKata_Round2
//
//  Created by Daniel Reinhart on 5/19/17.
//  Copyright © 2017 Daniel Reinhart. All rights reserved.
//

//In this iteration, I want to have a class/struct that converts points to "game states". Last iteration, things got confusing because I tried mapping points directly to strings, but that doesnt work when we get into Deuce, adv, and game scenarios
//A single game of tennis can be interpreted as a state machine. Some states include: Pre-Deuce (anything that includes scores other than Deuce, Game, Or Advantage states), Game, Deuce, Adv. server, Adv. receiver, and game
//I want this class to take two Ints, and figure out what the state of the game is. Based on the game state, we can print out a user facing string to tell us what the score is. 
//Pre-Deuce is the trickiest state because it encompasses many combinations of points the logic for that state is: (score1 <= 3 || score2 <= 3) && (score1 != 3 && score2 != 3)
//Determining the state for the rest isnt too difficult. 

import Foundation

class Game {

    func score() -> String {
        return "0 - 0"
    }

}
