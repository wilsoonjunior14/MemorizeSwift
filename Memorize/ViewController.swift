//
//  ViewController.swift
//  Memorize
//
//  Created by Wilson on 13/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playerName: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction
    func redirectToHome(){
        let playerNameProvided = self.playerName?.text
        
        if (playerNameProvided == nil || playerNameProvided?.count  == 0){
            
            let alertController = UIAlertController(title: "Attention", message: "You might provide a valid name, please!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeController.playerNameProvided = self.playerName?.text
        self.navigationController?.pushViewController(homeController, animated: true)
    }

}

