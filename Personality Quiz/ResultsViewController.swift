//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Lars Dansie on 10/2/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultsDefinitionLabel: UILabel!
    
    

    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in counts[answer.type, default: 0] += 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in return pair1.value > pair2.value
        })
            
        let mostCommonAnswer = frequentAnswersSorted.first!.key
            
            resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultsDefinitionLabel.text = mostCommonAnswer.definition
        
        navigationItem.hidesBackButton = true
    }
}
