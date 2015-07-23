//
//  Puzzle.swift
//  Bee
//
//  Created by Fabian Canas on 6/5/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

let demoPuzzle = Puzzle(
    requiredLetter: "C",
    optionalLetters: ["A","D","F","I","N","O"],
    possiblePoints: 24
)

public struct Puzzle {
    public let requiredLetter :String
    public let optionalLetters :[String]
    public let possiblePoints :Int
    
    public init(requiredLetter: String, optionalLetters: [String], possiblePoints: Int){
        self.requiredLetter = requiredLetter
        self.optionalLetters = optionalLetters
        self.possiblePoints = possiblePoints
    }
    
    public func validWord(word: String) -> Bool {
        var playedLetters = Set(map(word.unicodeScalars) {String.init($0)})
        if playedLetters.remove(requiredLetter) == nil {
            return false
        }
        return validWordLength(word) && playedLetters.isSubsetOf(optionalLetters) && SharedDictionary?.containsWord(word) ?? false
    }
}

public func scoreWord(word: String) -> Int {
    return count(Array(Set(word))) == 7 ? 3 : 1
}

public func scoreWords(words: [String]) -> Int {
    return words.reduce(0, combine: {$0 + scoreWord($1)})
}

public func validWordLength(word: String) -> Bool {
    return count(word) > 4
}
