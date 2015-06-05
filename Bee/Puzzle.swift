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
    
    let validWords :Set<String>
    
    let goodThreshold :Int
    let excellentThreshold :Int
    let geniusThreshold :Int
    
    let possiblePoints :Int
    
    func tryWord(word: String) -> Result {
        // TODO
        // 1 . are the word's letters contained in [req + opt]
        // 2 . is this in the dictionary?
        return validWords.contains(word) ? .Valid(word: word) : .Invalid
    }
}

enum Result {
    case Invalid
    case Valid(word: String)
}

struct Session {
    let puzzle :Puzzle
    var moves :[String]
    
}

extension String {
    var score :Int {
        get {
            return Set(self.componentsSeparatedByString("")).count == 7 ? 3 : 1
        }
    }
}

