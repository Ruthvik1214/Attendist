//
//  AddClasses.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/9/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//
import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn



class AddClasses: UIViewController {
    
    @IBOutlet weak var className: UITextField!
    
    @IBOutlet weak var studentID: UITextField!
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var connection: UIButton!
    @IBAction func createdClass(_ sender: Any) {
        let ref = Database.database().reference()
        ref.child("Teacher1").child(className.text ?? "").child(studentID.text ?? "").child("Name").setValue(studentName.text ?? "")
        studentID.text = ""
        studentName.text = ""
    }
    
}
