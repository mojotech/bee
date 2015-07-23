//
//  PuzzleTests.swift
//  Bee
//
//  Created by Fabian Canas on 7/23/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

import UIKit
import XCTest
import Bee

class PuzzleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testScoreWord() {
        XCTAssertEqual(scoreWord("asdfg"), 1, "Five-unique-letter words are worth 1")
        XCTAssertEqual(scoreWord("asdfghj"), 3, "Seven-unique-letter words are worth 3")
        XCTAssertEqual(scoreWord("asdfghh"), 1, "Seven-letter words with six unique letters are worth 1")
    }
    
    func testValidWordLength() {
        XCTAssertTrue(validWordLength("12345"), "Five letter words are valid")
        XCTAssertFalse(validWordLength("1234"), "Four letter words are invalid")
    }

    func testPuzzleValidWord() {
        let puzzle :Puzzle = Puzzle(
            requiredLetter: "C",
            optionalLetters: ["A","D","F","I","N","O"],
            possiblePoints: 24
        )

        XCTAssertTrue(puzzle.validWord("ACIDIC"), "Valid word")
        
        XCTAssertFalse(puzzle.validWord("ACID"), "Short words are invalid")
        XCTAssertFalse(puzzle.validWord("PENCIL"), "Words need to use puzzle's letters")
        XCTAssertFalse(puzzle.validWord("ACCCCCCC"), "Words must be words")
        
        // XCTAssertTrue(SharedDictionary.containsWord("FONDA"), "")
        XCTAssertFalse(puzzle.validWord("FONDA"), "Real words must use required letter")
    }
}
