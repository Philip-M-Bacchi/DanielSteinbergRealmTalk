//
//  DataSource.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    private var hand = Hand()
    
    // Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("We've got a problem buddy.")
        }
        cell.fillWith(card: hand[indexPath.row])
        return cell
    }
    
    // Other TableView Methods
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            hand = hand.deleteCard(atIndex: indexPath.row)
            deleteRowIn(tableView: tableView, atIndexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hand = hand.moveCard(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

    // Abstraction Methods
    public func addItemTo(_ tableView: UITableView) {
        if hand.numberOfCards < 5 {
            hand = hand.addNewCard(atIndex: 0)
            insertTopRowIn(tableView: tableView)
        }
    }
    
    private func insertTopRowIn(tableView: UITableView) {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    private func deleteRowIn(tableView: UITableView, atIndexPath: IndexPath) {
        tableView.deleteRows(at: [atIndexPath], with: .fade)
    }
    
}
