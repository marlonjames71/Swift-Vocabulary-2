//
//  ViewController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

	// MARK: - Outlets
	
	@IBOutlet weak var definitionTextView: UITextView!
	@IBOutlet weak var editButton: UIBarButtonItem!
	
	var vocabController: VocabularyController? //Might not need
	var vocabWord: VocabularyWord? {
		didSet {
			updateViews()
		}
	}
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	
	// MARK: - Methods
	
	func updateViews() {
		guard let vocabWord = vocabWord else { return }
		loadViewIfNeeded()
		title = vocabWord.word
		definitionTextView.text = vocabWord.definition
		
	}
	
	@IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
		guard let addWordVC = storyboard?.instantiateViewController(withIdentifier: "addWord") as? AddWordViewController else { return }
		guard let vocabWordUnwrapped = vocabWord else { return }
		addWordVC.vocabWord = vocabWordUnwrapped
		present(addWordVC, animated: true)
	}
	
}

