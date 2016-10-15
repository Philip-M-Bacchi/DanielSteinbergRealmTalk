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
    private var deck: Deck
    private var cards: [Card]
    
    var numberOfCards: Int {
        return cards.count
    }
    
    init(deck: Deck, cards: [Card]) {
        self.deck = deck
        self.cards = cards
    }
    
    init() {
        self.deck = Deck()
        self.cards = [Card()]
    }
    
    
    //Changing Model Functions
    func card(atIndex: Int) -> Card {
        return cards[atIndex]
    }
    
    func addNewCard(atIndex: Int) -> Hand {
        return insert(card: deck.nextCard(), atIndex: atIndex)
    }
    
    private func insert(card: Card, atIndex index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(card, at: index)
        return Hand(deck:deck, cards: mutableCards)
    }
    
    func deleteCard(atIndex: Int) -> Hand {
        var mutableCards = cards
        mutableCards.remove(at: atIndex)
        return Hand(deck: deck, cards: mutableCards)
    }
    
    func moveCard(fromIndex:Int, toIndex: Int) -> Hand {
        return deleteCard(atIndex: fromIndex).insert(card: cards[fromIndex], atIndex: toIndex)
        //first part returns a new hand, but we still have our original, from which we can grab the card we removed and reinsert it into our new hand at the index we desire
    }
    
    
}
