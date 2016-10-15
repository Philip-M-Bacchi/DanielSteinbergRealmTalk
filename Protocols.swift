//
//  Protocols.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
    var dataObject: DataType { get set }
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

protocol DataType {
    var numberOfItems: Int { get }
    func addNewItem(atIndex: Int) -> Self
    func deleteItem(atIndex: Int) -> Self
    func moveItem(fromIndex: Int, toIndex: Int) -> Self
}
