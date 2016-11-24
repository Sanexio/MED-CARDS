//
//  Deck.swift
//  MED-CARDS
//
//  Created by SSMD on 19.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import Foundation

// import UIKit
// die Modellklassen sollten keine Abhängigkeit zur UIKit-Bibliothek haben

class Deck: NSObject {
    
    var name: String = ""
    var cards : [Card] = []
    
    
    func createCard(frontText: String, backText: String) -> Card {
        let card = Card()
        card.frontText = frontText
        card.backText = backText
        self.cards.append(card)
        return card
    }
    
    var cardsToLearn : [Card] {
        get {
            return self.cards
        }
    }
    
}
