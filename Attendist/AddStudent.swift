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
            let ref = Database.database().reference()
            if studentGrade.text == "" {
                studentGrade.text = "Enter the Student's Grade"
            }
            if studentName.text == "" {
                studentName.text = "Enter the Student's Name"
            }
            if studentID.text == "" {
                studentID.text = "Enter the Student's ID"
            }
            if studentName.text != "Enter the Student's Name" && studentID.text != "Enter the Student's ID" && studentGrade.text != "Enter the Student's Grade" {
                ref.child("Students").child(studentID.text ?? "").child("Name").setValue(studentName.text ?? "")
                ref.child("Students").child(studentID.text ?? "").child("Grade").setValue(studentGrade.text ?? "")
                
                    studentID.text = ""
                    studentName.text = ""
                    studentGrade.text = ""
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                if self.studentID.text == "Enter the Student's ID" {
                    self.studentID.text = ""
                }
                if self.studentName.text == "Enter the Student's Name" {
                    self.studentName.text = ""
                }
                if self.studentGrade.text == "Enter the Student's Grade" {
                    self.studentGrade.text = ""
                }
            }
        
        }
       
}
