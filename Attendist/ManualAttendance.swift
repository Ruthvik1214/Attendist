//
//  ManualAttendance.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/6/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//

import Foundation
import UIKit

class ManualAttendance: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
