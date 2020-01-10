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


class ViewController: UIViewController {

    @IBOutlet weak var N: UITableView!
    var lis = [""]
    var jis = [""]
    override func viewDidLoad() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        super.viewDidLoad()
    }

//    @IBAction func Hyppo(_ sender: Any) {
//        let oof = Database.database().reference()
//        oof.child("/Students/0001").observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let username = value?["Name"] as? String
//            if (username == "") {
//              self.Y.text = "Hi"
//            }
//            else {
//                self.Y.text = username
//            }
//         // ...
//         }) { (error) in
//           print(error.localizedDescription)
//       }
//
//        oof.child("/Students").observe(.value) { snapshot in
//            for x in snapshot.children{
//                let kalue = snapshot.value as? [String:Any]
//                var kusername = kalue?["Name"] as? String
//                self.jis.append(kusername)
//                print(self.jis)
//
//        }
        
    }

  


