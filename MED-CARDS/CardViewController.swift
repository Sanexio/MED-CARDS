//
//  CardViewController.swift
//  MED-CARDS
//
//  Created by SSMD on 19.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var btnFlip: UIButton!
    
    @IBOutlet weak var btnWrong: UIButton!
    
    @IBOutlet weak var btnCorrect: UIButton!
    
    @IBAction func wrong(_ sender: Any) {
        showNextCard()
    }

    @IBAction func correct(_ sender: Any) {
        showNextCard()
    }
    
    private var flipped = false {
        didSet {
            updateView()
        }
    }
    
    var card : Card? {
        didSet {
            updateView()
        }
    }
    // Verwendung eines didSet-Block, um die Darstellung zu aktualisieren,
    // wenn ein Card-Objekt gesetzt wird
    
    var cards : [Card] = [] {
        didSet {
            self.card = cards.first
        }
    }
    // Fügen Sie eine weitere Eigenschaft cards hinzu und setzen 
    // Sie dem Controller die erste Karte, wenn eine Liste von Lernkarten gesetzt wird
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func flipRenamed(_ sender: UIButton) {
        
        // btnFlip.setTitle("Flipped", for: .normal)
        
        self.flipped = !self.flipped
        
    }
    // Methode flip verändert den Text des Buttons
    
    func showNextCard() {
        if let card = self.card, let index = cards.index(of:card), cards.indices.contains(index + 1) {
            // Nächste Lernkarte:
            self.card = cards[index + 1]
            self.flipped = false
            
        } else {
            // Letzte Lernkarte:
            // ViewController vom Navigations-Stapel entfernen
            let _ = self.navigationController?.popViewController(animated:true)
        }
    }
    // Implementation der Methode showNextCard, die die Position der
    // aktuellen Lernkarte im Kartenstapel ermittelt und zur nächsten
    // Lernkarte wechselt, sofern noch Karten verbleiben.
    
    private func updateViewNavTitle() {
        if let card = self.card, let index = cards.index(of:card) {
            self.navigationItem.title = "\(index + 1) von \(cards.count)"
        }
    }
    // aktuelle Position im Kartenstapel wird als Titel gesetzt.
    
    private func updateView() {
        
        if isViewLoaded {
            updateViewText()
            updateViewButtons()
            updateViewNavTitle()
        }
        // Modelleigenschaften können auch vor dem Laden des Views gesetzt werden. 
        // Mit der UIViewController-Methode isViewLoaded wird geprüft, ob das View bereits geladen wurde
        
        
        /* Alternativ kann das Swift-Statement "guard" verwendet werden,
         mit dem eine Vorbedingung für nachfolgenden Code geprüft werden kann
         - der Compiler erzwingt, dass der nachfolgende Code nicht ausgeführt wird,
         wenn die Bedingung nicht gegeben ist 
         (ohne das return im else-Block würde der Code nicht compilieren):
         
         guard isViewLoaded else {
         return
         }
         */
    }
    
    private func updateViewText() {
        
        textView.text = flipped ? card?.backText : card?.frontText
        
        /*
        Sttt bisher mit einem if-Statement wird die Zuweisung des Textes 
        im Beispiel oben mit einem konditionalen Ausdruck verkürzt geschrieben.
 
        if flipped {
            textView.text = "Rückseite"
        } else {
            textView.text = "Vorderseite"
        }
        */
    }
    
    private func updateViewButtons() {
        btnWrong.isHidden = !flipped
        btnFlip.isHidden = flipped
        btnCorrect.isHidden = !flipped
    }
}
