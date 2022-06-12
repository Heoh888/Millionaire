//
//  GameSingleton.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 04.06.2022.
//

import Foundation

class Game {
    // MARK: - Properties
    var session: GameSession?
    static let shared = Game()
    
    // MARK: - Private properties
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var records: [Record] = [] {
        didSet {
            recordsCaretaker.save(records: records, key: "records")
        }
    }
    
    
    // MARK: - Initialization
    init(session: GameSession? = nil) {
        self.session = session
        records = recordsCaretaker.retrieveRecords(key: "records")
    }
    
    // MARK: - Functions
    func addRecord(_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
    func checkAmount(questions:[Question], numQuestion: Int) {
        for item in 1...Game.shared.session!.questions.count - 1 {
            Game.shared.session?.questions[item].status = Game.shared.session!.questions[item].number == numQuestion ? true : false
        }
    }
    
    func yourWinnings(amount: Int) -> Int {
        switch amount {
        case 0 ..< 16000:
            return 0
        case 16000 ..< 2500000:
            return 16000
        case 2500000 ..< 20000000:
            return 2500000
        case 20000000:
            return 20000000
        default:
            return 0
        }
    }
    
    func totalAmount(_ record: [Record]) -> Int {
        let total: [Int] = record.map { $0.amount }
        return total.reduce(.zero, +)
    }
}
