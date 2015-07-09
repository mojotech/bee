//
//  Puzzle.swift
//  Bee
//
//  Created by Fabian Canas on 6/5/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//


struct Puzzle {
    let requiredLetter :String
    let optionalLetters :[String]
    let possiblePoints :Int
    
    func validWord(word: String) -> Bool {
        var playedLetters = Set(map(word.unicodeScalars) {String.init($0)})
        if playedLetters.remove(requiredLetter) == nil {
            return false
        }
        return validWordLength(word) && playedLetters.isSubsetOf(optionalLetters) && SharedDictionary?.containsWord(word) ?? false
    }
}

func scoreWord(word: String) -> Int {
    return count(Array(Set(word))) == 7 ? 3 : 1
}

func scoreWords(words: [String]) -> Int {
    return words.reduce(0, combine: {$0 + scoreWord($1)})
}

func validWordLength(word: String) -> Bool {
    return count(word) > 4
}
