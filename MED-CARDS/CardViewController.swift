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
    // Fügen Sie dazu dem CardViewController eine Eigenschaft card hinzu 
    // und verwenden Sie einen didSet-Block, um die Darstellung zu aktualisieren, 
    // wenn ein Card-Objekt gesetzt wird
    
    var cards : [Card] = [] {
        didSet {
            self.card = cards.first
        }
    }
    // Fügen Sie eine weitere Eigenschaft cards hinzu und setzen 
    // Sie dem Controller die erste Karte, wenn eine Liste von Lernkarten gesetzt wird
    
    
    
    @IBAction func flipRenamed(_ sender: UIButton) {
        
        // btnFlip.setTitle("Flipped", for: .normal)
        
        self.flipped = !self.flipped
        
    }
    // Methode flip verändert den Text des Buttons
    
    private func updateView() {
        
        if isViewLoaded {
            updateViewText()
            updateViewButtons()
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
    

/*    override func loadView() {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.yellow
        
        btnFlip = UIButton(type: .system)
        
        btnFlip = UIButton(type: UIButtonType.system)
        btnFlip.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btnFlip.setTitle("Flip", for: UIControlState.normal)
        view.addSubview(btnFlip)
        
        // Hinweis: Die Verwendung von absoluten Koordinaten geschieht hier 
        // zunächst der Einfachheit halber. Später werden AutoLayout-Constraints 
        // verwendet, so dass die Positionierung unabhängig von der Bildschirmgröße wird.
        
        // btnFlip.addTarget(self, action: #selector(flip), for: .touchUpInside)
        
        self.view = view
    }
    // das View wird nicht mehr programmatisch erzeugt, sondern aus dem Storyboard geladen 
*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
