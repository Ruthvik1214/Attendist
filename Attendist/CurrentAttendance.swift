//
//  EditExistingClasses.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/11/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class CurrentAttendance: UITableViewController{
    
    var students = [StudentData]()
    
    var studentAttendences = [StudentAttendenceData]()

//    func showStudentStatus {
//        if
//    }
    
    func loadData() {
        let ref = Database.database().reference()
        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["Name"] as? String
            self.students.insert(StudentData(StudentID: snapshot.key, StudentName: name), at: 0)
            self.tableView.reloadData()
    })
        
        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        self.studentAttendences.insert(StudentAttendenceData(StudentID: snapshot.key, Attendence: value?[dateStamp] as! String), at: 0)
        })
        
        self.tableView.reloadData()
    }
   
    override func viewDidLoad() {
           super.viewDidLoad()
           loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return students.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student1", for: indexPath)
        let ref = Database.database().reference()
        cell.textLabel?.text = students[indexPath.row].StudentName
 

        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
        let value = snapshot.value as? NSDictionary
        if value?[dateStamp] != nil {
            if value?[dateStamp] as! String == "Present" {
                cell.backgroundColor = .green
            }
        }

        self.tableView.reloadData()
    })
    
        return cell
    }
}
