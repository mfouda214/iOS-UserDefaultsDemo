//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by echessa on 3/15/16.
//  Updated by Mohamed Fouda on 4/8/18.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaults = UserDefaults.standard
        firstNameTextField.text = userDefaults.object(forKey: "FirstName") as? String
        lastNameTextField.text = userDefaults.object(forKey: "LastName") as? String
        ageTextField.text = userDefaults.object(forKey: "Age") as? String
        
        if ((firstNameTextField.text?.isEmpty)!&&(lastNameTextField.text?.isEmpty)!&&(ageTextField.text?.isEmpty)!){
        firstNameTextField.text = "Is Empty"
        lastNameTextField.text = "IS Empty"
        ageTextField.text = "Is Empty"
        }
        userDefaults.synchronize()
    }
    
    @IBAction func saveButtonWasPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(firstNameTextField.text, forKey: "FirstName")
        userDefaults.set(lastNameTextField.text, forKey: "LastName")
        userDefaults.set(ageTextField.text, forKey: "Age")
        
//        userDefaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

