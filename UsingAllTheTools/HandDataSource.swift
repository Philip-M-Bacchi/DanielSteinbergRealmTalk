//
//  HandDataSource.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class HandDataSource: DataSource {
    
    init() {
        super.init(dataObject: Hand())
    }
    
    override var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
}
