//
//  AddWordViewController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

	// MARK: - Outlets & Properties
	
	var vocabController: VocabularyController?
	
	@IBOutlet weak var wordTextField: UITextField!
	@IBOutlet weak var definitionTextView: UITextView!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var cancelButton: UIButton!
	
	
	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		definitionTextView.delegate = self
		wordTextField.delegate = self
		addButton.layer.cornerRadius = 20
		definitionTextView.layer.cornerRadius = 12
    }
	
	// MARK: - IBActions
	
	@IBAction func addButtonPressed(_ sender: UIButton) {
		guard let word = wordTextField.text,
			let definition = definitionTextView.text else { return }
		vocabController?.vocabWords.append(VocabularyWord(word: word, definition: definition))
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
	
	// MARK: - Helper Functions
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		if text == "\n" {
			textView.resignFirstResponder()
			return false
		}
		return true
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
