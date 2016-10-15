//
//  Hand.swift
//  UsingAllTheTools
//
//  Created by Sam on 10/14/16.
//  Copyright © 2016 SWillsea. All rights reserved.
//

import UIKit

struct Deck {
    // Some Deck Model
    func nextCard() -> Card {
        return Card()
    }
}

struct Card {
   // Some Card Model
    let color: UIColor = .red
    let rank: String = "Ace"
    let suit: String = "Hearts"
}

struct Hand {
    
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
    
    mutating func addNewCardAtIndex(index: Int) {
        insert(card: deck.nextCard(), atIndex: index)
    }
    
    private mutating func insert(card: Card, atIndex index: Int) {
        cards.insert(card, at: index)
    }
    
    mutating func deleteCardAt(index: Int) {
        cards.remove(at: index)
    }
    
    mutating func moveCardFrom(index:Int, toIndex: Int) {
        let cardToMove = cards[index]
        deleteCardAt(index: index)
        insert(card: cardToMove, atIndex: toIndex)
    }
    
    
}
