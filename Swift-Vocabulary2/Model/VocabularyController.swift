//
//  VocabularyController.swift
//  Swift-Vocabulary2
//
//  Created by Marlon Raskin on 7/15/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


class VocabularyController {
	var vocabWords: [VocabularyWord]
	
	init() {
		vocabWords = [
					VocabularyWord(word: "API", definition: "The collection of classes, structs, methods, and properties exposed by a library to solve a particular problem. Short for Application Programming Interface."),
					VocabularyWord(word: "Array", definition: "A sequential collection of values of any type, such as an array of names in a band."),
					VocabularyWord(word: "Boolean", definition: "A data type that stores either true of false."),
					VocabularyWord(word: "Class", definition: "A custom data type that can have one or more poreperties and one or more methods. Unlike structs, classes are reference types."),
					VocabularyWord(word: "Constant", definition: "Any named piece of data in your code that may not chgange when your program runs."),
					VocabularyWord(word: "Controller", definition: "A part of your program that handles logic. Part of the Model-View-Controller architecture."),
					VocabularyWord(word: "Data", definition: "A type that holds any kind of binary data."),
					VocabularyWord(word: "Double", definition: "A high-precision floating-point number, such as 3.1 or 3.141592654"),
					VocabularyWord(word: "Enum", definition: #"A set of named values that are easier to remember and safer than just using strings or integers. For example, you might create an enum of directions, using north, south, east, and west - this is much nicer than using 0,1,2 and 3, for example. Short for "enumeration." Pronounced as "ee-numb", but "ee-noom" is an accepted variation."#)
					]
	}
}
