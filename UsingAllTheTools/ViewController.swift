//
//  ViewController.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class HandVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource = DataSource()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // Custom Methods
    @IBAction func addNewCard(_ sender: UIBarButtonItem) {
        dataSource.addItemTo(tableView)
    }
}

