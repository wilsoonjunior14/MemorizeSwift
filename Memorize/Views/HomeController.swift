//
//  HomeController.swift
//  Memorize
//
//  Created by Wilson on 15/03/21.
//

import UIKit

class HomeController: UITableViewController {
    
    var playerName: String?
    
    @IBOutlet var labelPlayerName: UILabel?
    
    @IBOutlet var buttonsTableView: UITableView?
    
    var tableDataSource = [
    "Animal One", "Animal Two", "Animal Three"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonsTableView?.register(GameViewController.self, forCellReuseIdentifier: "cell")
        
        self.labelPlayerName?.text = self.playerName!
        
        self.buttonsTableView?.delegate = self
        self.buttonsTableView?.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GameViewController = (tableView.dequeueReusableCell(withIdentifier: "cell") as! GameViewController?)!
        cell.leftButton?.setImage(UIImage(named: "football.png"), for: .normal)
        cell.leftButton?.setImage(UIImage(named: "volleyball.png"), for: .normal)
        cell.leftButton?.setImage(UIImage(named: "tennis.png"), for: .normal)
        return cell
    }

}
