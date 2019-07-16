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
	
//	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//		return " "
//	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let word = vocabController.vocabWords[indexPath.row]
		let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
			let deleteController = UIAlertController(title: "Are you sure you want to delete \"\(word.word)\" from your list?", message: nil, preferredStyle: .actionSheet)
			let deleteOption = UIAlertAction(title: "Delete", style: .destructive, handler: { (delete) in
				self.vocabController.vocabWords.remove(at: indexPath.row)
				let header = tableView.headerView(forSection: 0)
				tableView.deleteRows(at: [indexPath], with: .fade)
				header?.textLabel?.text = self.tableView(tableView, titleForHeaderInSection: 0)
				self.dismiss(animated: true, completion: nil)
			})
			let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: { (dismiss) in
				self.dismiss(animated: true, completion: nil)
			})
			deleteController.addAction(deleteOption)
			deleteController.addAction(cancelOption)
			self.present(deleteController, animated: true, completion: nil)
		}
		
		return [deleteAction]
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
