//
//  GameSession.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 05.06.2022.
//

import Foundation

class GameSession {
    var amounts: [Question] = Question().mock()
    public var question: Observable<Int>
    public var fiftyFifty: Observable<Bool>
    
    public init(question: Int, fiftyFifty: Bool) {
        self.question = Observable(question)
        self.fiftyFifty = Observable(fiftyFifty)
    }
}
extension GameSession: GameSceneDelegat, AnswerButtonsDelegat, HintsButtonsDelegat {
    func hintsFiftyFifty(hints value: Bool) {
        fiftyFifty.value = value
    }
    
    func question(correct answers: Int) {
        question.value = answers
    }
    
    func didendGame(withResult result: Int, record: Record) {
        var val = record
        val.correctAnswers = Double(result) / Double(amounts.count - 1) * 100
        Game.shared.addRecord(val)
    }
}
