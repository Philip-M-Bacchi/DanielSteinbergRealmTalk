//
//  CardCell.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillWith(card: Card) {
        rankLabel.textColor = card.color
        rankLabel.text = card.rank
        suitLabel.text = card.suit
    }
}
