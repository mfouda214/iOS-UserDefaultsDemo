//
//  ShowUserDetailsViewController.swift
//  UserDefaultsDemo
//
//  Created by Mohamed Sobhi  Fouda on 4/8/18.
//  Copyright © 2018 CareerFoundry. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let userDefaults = UserDefaults.standard
        
        let firstName = userDefaults.object(forKey: "FirstName") as? String
        let lastName = userDefaults.object(forKey: "LastName") as? String
        let age = userDefaults.object(forKey: "Age") as? String
        
        if ((firstName?.isEmpty)! || (lastName?.isEmpty)! || (age?.isEmpty)!){
            ShowText.text = ""
        } else {
            ShowText.text = "First Name: \(firstName ?? "") \nLast Name: \(lastName ?? "") \nAge : \(age ?? "")"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ShowText: UITextView!
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

