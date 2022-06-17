//
//  RecordsCaretaker.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import Foundation

/// - Parameters:
///   - key records: Ключ стотистики рекордов
///   - key orderQuestions: Ключ настроики  отоброжение вопросов.
///   - key displayingHints: Ключ настроики отоброжение подсказок.
///   - key addQuestion: Ключ добовление вопросов.

class RecordsCaretaker {
    
    // MARK: - Private properties
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    // MARK: - Private functions
    func save<T: Encodable>(records: T, key: String) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords(key: String) -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func retrieveQuestion(key: String) -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func retrieveSettings(key: String) -> Bool {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return false
        }
        
        do {
            return try decoder.decode(Bool.self, from: data)
        } catch {
            print(error)
            return false
        }
    }
}
