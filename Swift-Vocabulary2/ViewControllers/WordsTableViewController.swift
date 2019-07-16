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
		navigationController?.navigationBar.barStyle = .black
		navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
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
	
	
	//: MARK: - Trailing Action
	
	override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (ac: UIContextualAction, UIView, success) in
			let deleteAlertController = UIAlertController(title: "Are you sure you want to delete this word?", message: nil, preferredStyle: .actionSheet)
			let alertCancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
			let alertDeleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
				self.vocabController.vocabWords.remove(at: indexPath.row)
				self.tableView.reloadData()
			})
			deleteAlertController.addAction(alertDeleteButton)
			deleteAlertController.addAction(alertCancelButton)
			self.present(deleteAlertController, animated: true, completion: nil)
		}
		deleteAction.image = UIImage(named: "icons8-trash-can-30")
		return UISwipeActionsConfiguration(actions: [deleteAction])
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
