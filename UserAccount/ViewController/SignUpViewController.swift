//
//  SignUpViewController.swift
//  UserAccount
//
//  Created by Hamed Amiry on 26.08.2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    
    func setUpElement() {
        // hide the error label
        errorLabel.alpha = 0
        // style the elements
        Utilities.styleTextField(firstName)
        Utilities.styleTextField(lastName)
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(signUpButton)
    }
    
   // check the fields and validate that the data is correct. if everything is correct, this method return nil. otherwise, it returns the error message.
    func validateFields() -> String? {
        // check that all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        // check if the password is secure
        
//        let cleanedPassword =  password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            //password isn't secure enough
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }
        
        return nil
    }


    @IBAction func signUpButtonTapp(_ sender: Any) {
        // validate the fields
        let error =  validateFields()
        if error != nil {
            errorcheck(error!)
        }
        // create cleaned version of the data
        let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // create the user
        Auth.auth().createUser(withEmail: email , password: password) { authResult, error in
            
            if let error = error {
                // there was an error createing the user
                self.errorcheck("Error creating user\(error.localizedDescription)")
            }else {
                //user was created successfully, now store the first name and last name
                
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname": firstName,
                                                          "lastname":lastName, "uid": authResult!.user.uid ]) { err in
                    if err != nil {
                        self.errorcheck("error saving user data\(String(describing: err?.localizedDescription))")
                    }
                }
                // transition to the home screen

                self.transitionTOhome()
            
            
            }
        }
        
        
    }
    
    func errorcheck(_ massage:String) {
        errorLabel.text = massage
        errorLabel.alpha = 1
    }
    
    func transitionTOhome() {
        
       let homeViewController =  storyboard?.instantiateViewController(identifier: "homeVC") as? SuccesViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    
}
