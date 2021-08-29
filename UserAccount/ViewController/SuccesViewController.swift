//
//  SuccesViewController.swift
//  UserAccount
//
//  Created by Hamed Amiry on 26.08.2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SuccesViewController: UIViewController {

    @IBOutlet weak var logOutB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOutButtonTapp(_ sender: Any) {
        do {
            try! Auth.auth().signOut()
            print("user signout")
        }
        catch {
            print("error for sign out")
        }
        
     
    }
}
