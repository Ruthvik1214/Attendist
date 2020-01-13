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

func AddStudentToClass(classId: String, teacherId: String, studentId: String)
{
    let record = Database.database().reference()
    record.child("Teachers").child(signedInUser).child("Classes").child(classId).child(studentId)
}
func AddStudentRecord(studentID: String, studentName: String, studentGrade: String){
    let record = Database.database().reference().child("Students").child(studentID)
    record.child("Name").setValue(studentName)
    record.child("Grade").setValue(studentGrade)
}

public func AddTeacherRecord(teacherID: String, teacherName: String) {
    let record = Database.database().reference().child("Teachers").child(teacherID)
    record.child("Name").setValue(teacherName)
}

func AddAttendanceRecord(date: String, classId: String, teacherId: String, studentId: String, value : String)
{
    let record = Database.database().reference()
    record.child("Teachers").child(signedInUser).child("Classes").child(classId).child(studentId).child(date).setValue(value)
}

func DeleteAttendanceRecord(date: String, classroomId: String, period: String) {
    let record = Database.database().reference()
    record.child("Attendance").child(date).child(classroomId).child(period).removeValue()
}
func DeleteRecord(branch: String, id: String) {
    let record = Database.database().reference()
    record.child(branch).child(id).removeValue()
}

struct StudentData {
    let StudentID: String!
    let StudentName: String!
}

struct StudentAttendenceData {
    let StudentID: String!
    let Attendence: String!
}
