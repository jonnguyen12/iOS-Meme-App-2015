//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Phuc Nguyen on 7/24/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var history: [RPSMatch]!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as! UITableViewCell
        
        let match = history[indexPath.row]
        
        cell.textLabel?.text = "Winner is " + match.winner.description + ", and loser is " + match.loser.description
        
        return cell
    }
    @IBAction func goBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
