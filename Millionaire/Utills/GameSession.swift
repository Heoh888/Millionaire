//
//  GameSession.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 05.06.2022.
//

import Foundation

class GameSession {
    var amounts: [Question] = Question().mock()
}
extension GameSession: GameSceneDelegat {
    func didendGame(withResult result: Int, record: Record) {
        var val = record
        val.correctAnswers = Double(result) / Double(amounts.count - 1) * 100
        Game.shared.addRecord(val)
    }
}
