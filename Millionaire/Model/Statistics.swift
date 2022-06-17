//
//  Statistics.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    var correctAnswers: Double?
    let amount: Int
}

struct Question1: Codable {
    var number: Int?
    let question: String?
    var amount: Int?
}

struct Answers1: Codable {
    let item: Int
    let answer: String
    let status: Bool
}
