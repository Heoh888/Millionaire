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
