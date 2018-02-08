//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by James Whitney on 2/8/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

// MARK: - HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Class Properties
    
    var history: [RPSMatch]!
    
    // MARK: Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of elements in history array
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Assign cell reuse identifier to variable
        let CellID = "historyCell"
        // Reuse table view cells to display new elements when possible
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        // Create rows of cells with data from history array
        let match = self.history[(indexPath as NSIndexPath).row]
        
        // Assign match results as text for TableView cells
        cell.textLabel!.text = "\(match.p1) vs \(match.p2)"
        cell.detailTextLabel!.text = matchDescription(match)
        
        // Return the populated data for each cell
        return cell
    }
    
    // This function takes match history and returns a string represnting a Win, Loss, or Tie
    func matchDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie"
        } else if (match.p1.defeats(match.p2)) {
            return "Win"
        } else {
            return "Loss"
        }
    }
    
    // MARK: Action
    
    // Dismiss HistoryViewController so initial view is presented
    @IBAction func dismissHistory(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
