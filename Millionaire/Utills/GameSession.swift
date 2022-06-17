//
//  GameSession.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 05.06.2022.
//

import Foundation

class GameSession {
    public var orderQuestions: Bool
    public var question: Observable<Int>
    public var fiftyFifty: Observable<Bool>
    public var alertNotification: Observable<Bool>
    public var alertShowNotification: Observable<Bool>
    
    var questions: [Question]

    public init(orderQuestions: Bool,
                question: Int,
                fiftyFifty: Bool,
                alertNotification: Bool,
                alertShowNotification: Bool,
                questions: [Question]) {
        self.orderQuestions = orderQuestions
        self.question = Observable(question)
        self.fiftyFifty = Observable(fiftyFifty)
        self.alertNotification = Observable(alertNotification)
        self.alertShowNotification = Observable(alertShowNotification)
        self.questions = questions
    }
}
extension GameSession: GameSceneDelegat, AnswerButtonsDelegat, HintsButtonsDelegat {
    
    func alertHints(hints value: Bool) {
        alertNotification.value = value
    }
    
    func hintsFiftyFifty(hints value: Bool) {
        fiftyFifty.value = value
    }
    
    func question(correct answers: Int) {
        question.value = answers
    }
    
    func didendGame(withResult result: Int, record: Record) {
        var val = record
        val.correctAnswers = Double(result) / Double(questions.count - 1) * 100
        Game.shared.addRecord(val)
    }
}
