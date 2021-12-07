//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Tolga on 16.09.2021.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func makeAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != nil && passwordText.text != nil {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != nil && passwordText.text != nil {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                } else {
                    
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                }
                
            }
            
        }
        
    }
    


}

