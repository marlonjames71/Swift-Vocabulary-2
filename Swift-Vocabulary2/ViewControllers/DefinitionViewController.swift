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
	
	
	// MARK: - Lifecycle
	
	var vocabWord: VocabularyWord? {
		didSet {
			updateViews()
		}
	}
	
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
}

