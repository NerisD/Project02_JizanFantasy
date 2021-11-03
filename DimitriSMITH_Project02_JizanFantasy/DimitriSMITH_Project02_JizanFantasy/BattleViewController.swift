//
//  ViewController.swift
//  DimitriSMITH_Project02_JizanFantasy
//
//  Created by Dimitri SMITH on 02/11/2021.
//

import UIKit

class BattleViewController: UIViewController {
    
    
    // This part for the Boss
    
    @IBOutlet var bosseName: UILabel!
    @IBOutlet var bossImage: UIImageView!
    @IBOutlet var bossLP: UILabel!
    @IBOutlet var bossDF: UILabel!
    @IBOutlet var bossPD: UILabel!
    @IBOutlet var bossWD: UILabel!
    @IBOutlet var bossSC: UILabel!
    
    // This part for the New Challenger
    
    @IBOutlet var challengerName: UILabel!
    @IBOutlet var challengerImage: UIImageView!
    @IBOutlet var challengerLP: UILabel!
    @IBOutlet var challengerDF: UILabel!
    @IBOutlet var challengerPD: UILabel!
    @IBOutlet var challengerWD: UILabel!
    @IBOutlet var challengerSC: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToBattleViewController (segue: UIStoryboardSegue) {
        
        print("Unwind To Battle View Controller")
        
    }
    
    @IBAction func addNewChallenger(_ sender: Any) {
        
        performSegue(withIdentifier: "segueNewChallenger", sender: self)
    }
    


}

