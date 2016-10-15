//
//  DataSource.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
    var dataObject: DataType { get set }
    var conditionForAdding: Bool { get }
    
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
    
    public func addItemTo(_ tableView: UITableView) {
        if conditionForAdding {
            dataObject = dataObject.addNewItem(atIndex: 0)
            insertTopRowIn(tableView: tableView)
        }
    }
}


class DataSource: NSObject, UITableViewDataSource, SourceType {
    
    init(dataObject: DataType) {
        self.dataObject = dataObject
    }
    
    var dataObject: DataType
    var conditionForAdding: Bool {
        return false // You will never be able to add anything unless your subclass overrides. Nice!
    }
    
    // Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("The subclass must implement this function")
    }
    
    // Other TableView Methods
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            dataObject = dataObject.deleteItem(atIndex: indexPath.row)
            deleteRowAt(IndexPath: indexPath, from: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataObject = dataObject.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

}
