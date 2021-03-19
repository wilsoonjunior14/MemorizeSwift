//
//  HomeTableViewController.swift
//  Memorize
//
//  Created by Wilson on 16/03/21.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var images = ["football.png", "tennis.png", "volleyball.png"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }

    
}
