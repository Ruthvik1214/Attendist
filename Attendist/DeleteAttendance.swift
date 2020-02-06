//
//  DeleteAttendance.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/25/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DeleteAttendance: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var studentID: UITextField!

    @IBOutlet weak var deleteAttendance: UIButton!

 
    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func deletingAttendance(_ sender: Any) {
        let ref = Database.database().reference()

            if studentID.text == "" {
                studentID.text = "Enter the Student's ID"
            }
            if studentID.text != "Enter the Student's ID" {
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"
                    let dataStamp = dateFormatter.string(from: date)
                    let dateStampLocal = dataStamp
                    var studentsHere = [String]()
                    for ID in students{
                        studentsHere.append(ID.StudentID)
                    }
                    if studentsHere.contains(studentID.text ?? "") {
                        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).child(studentID.text ?? "").child(dateStampLocal).removeValue()
                        studentID.text = ""
                        }
                    else {
                        studentID.text = "Student is not in this Class"
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                if self.studentID.text == "Enter the Student's ID" {
                    self.studentID.text = ""
                }
                if self.studentID.text == "Student is not in this Class" {
                    self.studentID.text = ""
                }
            }
        
        
    }
}
