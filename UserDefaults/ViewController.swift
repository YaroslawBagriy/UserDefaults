//
//  ViewController.swift
//  UserDefaults
//
//  Created by Yaroslaw Bagriy on 3/17/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameEntry: UITextField!
    @IBOutlet weak var stateEntry: UITextField!
    @IBOutlet weak var scoreEntry: UITextField!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var defaults = Foundation.UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadSavedData()
        
        nameEntry.delegate = self
        stateEntry.delegate = self
        scoreEntry.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveTapped(_ sender: AnyObject) {
        
        // save data
        
        defaults.set(nameEntry.text, forKey: "savedname")
        defaults.set(stateEntry.text, forKey: "savedstate")
        defaults.set(scoreEntry.text, forKey: "savedscore")
        defaults.synchronize()
        
        // load saved data
        
        loadSavedData()
        
        // dismiss the keyboard
        
        dismissFR()
        
    }
    
    func loadSavedData() {
        
        // load and display the data
        
        if let sname = defaults.object(forKey: "savedname") {
            name.text = "Name: \(sname)"
        }
        
        if let sstate = defaults.object(forKey: "savedstate") {
            state.text = "State: \(sstate)"
        }
        
        if let sscore = defaults.object(forKey: "savedscore") {
            score.text = "Score: \(sscore)"
        }
        
    }
    
    func dismissFR() {
        
        nameEntry.resignFirstResponder()
        stateEntry.resignFirstResponder()
        scoreEntry.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismissFR()
        
    }
    
    
    

}

