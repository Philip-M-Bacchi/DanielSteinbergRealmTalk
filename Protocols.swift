//
//  Protocols.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
    func insertTopRowIn(tableView: UITableView)
    func deleteRowAt(IndexPath: IndexPath, from tableView: UITableView)
}

extension SourceType {
    func insertTopRowIn(tableView: UITableView) {
        tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .fade)
    }
    
    func deleteRowAt(IndexPath: IndexPath, from tableView: UITableView) {
        tableView.deleteRows(at: [IndexPath], with: .fade)
    }
}
