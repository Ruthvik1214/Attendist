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
    

    func loadData()
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
                   let name = value?["Name"] as? String ?? ""
            
            var attendance = value?[dateStampLocal] as? String ?? ""
            if (attendance != "Present"){
                attendance = "Absent"
            }

            students.insert(StudentAttendanceData(StudentID: snapshot.key, StudentName: name, Attendance: attendance), at: 0)
            self.tableView.reloadData()
           })

        self.tableView.reloadData()
    }
   
    override func viewDidLoad() {
           super.viewDidLoad()
           self.tableView.reloadData()
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

        cell.textLabel?.text = students[indexPath.row].StudentName
        
        //cell.backgroundColor = .systemGray
        cell.textLabel?.textColor = .black
        

        if students[indexPath.row].Attendance == "Present"
        {
            cell.backgroundColor = .systemGreen
        }
        
        return cell
    }
}
