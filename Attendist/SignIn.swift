//
//  SignIn.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/12/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

class SignIn: UIViewController{

    @IBOutlet weak var homepageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = 	self
        GIDSignIn.sharedInstance().signIn()
        
       if signedInUser != "" {

           self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
       
          
     }
    
    
    
}
