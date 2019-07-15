//
//  WordsTableViewController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

	let vocabController = VocabularyController()
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		tableView.reloadData()
	}
    override func viewDidLoad() {
        super.viewDidLoad()
//		navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "flying-birds400.png"), for: .compact)
    }

    // MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if vocabController.vocabWords.count > 1 {
			return "You have \(vocabController.vocabWords.count) words in your list"
		} else {
			return "You have \(vocabController.vocabWords.count) word in your list"
		}
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabController.vocabWords.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
		let vocabWord = vocabController.vocabWords[indexPath.row]
		cell.textLabel?.text = vocabWord.word

        return cell
    }

	
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDefinitionSegue" {
			guard let indexPath = tableView.indexPathForSelectedRow,
				let definitionVC = segue.destination as? DefinitionViewController else { return }
			let word = vocabController.vocabWords[indexPath.row]
			definitionVC.vocabWord = word
		} else if segue.identifier == "AddWordSegue" {
			guard let addWordVC = segue.destination as? AddWordViewController else { return }
			addWordVC.vocabController = vocabController
		}
    }
}
