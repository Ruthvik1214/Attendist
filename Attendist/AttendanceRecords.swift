//
//  AttendanceRecords.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/6/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import Firebase
import FirebaseDatabase

func AddRecord(branch: String, id: String, data: NSDictionary) {
    let record = Database.database().reference()
    record.child(branch).child(id).setValue(data)
    
}
func AddAttendanceRecord(date: String, classroomId: String, period: String, teacherId: String, studentId: String) {
    let record = Database.database().reference()
record.child("Attendance").child(date).child(classroomId).child(period).child(teacherId).child(studentId)
}
func DeleteAttendanceRecord(date: String, classroomId: String, period: String) {
    let record = Database.database().reference()
    record.child("Attendance").child(date).child(classroomId).child(period).removeValue()
}
func DeleteRecord(branch: String, id: String) {
    let record = Database.database().reference()
    record.child(branch).child(id).removeValue()
}
