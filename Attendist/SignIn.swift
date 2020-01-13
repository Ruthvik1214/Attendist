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
    
    func didSignIn() {
        while (true) {
            if (signedInUser == ""){
                homepageButton.isHidden = false
            }
            else {
                homepageButton.isHidden = true
            }
            
        }
    }
    @IBOutlet weak var homepageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = 	self
        GIDSignIn.sharedInstance().signIn()
        
        if (signedInUser == ""){
        }
        else {

           self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
       
          
     }
    
    
    
}
