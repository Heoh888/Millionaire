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
        return Question().mock()
    }
}

class RandomDisplayingQuestions: DisplayingQuestionsStrategy {
    func displayingQuestions() -> [Question] {
        let amounts = [1000, 4000, 8000, 16000, 250000,
                       1000000, 2500000, 5000000,
                       10000000, 20000000]
        
        var arr: [Question]  = Question().mock()
        var arr1: [Question] = [arr[0]]
        var numberQuestions = 1
        arr.remove(at: 0)
        arr.shuffle()
        
        
        for i in 0 ..< arr.count {
            arr[i].amount = amounts[i]
            arr[i].number = numberQuestions
            numberQuestions += 1
        }
        
        arr1 = arr1 + arr
        return arr1
    }
}
