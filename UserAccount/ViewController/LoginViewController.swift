//
//  LoginViewController.swift
//  UserAccount
//
//  Created by Hamed Amiry on 26.08.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //hide the lable
        errorLabel.alpha = 0
        
        // style the elements
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(loginButton)

    }

   
    @IBAction func loginButtonTapp(_ sender: Any) {
        
        // create cleaned version of the text field
        
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
        // signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if err != nil {
                // couldn't sign in
                self.errorLabel.text = err?.localizedDescription
                self .errorLabel.alpha = 1
                
            }else  {
            
                self.transitionTOhome()
            }
        }
        
    }
    
    func transitionTOhome() {
        
       let homeViewController =  storyboard?.instantiateViewController(identifier: "homeVC") as? SuccesViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    
}
