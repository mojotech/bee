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
    @IBOutlet weak var backspaceButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var foundAnswers = [String]() {
        didSet {
            score = scoreWords(foundAnswers)
            foundAnswerList.text = "\n".join(foundAnswers)
        }
    }
    
    var puzzle :Puzzle! {
        didSet {
            map(zip(optionalLetterButtons, demoPuzzle.optionalLetters)) {
                $0.0.setTitle($0.1, forState: .Normal)
            }
            requiredLetterButton.setTitle(demoPuzzle.requiredLetter, forState: UIControlState.Normal)
            clearCurrentAnswer()
            foundAnswers = []
            score = 0
        }
    }
    
    var score = Int() {
        didSet {
            scoreLabel.text = "\(score)/\(puzzle.possiblePoints)"
        }
    }
    
    func styleLetterButton(button :UIButton) {
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 1
        button.layer.borderColor = button.titleColorForState(.Normal)?.CGColor
        button.backgroundColor = .whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionalLetterButtons.map(styleLetterButton)
        styleLetterButton(requiredLetterButton)
        styleLetterButton(backspaceButton)
        styleLetterButton(submitButton)
        
        puzzle = demoPuzzle
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
}

