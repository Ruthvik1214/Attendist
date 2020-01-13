//
//  AddStudent.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/12/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class AddStudent: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var studentID: UITextField!
    @IBOutlet weak var studentGrade: UITextField!
    @IBOutlet weak var studentInformation: UIButton!

    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func submitStudentInformation(_ sender: Any) {
            let ref = Database.database().reference().child("Students").child(studentID.text ?? "1")
            let dict = ["Name":studentName.text,"Grade":studentGrade.text]
            ref.setValue(dict)
        studentID.text = ""
        studentName.text = ""
        studentGrade.text = ""
            
        
        }
       
}
