//
//  Hand.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

class Deck {
    // Some Deck Model
    func nextCard() -> Card {
        return Card()
    }
}

class Card {
   // Some Card Model
    let color: UIColor = .red
    let rank: String = "Ace"
    let suit: String = "Hearts"
}

class Hand {
    
    // Properties
    private let deck = Deck()
    private var cards: [Card] = [Card()]
    
    var numberOfCards: Int {
        return cards.count
    }
    
    //Changing Model Functions
    func cardAtPosition(index: Int) -> Card {
        return cards[index]
    }
    
    func addNewCardAtIndex(index: Int) {
        insert(card: deck.nextCard(), atIndex: index)
    }
    
    private func insert(card: Card, atIndex index: Int) {
        cards.insert(card, at: index)
    }
    
    func deleteCardAt(index: Int) {
        cards.remove(at: index)
    }
    
    func moveCardFrom(index:Int, toIndex: Int) {
        let cardToMove = cards[index]
        deleteCardAt(index: index)
        insert(card: cardToMove, atIndex: toIndex)
    }
    
    
}
