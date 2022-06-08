//
//  DisplayingQuestionsStrategy.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import Foundation

protocol DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question]
}

class InOrderDisplayingQuestions: DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question] {
        return Game.shared.session!.amounts
    }
}

class RandomDisplayingQuestions: DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question] {
        return Game.shared.session!.amounts
    }
}

class HintsAreDisabled: DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question] {
        return Game.shared.session!.amounts
    }
}

class HintsAreIncluded: DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question] {
        return Game.shared.session!.amounts
    }
}
