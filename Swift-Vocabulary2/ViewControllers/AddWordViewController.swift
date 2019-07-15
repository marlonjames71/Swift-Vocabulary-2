//
//  AddWordViewController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController, UITextFieldDelegate {

	var vocabController: VocabularyController?
	
	
	@IBOutlet weak var wordTextField: UITextField!
	@IBOutlet weak var definitionTextView: UITextView!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var cancelButton: UIButton!
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		wordTextField.delegate = self
		wordTextField.resignFirstResponder()
		self.view.endEditing(true)
		addButton.layer.cornerRadius = 20
		definitionTextView.layer.cornerRadius = 12
    }
	
	//: MARK: - IBActions
	
	@IBAction func addButtonPressed(_ sender: UIButton) {
		guard let word = wordTextField.text,
			let definition = definitionTextView.text else { return }
		vocabController?.vocabWords.append(VocabularyWord(word: word, definition: definition))
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
}
