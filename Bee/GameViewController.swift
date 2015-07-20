//
//  GameViewController.swift
//  Bee
//
//  Created by Fabian Canas on 6/5/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var currentAnswer: UILabel!
    @IBOutlet weak var foundAnswerList: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var optionalLetterButtons :[UIButton] = []
    @IBOutlet weak var requiredLetterButton: UIButton!
    
    // Pass this in eventually
    let demoPuzzle = Puzzle(
        requiredLetter: "C",
        optionalLetters: ["A","D","F","I","N","O"],
        possiblePoints: 24
        )
    
    var foundAnswers = [String]() {
        didSet {
            score = scoreWords(foundAnswers)
            foundAnswerList.text = "\n".join(foundAnswers)
        }
    }
    
    var score = Int() {
        didSet {
            scoreLabel.text = "\(score)/\(demoPuzzle.possiblePoints)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        map(zip(optionalLetterButtons, demoPuzzle.optionalLetters)) {
            $0.0.setTitle($0.1, forState: .Normal)
        }

        requiredLetterButton.setTitle(demoPuzzle.requiredLetter, forState: UIControlState.Normal)
        
        clearCurrentAnswer()
        clearFoundAnswers()
        score = 0
    }
    
    @IBAction func enterLetterButton(sender: UIButton) {
        currentAnswer.text = currentAnswer.text! + sender.currentTitle!
    }
    
    @IBAction func backspace(sender: UIButton) {
        let text = currentAnswer.text!
        
        if (count(text) == 0) { return }
        
        currentAnswer.text = text.substringToIndex(text.endIndex.predecessor())
    }
    
    @IBAction func submit(sender: UIButton) {
        let answer = currentAnswer.text!
        
        if validAnswer(answer) {
            foundAnswers.append(answer)
            clearCurrentAnswer()
        }
    }
    
    func validAnswer(answer: String) -> Bool {
        return (!contains(foundAnswers, answer) &&
                demoPuzzle.validWord(answer))
    }
    
    func clearCurrentAnswer() {
        currentAnswer.text = ""
    }
    
    func clearFoundAnswers() {
        foundAnswerList.text = ""
    }
}

