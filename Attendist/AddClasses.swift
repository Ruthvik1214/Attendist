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
    @IBOutlet weak var classNamesSegmentControl: UISegmentedControl!
    @IBOutlet weak var connection: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func loadData() {
        //var classNames = [String]()
        let ref = Database.database().reference()
     ref.child("Teachers").child(signedInUser).child("Classes").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            self.classNamesSegmentControl.insertSegment(withTitle: snapshot.key, at: 0, animated: false)
        })
    }
    @IBAction func segmentChanged(_ sender: Any) {
        className.text = classNamesSegmentControl.titleForSegment(at: classNamesSegmentControl.selectedSegmentIndex) ?? "1"
    }	
    @IBAction func createdClass(_ sender: Any) {
        let ref = Database.database().reference()
        ref.child("Teachers").child(signedInUser).child("Classes").child(className.text ?? "").child(studentID.text ?? "").child("Name").setValue(studentName.text ?? "")
        studentID.text = ""
        studentName.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        classNamesSegmentControl.removeAllSegments()
        loadData()
    }
}
