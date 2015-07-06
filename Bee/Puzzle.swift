//
//  Puzzle.swift
//  Bee
//
//  Created by Fabian Canas on 6/5/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//


class Puzzle {
    let requiredLetter :String
    let optionalLetters :[String]
    let validWords :[String]
    
    init(requiredLetter: String, optionalLetters: [String], validWords: [String]) {
        self.requiredLetter = requiredLetter
        self.optionalLetters = optionalLetters
        self.validWords = validWords
    }
    
    class func scoreWord(word: String) -> Int {
        return count(Array(Set(word))) == 7 ? 3 : 1
    }
    
    class func scoreWords(words: [String]) -> Int {
        return words.reduce(0, combine: {$0 + scoreWord($1)})
    }
    
    class func validWordLength(word: String) -> Bool {
        return count(word) > 4
    }
    
    func validWord(word: String) -> Bool {
        return contains(Dictionary, word)
    }
    
    func possiblePoints() -> Int {
        return Puzzle.scoreWords(validWords)
    }
}


