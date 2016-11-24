//
//  DecksTableViewController.swift
//  MED-CARDS
//
//  Created by SSMD on 24.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import UIKit

class DecksTableViewController: UITableViewController {
    
    let decks = medcardsModel.decks

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
        
        // return 1000
        
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


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

}
