//
//  MedcardsModel.swift
//  MED-CARDS
//
//  Created by SSMD on 19.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import Foundation

// import UIKit
// die Modellklassen sollten keine Abhängigkeit zur UIKit-Bibliothek haben

class MedcardsModel: NSObject {
    
    var decks : [Deck] = []
    
    
    func createDeck(name: String) -> Deck {
        let deck = Deck()
        deck.name = name
        self.decks.append(deck)
        return deck
    }
    // erstellt ein neues Deck mit dem übergebenen Namen
    // fügt dieses in die Liste des MedcardsModels ein 
    // und liefert das erzeugte Objekt zurück
    

    override init() {
        super.init()
        self.createKardioDeck()
        self.createGastroDeck()
    }
    // Die Kartenstapel können vom Anwender manuell in die Bibliothek hinzugefügt werden !
    // Die "init-Methode" mit den vorgefertigten Decks wird somit nicht mehr benötigt.

    
    
    @discardableResult func createKardioDeck() -> Deck {
        let deck = createDeck(name: "Kardio-Fragen ↔ Antworten")
        let _ = deck.createCard(frontText: "Frage1", backText: "Antwort1")
        let _ = deck.createCard(frontText: "Frage2", backText: "Antwort2")
        let _ = deck.createCard(frontText: "Frage3", backText: "Antwort3")
        return deck
    }
    @discardableResult func createGastroDeck() -> Deck {
        let deck = createDeck(name: "Gastro-Fragen ↔ Antworten")
        let _ = deck.createCard(frontText: "Frage1", backText: "Antwort1")
        let _ = deck.createCard(frontText: "Frage2", backText: "Antwort2")
        let _ = deck.createCard(frontText: "Frage3", backText: "Antwort3")
        return deck
    }
    // mit @discardableResult wird dem Compiler mitgeteilt,
    // dass der Rückgabewert dieser Methode verworfen werden darf
    
    
    func logModel() {
        for deck in decks {
            NSLog("%@", "Deck \(deck.name)")
            for card in deck.cards {
                NSLog("%@", "- \(card.frontText) ↔ \(card.backText)") }
        }
    }
    // iteriert über alle Deck- und Kartenobjekte und gibt diese mit NSLog auf der Konsole aus
    

}

let medcardsModel = MedcardsModel()

