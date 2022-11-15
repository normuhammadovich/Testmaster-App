//
//  MainVC.swift
//  Testmaster-App
//
//  Created by Chingiz Jumanov on 13/11/22.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var progressCountLbl: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet var optionsImage: [UIImageView]!
    
    @IBOutlet var optionBackground: [UIView]!
    
    @IBOutlet var optionsLbl: [UILabel]!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet var optionsBtn: [UIButton]!
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    var questionCount = 0
    var trueAns = 0
    var questions: [QuestionDM] = [
        
        QuestionDM(question: "A- Hello, what ______ your name?", options: ["is", "are", "am", "be"], answer: "is"),
        QuestionDM(question: "______ name is John. And my ______ is Johnson.", options: ["Your / surname", "My / surname", "I/surname", "I/name"], answer: "My / surname"),
        QuestionDM(question: "My name is Lisa. ______ Lisa Peterson.", options: ["My am", "I is", "I am", "I"], answer: "I am"),
        QuestionDM(question: "______ name is Apple. ______ Ann Apple.", options: ["His / She", "His / He's", "Her / She's", "His / His"], answer: "His / He's"),
        QuestionDM(question: "“Where ______ John from?” “______ from the US.”", options: ["is / He's", "is / His", "am / He's", "is / She's"], answer: "is / He's")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        progress.progress = 0

        
    }
    
    func setQuestion() {
        resultView.isHidden = true
        let quiz = questions[questionCount]
        questionLbl.text = quiz.question
        for i in 0...3 {
            optionsLbl[i].text = quiz.options[i]
        }
        optionsImage[0].image = UIImage(named: "a-option")
        optionsImage[1].image = UIImage(named: "b-option")
        optionsImage[2].image = UIImage(named: "c-option")
        optionsImage[3].image = UIImage(named: "d-option")
        for optBack in optionBackground {
            optBack.backgroundColor = .white
        }
        
        for lbl in optionsLbl {
            lbl.textColor = .black
        }
        continueBtn.isEnabled = false
        progressCountLbl.text = "\(questionCount)/\(questions.count)"
        
        for btn in optionsBtn {
            btn.isEnabled = true
        }
        
    }
    
    
    
    @IBAction func optionTapped(_ sender: UIButton) {
        
        if questions[questionCount].options[sender.tag] != questions[questionCount].answer {
            
            optionsImage[sender.tag].image = UIImage(named: "false-option")
            optionBackground[sender.tag].backgroundColor = .red
            optionsLbl[sender.tag].textColor = .white
            
            for i in 0...3 {
                if questions[questionCount].options[i] == questions[questionCount].answer {
                    optionsImage[i].image = UIImage(named: "true-option")
                    optionBackground[i].backgroundColor = .green
                    optionsLbl[i].textColor = .white
                }
            }
            
        } else {
            optionsImage[sender.tag].image = UIImage(named: "true-option")
            optionBackground[sender.tag].backgroundColor = .green
            optionsLbl[sender.tag].textColor = .white
            trueAns += 1
        }
        
        continueBtn.isEnabled = true
        for btn in optionsBtn {
            btn.isEnabled = false
        }
    }


    @IBAction func continueTapped(_ sender: Any) {
        
        progress.progress += 0.2
        
        if questionCount < 4 {
            questionCount += 1
            setQuestion()
        } else if questionCount == 4{
            progressCountLbl.text = "\(questionCount+1)/\(questions.count)"
            resultView.isHidden = false
            //continueBtn.setTitle("Restart", for: .normal)
            //questionCount += 1
        } else {
            resultView.isHidden = true
            questionCount = 0
            continueBtn.setTitle("Continue", for: .normal)
            setQuestion()
        }


    }
    
}
