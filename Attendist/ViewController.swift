//
//  ViewController.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 12/12/19.
//  Copyright © 2019 Ruthvik Penubarthi. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

var students = [StudentAttendanceData]() 
var selectedClass = ""
class ViewController: UIViewController {

    @IBOutlet weak var takeAttendance: UIButton!
    @IBOutlet weak var currentAttendance: UIButton!
    @IBOutlet weak var classSegmentedControl: UISegmentedControl!
    @IBOutlet weak var currentClassLabel: UILabel!
    @IBOutlet weak var signOut: UIButton!
    func loadData() {
        let ref = Database.database().reference()
     ref.child("Teachers").child(signedInUser).child("Classes").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            self.classSegmentedControl.insertSegment(withTitle: snapshot.key, at: 0, animated: false)
        })
    }

    @IBAction func segmentChanged(_ sender: Any) {
        takeAttendance.isHidden = false
        currentAttendance.isHidden = false
        selectedClass = classSegmentedControl.titleForSegment(at: classSegmentedControl.selectedSegmentIndex) ?? "1"
        currentClassLabel.text = "Class:  \(selectedClass)"
        Dataloading()
    }    
    
    @IBAction func signOutIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
        signedInUser = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classSegmentedControl.removeAllSegments()
        takeAttendance.isHidden = true
        currentAttendance.isHidden = true
        loadData()
    }
    func Dataloading()
    {
        students = [StudentAttendanceData]()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dataStamp = dateFormatter.string(from: date)
        let dateStampLocal = dataStamp
        
        let ref = Database.database().reference()
    
        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
                   let value = snapshot.value as? NSDictionary
                   let name = value?["Name"] as? String
            var attendance = value?[dateStampLocal] as? String
            if (attendance == nil){
                attendance = "Absent"
            }
            
            students.insert(StudentAttendanceData(StudentID: snapshot.key, StudentName: name, Attendance: attendance), at: 0)
//                   self.tableView.reloadData()
           })
        
//        self.tableView.reloadData()
    }
    
}
