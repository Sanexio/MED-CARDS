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
    
    
    
    @IBAction func flipRenamed(_ sender: UIButton) {
        
        // btnFlip.setTitle("Flipped", for: .normal)
        
        self.flipped = !self.flipped
        
    }
    // Methode flip verändert den Text des Buttons
    
    private func updateView() {
        updateViewText()
        updateViewButtons()
    }
    
    private func updateViewText() {
        if flipped {
            textView.text = "Rückseite"
        } else {
            textView.text = "Vorderseite"
        }
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
