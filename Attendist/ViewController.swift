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

var selectedClass = ""
class ViewController: UIViewController {

    @IBOutlet weak var takeAttendance: UIButton!
    @IBOutlet weak var currentAttendance: UIButton!
    @IBOutlet weak var classSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var signOut: UIButton!
    func loadData() {
        //var classNames = [String]()
        let ref = Database.database().reference()
     ref.child("Teachers").child(signedInUser).child("Classes").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            self.classSegmentedControl.insertSegment(withTitle: snapshot.key, at: 0, animated: false)
        })
    }
    @IBAction func segmentChanged(_ sender: Any) {
        takeAttendance.isHidden = false
        currentAttendance.isHidden = false
        selectedClass = classSegmentedControl.titleForSegment(at: classSegmentedControl.selectedSegmentIndex) ?? "1"
        print(selectedClass)
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
    
}
