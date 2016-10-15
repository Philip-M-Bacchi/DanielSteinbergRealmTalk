//
//  DataSource.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {
    
    var dataObject: DataType = Hand()
    var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }
    
    // Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "CardCell", bundle: Bundle.main), forCellReuseIdentifier: "cardCell")

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("We've got a problem buddy.")
        }
        guard let hand = dataObject as? Hand else {
            fatalError("Could not create Card Cell or Hand Instance")
        }
        
        cell.fillWith(card: hand[indexPath.row])
        return cell
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
