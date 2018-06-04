//
//  DeckLibraryTableViewController.swift
//  MED-CARDS
//
//  Created by SSMD on 24.11.16.
//  Copyright © 2016 Sanexio. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:Any]

class DeckLibraryTableViewController: UITableViewController {
    
    var downloads = [JSONDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return downloads.count
    }
    
    func updateView() {
        let url = Bundle.main.url(forResource: "sets", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let jsonObject = try! JSONSerialization.jsonObject(with: data)
        let json = jsonObject as! JSONDictionary
        self.downloads = json["sets"] as! [JSONDictionary]
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckDownloadCell" , for: indexPath)
        let download = downloads[indexPath.row]
        cell.textLabel?.text = download["title"] as? String

        return cell
    }

}
