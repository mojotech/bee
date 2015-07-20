//
//  Dictionary.swift
//  Bee
//
//  Created by Joel Hawksley on 7/6/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

import Foundation

struct WordDictionary {
    let words :Set<String>
    init(wordListURL: NSURL) {
        let string = String(contentsOfURL: wordListURL, encoding: NSUTF8StringEncoding, error: nil)!
        
        let scanner = NSScanner(string: string)
        var scannedString :NSString? = nil
        var set = Set<String>(minimumCapacity: 142158)
        
        while scanner.scanUpToString(" ", intoString: &scannedString) {
            map(scannedString) { set.insert($0 as String) }
        }
        words = set
    }
    
    func containsWord(word: String) -> Bool {
        return words.contains(word)
    }
}

var SharedDictionary :WordDictionary?

class DictionaryProxy :NSObject {
    override func awakeFromNib() {
        super.awakeFromNib()
        SharedDictionary = WordDictionary(wordListURL: NSBundle.mainBundle().URLForResource("words", withExtension: "txt")!)
    }
}
