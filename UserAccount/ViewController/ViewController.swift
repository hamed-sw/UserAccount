//
//  ViewController.swift
//  UserAccount
//
//  Created by Hamed Amiry on 26.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
    }
    
    func  setUpElement() {
        
        Utilities.styleFilledButton(signUp)
        Utilities.styleFilledButton(login)
        
    }
        



}

