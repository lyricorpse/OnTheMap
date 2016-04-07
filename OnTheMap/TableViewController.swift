//
//  TableViewController.swift
//  OnTheMap
//
//  Created by Feng Zhu on 3/29/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func unwindToRoot(segue: UIStoryboardSegue) {
        print("successfully unwound")
    }
    
    @IBAction func logout(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func refresh(sender: UIBarButtonItem) {
        print("refresh data")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
