//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by James Whitney on 2/8/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history: [RPSMatch]!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func matchDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie"
        } else if (match.p1.defeats(match.p2)) {
            return "Win"
        } else {
            return "Loss"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellID = "historyCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = matchDescription(match)
        cell.detailTextLabel!.text = "\(match.p1) vs \(match.p2)"
        
        return cell
    }
    

    
    

    
}
