//
//  WordsTableViewController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
