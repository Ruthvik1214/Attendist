//
//  AttendanceType.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/12/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//


import Foundation
import UIKit

class AttendanceType: UIViewController {
    
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
        if selectedClass != "" {
            classLabel.text = "Class: \(selectedClass)"
        }
        else {
            classLabel.text = ""
        }
        
        
    }
    
}
