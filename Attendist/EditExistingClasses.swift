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

class EditExistingClasses: UITableViewController {
    
    struct classData {
        let className: String!
    }
    
    var classes = [classData]()
    
    func loadData() {
        let ref = Database.database().reference()
        ref.child("Teacher1").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            let classkey = snapshot.key
            self.classes.insert(classData(className: classkey), at: 0)
            self.tableView.reloadData()
        })
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return classes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Class1", for: indexPath)
        cell.textLabel?.text = classes[indexPath.row].className
        return cell
    }
}

		
