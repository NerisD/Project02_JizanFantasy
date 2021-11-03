//
//  HeroViewController.swift
//  DimitriSMITH_Project02_JizanFantasy
//
//  Created by Dimitri SMITH on 02/11/2021.
//

import Foundation
import UIKit


class HeroViewController: UIViewController {
    
    @IBOutlet var knightSelected: UIButton!
    @IBOutlet var wizardSelected: UIButton!
    
    
    override func viewDidLoad() {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let challengerVC = segue.destination as! NewChallengerViewController
        
        if segue.identifier == "segueKnight" {
            print("I choose Knight")
            challengerVC.titleButton = "Knight"
        }
        if segue.identifier == "segueWizard" {
            print("I choose Wizard")
            challengerVC.titleButton = "Wizard"
        }
        if segue.identifier == "segueThief" {
            print("I choose Thief")
            challengerVC.titleButton = "Thief"
        }
        
    }
    
    
    
}
