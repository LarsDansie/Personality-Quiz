//
//  Question.swift
//  Personality Quiz
//
//  Created by Lars Dansie on 10/2/23.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var  text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Woof"
        case .cat:
            return "Meow"
        case .rabbit:
            return "What the he*k do rabbits say"
        case .turtle:
            return "like a high-pitched squee sound"
        }
    }
}
