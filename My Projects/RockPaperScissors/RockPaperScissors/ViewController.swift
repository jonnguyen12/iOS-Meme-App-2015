//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Phuc Nguyen on 7/20/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!

    @IBOutlet weak var scrissorButton: UIButton!
    
    var match: Match!
    
    
    
    @IBAction func playGame(sender: UIButton) {
        switch sender {
        case rockButton:
            play(Game.Rock)
        case paperButton:
            play(Game.Paper)
        case scrissorButton:
            play(Game.Scissor)
        default:
            println("Unknown button pressed! Check Playgame()")
        }
    }
    
    func play(playerMove: Game) {
        let computerMove = Game()
        
        match = Match(p1: playerMove, p2: computerMove)
        
        //1st way of presenting view controller - programmatically
        if playerMove == Game.Rock {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let resultVC = storyBoard.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
            resultVC.match = match
            presentViewController(resultVC, animated: true, completion: nil)
        }
        
        else if playerMove == Game.Paper {
            performSegueWithIdentifier("throwDownPaper", sender: self)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.match = match
    }
    
    
}

