//
//  ViewController.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class HandVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let hand = Hand()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // Default Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        let card = hand.cardAtPosition(index: indexPath.row)
        cell.textLabel?.text = card.rank.description
        cell.textLabel?.textColor = card.color
        cell.detailTextLabel?.text = card.suit.description
        return cell
    }
    
    // Other TableView Methods
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            hand.deleteCardAtIndex(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Custom Methods
    @IBAction func addNewCard(_ sender: UIBarButtonItem) {
        if hand.numberOfCards < 5 {
            hand.addNewCardAtIndex(index: 0)
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        }
    }

}

