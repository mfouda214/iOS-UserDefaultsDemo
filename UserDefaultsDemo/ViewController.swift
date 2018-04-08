//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by echessa on 3/15/16.
//  Updated by Mohamed Fouda on 4/8/18.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate  {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func saveButtonWasPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(firstNameTextField.text, forKey: "FirstName")
        userDefaults.set(lastNameTextField.text, forKey: "LastName")
        userDefaults.set(ageTextField.text, forKey: "Age")
        
        // MARK - reset textFields
        
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        ageTextField.text = ""
        
//        userDefaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowUserDetails(_ sender: Any) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "InformationViewController")
        
        viewController.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = viewController.popoverPresentationController!
        popover.barButtonItem = sender as? UIBarButtonItem
        popover.delegate = self
        present(viewController, animated: true, completion:nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(ViewController.dismissViewController))
        navigationController.topViewController?.navigationItem.rightBarButtonItem = doneButton
        return navigationController
        
    }
    
    @objc func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ResetUserDetails(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Confirm?", message: "Confirm Reset action, please!", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            print("User tapped Cancel")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
            print("User tapped Yes")
            
            // MARK - reset textFields
            
            self.firstNameTextField.text = ""
            self.lastNameTextField.text = ""
            self.ageTextField.text = ""
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(self.firstNameTextField.text, forKey: "FirstName")
            userDefaults.set(self.lastNameTextField.text, forKey: "LastName")
            userDefaults.set(self.ageTextField.text, forKey: "Age")
        
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(yesAction)
        
        // solve iPad Alerts view
        alertController.popoverPresentationController?.sourceRect = (sender as AnyObject).frame
        alertController.popoverPresentationController?.sourceView = view
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}

