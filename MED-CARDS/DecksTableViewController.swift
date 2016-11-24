//
//  DecksTableViewController.swift
//  MED-CARDS
//
//  Created by SSMD on 24.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import UIKit

class DecksTableViewController: UITableViewController {
    
    var decks : [Deck] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return decks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckCell", for: indexPath)

        // cell.textLabel?.text = "Zelle \(indexPath.section).\(indexPath.row)"
        
        let deck = decks[indexPath.row]
        
        cell.textLabel?.text = deck.name
        
        if indexPath.row > 0 && indexPath.row % 50 == 0 {
            cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 159.0/255.0, blue: 215.0/255.0, alpha: 1)
            // cell.backgroundColor = .rgb(8,159,215)
        } else {
            cell.backgroundColor = .white
        }

        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDeck" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for:cell)!
            let deck = decks[indexPath.row]
            let controller = segue.destination as! CardViewController
            controller.cards = deck.cardsToLearn
        }
    }
    // Überschreiben Sie die Methode prepareForSegue in der DecksTableViewController-Klasse, 
    // so dass dem CardViewController der Kartenstapel gesetzt wird. 
    // Der ausgewählte Kartenstapel kann über die Zelle, die als sender übergeben wird, ermittelt werden.
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        decks = medcardsModel.decks
        self.tableView.reloadData()
    }

}
