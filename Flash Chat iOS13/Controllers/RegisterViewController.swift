//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    
                    self.alert(title: "Error", message: e.localizedDescription, style: .alert)
                } else {
                    //Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
                   }
        }
        
      
    }
    func alert(title: String, message: String, style: UIAlertController.Style) {
              let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
              let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                  
              }
              
              alertController.addAction(action)
              self.present(alertController, animated: true, completion: nil)
          }
    
}
