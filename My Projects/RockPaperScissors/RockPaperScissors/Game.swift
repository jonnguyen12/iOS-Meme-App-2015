//
//  Game.swift
//  RockPaperScissors
//
//  Created by Phuc Nguyen on 7/21/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import Foundation


enum Game {
    case Rock, Paper, Scissor
    
    
    
    init()
    {
        let random = arc4random() % 3
        
        switch random {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissor
        }
    }
    
    func win(opponent: Game) -> Bool {
        switch (self, opponent) {
        case (.Rock, .Scissor), (.Scissor, .Paper), (.Paper, .Rock):
            return true
        default:
            return false
        }
    }
}

struct Match {
    let player1: Game
    let player2: Game
    
    init(p1: Game, p2: Game) {
        player1 = p1
        player2 = p2
    }
    
    var winner: Game {
        return player1.win(player2) ? player1 : player2
    }
    
    var loser: Game {
        return player1.win(player2) ? player2 : player1
    }
}

extension Game: Printable {
    var description: String {
        switch self  {
        case .Rock:
            return "Rock"
        case .Paper:
            return "Paper"
        case .Scissor:
            return "Scissors"
        }
    }
}