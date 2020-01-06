//
//  ViewController.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 12/12/19.
//  Copyright © 2019 Ruthvik Penubarthi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var Exit: UIButton!
    override func viewDidLoad() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        super.viewDidLoad()
    }
    
}

