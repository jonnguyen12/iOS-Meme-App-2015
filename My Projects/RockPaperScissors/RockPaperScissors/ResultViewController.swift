//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Phuc Nguyen on 7/21/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var match: Match!
    
    func resultString(match: Match) -> String {
        return match.player1.win(match.player2) ? "You win!" : "You lose!"
    }
    
    func victoryModeString(action: Game) -> String {
        switch action {
        case .Rock:
            return "crushes"
        case .Scissor:
            return "cuts"
        case .Paper:
            return "covers"
        }
    }
    var picture: UIImage!
    
    @IBAction func playAgain(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        label.text = messageForMatch(match)
        imageView.image = imageForMatch(match)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            self.imageView.alpha = 1
        })
    }
    
    func messageForMatch(match: Match) -> String {
        if match.player1 == match.player2 {
            label.text = "It's a tie"
        }
        
        return  match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func imageForMatch(match: Match) -> UIImage {
        var name = ""
        switch match.winner {
            case .Rock:
                name = "RockCrushesScissors"
        case .Paper:
            name = "PaperCoversRock"
        case .Scissor:
            name = "ScissorsCutPaper"

        }
        
        if match.player1 == match.player2 {
            name = "itsATie"
        }
        
        return UIImage(named: name)!
        
    }
}
