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
	
	var vocabController: VocabularyController? // Might not need
	var vocabWord: VocabularyWord? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet weak var wordTextField: UITextField!
	@IBOutlet weak var definitionTextView: UITextView!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var cancelButton: UIButton!
	@IBOutlet weak var clearButton: UIButton!
	
	
	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		definitionTextView.delegate = self
		wordTextField.delegate = self
		addButton.layer.cornerRadius = 20
		definitionTextView.layer.cornerRadius = 12
		clearButton.isHidden = true
		loadWordObject()
    }
	
	// MARK: - IBActions
	
	@IBAction func addButtonPressed(_ sender: UIButton) {
		guard let word = wordTextField.text,
			let definition = definitionTextView.text else { return }
		if !word.isEmpty && !definition.isEmpty {
			vocabController?.vocabWords.append(VocabularyWord(word: word, definition: definition))
			self.dismiss(animated: true, completion: nil)
		} else if word.isEmpty && definition.isEmpty {
			clearButton.isHidden = false
			definitionTextView.text = "Must enter a word and definition to save."
		} else if word.isEmpty {
			wordTextField.text = "Must enter a word to save."
		} else if definition.isEmpty {
			clearButton.isHidden = false
			definitionTextView.text = "Must enter a definition to save."
		}
	}
	
	
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func clearButtonPressed(_ sender: UIButton) {
		definitionTextView.text = ""
		clearButton.isHidden = true
	}
	
	// MARK: - Helper Functions
	
	func updateViews() {
		loadViewIfNeeded()
		buttonState()
	}
	
	func loadWordObject() {
		guard let word = vocabWord else { return }
		wordTextField.text = word.word
		definitionTextView.text = word.definition
		addButton.setTitle("Save", for: .normal)
	}
	
	func buttonState() {
		if vocabWord != nil {
			addButton.setTitle("Save", for: .normal)
		} else {
			addButton.setTitle("Add Word", for: .normal)
		}
	}
	
//	@IBAction func saveChanges(_ sender: UIButton) {  This probably won't be needed
//
//	}
	
	
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
