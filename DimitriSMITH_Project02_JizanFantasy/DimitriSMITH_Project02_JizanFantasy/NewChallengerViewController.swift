//
//  NewChallengerViewController.swift
//  DimitriSMITH_Project02_JizanFantasy
//
//  Created by Dimitri SMITH on 02/11/2021.
//

import Foundation
import UIKit

class Hero {
    var name: String
    var point: Int
    var lifePoint: Int
    var defend: Int
    var powerDamage: Int
    var weapondDamage: Int
    
    init(name: String, point: Int, lifePoint: Int, defend: Int, powerDamage: Int, weapondDamage: Int){
        self.name = name
        self.point = point
        self.lifePoint = lifePoint
        self.defend = defend
        self.powerDamage = powerDamage
        self.weapondDamage = weapondDamage
    }
}

class Knight: Hero {
    
    //DF max 20
    //PD max 30
    //WD max 40
    //SC = 100
    
    var increaseWD = false
    var specialDamage = 100
    
    //LP + 5 now and WD + 10 for next time you use it
    func knightSE () {
        self.lifePoint += 5
        increaseWD = true
    }
}

class Wizard: Hero {
    
    var incrasePD = false
    var specialDamage = 50
    
    //LP + 35 now and PD + 10 for next time use it
    func wizardSE () {
        self.lifePoint += 35
        incrasePD = true
    }
}

class Thief: Hero {
    
    var incraseWD = false
    var specialDamage = 75
    
    //LP + 5 now and WD + 35 for next time use it
    func thiefSE () {
        self.lifePoint += 5
        incraseWD = true
    }
    
}


class NewChallengerViewController: UIViewController {
    
    @IBOutlet var selectedHeroButton: UIButton!
    
    @IBOutlet var challengerNameTextField: UITextField!
    
    @IBOutlet var defendSlider: UISlider!
    @IBOutlet var powerDamageSlider: UISlider!
    @IBOutlet var weaponDamageSlider: UISlider!
    
    
    
    @IBOutlet var challengerSCLabel: UILabel!
    @IBOutlet var challengerDistributePoints: UILabel!
    @IBOutlet var lifePointLB: UILabel!
    
    var challengerName = ""
    var challengerPoint = 0
    var challengerLP = 0
    var challengerDF = 0
    var challengerPD = 0
    var challengerWD = 0
    var challengerSC = 0
    
    var myKnight: Knight = Knight(name: "", point: 250, lifePoint: 0, defend: 0, powerDamage: 0, weapondDamage: 0)
    var myWizard: Wizard = Wizard(name: "", point: 245, lifePoint: 0, defend: 0, powerDamage: 0, weapondDamage: 0)
    var myThief: Thief = Thief(name: "", point: 210, lifePoint: 0, defend: 0, powerDamage: 0, weapondDamage: 0)
    
    var titleButton = "Select Your Hero !"
    
    override func viewDidLoad() {
        
        challengerNameTextField.delegate = self
        selectedHeroButton.setTitle(titleButton, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if (titleButton == "Knight") {
            challengerPoint = myKnight.point
            challengerDistributePoints.text = String(myKnight.point)
            challengerSCLabel.text = String(myKnight.specialDamage)
            challengerSC = myKnight.specialDamage
            defendSlider.maximumValue = 20
            powerDamageSlider.maximumValue = 30
            weaponDamageSlider.maximumValue = 40
        }
        if (titleButton == "Wizard") {
            challengerPoint = myWizard.point
            challengerDistributePoints.text = String(myWizard.point)
            challengerSCLabel.text = String(myWizard.specialDamage)
            challengerSC = myWizard.specialDamage
            defendSlider.maximumValue = 15
            powerDamageSlider.maximumValue = 70
            weaponDamageSlider.maximumValue = 20
        }
        if (titleButton == "Thief") {
            challengerPoint = myThief.point
            challengerDistributePoints.text = String(myThief.point)
            challengerSCLabel.text = String(myThief.specialDamage)
            challengerSC = myThief.specialDamage
            defendSlider.maximumValue = 25
            powerDamageSlider.maximumValue = 15
            weaponDamageSlider.maximumValue = 30
        }
        
    }
    
    

    @IBAction func valueForDF(_ sender: UISlider) {
        challengerDF = Int(sender.value)
    }
    @IBAction func valueForPD(_ sender: UISlider) {
        challengerPD = Int(sender.value)
    }
    @IBAction func valueForWD(_ sender: UISlider) {
        challengerWD = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "segueSelectHero") {
            
            //let heroVC = segue.destination as! HeroViewController
            
        }else {
            
            let battleVC = segue.destination as! BattleViewController
                
            battleVC.challengerName.text = challengerName
            battleVC.challengerLP.text = String(challengerLP)
            battleVC.challengerDF.text = String(challengerDF)
            battleVC.challengerPD.text = String(challengerPD)
            battleVC.challengerWD.text = String(challengerWD)
            battleVC.challengerSC.text = String(challengerSC)
            
        }

        
    }
    
    
    @IBAction func selectHero(_ sender: Any) {
        
        performSegue(withIdentifier: "segueSelectHero", sender: self)
        
        
    }
    
    
    
    
    @IBAction func createNewHero(_ sender: Any) {
        
        //performSegue(withIdentifier: "segueGoFight", sender: self)
        
    }
    
    @IBAction func saveFighter(_ sender: UIButton) {
        
        challengerLP = challengerPoint - challengerDF - challengerPD - challengerWD - challengerSC
        lifePointLB.text = String(challengerLP)
        print("My Hero --> LP:\(challengerLP), DF:\(challengerDF), PD:\(challengerPD), WD:\(challengerWD) SC:\(challengerSC)")
    }
    
    
    
    
    
}



extension NewChallengerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        challengerName = challengerNameTextField.text!
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Tag text Field \(textField.tag)")
    }
    
    
    
}
