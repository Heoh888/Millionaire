//
//  Question.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import Foundation


struct Question: Codable {
    var number: Int?
    let question: String?
    var amount: Int?
    let answerOptions: [Answers]?
    var status: Bool?
    
    // MARK: - Initialization
    init(number: Int? = nil,
         question: String? = nil,
         amount: Int? = nil,
         answerOptions: [Answers]? = nil,
         status: Bool? = nil) {
        self.number = number
        self.question = question
        self.amount = amount
        self.answerOptions = answerOptions
        self.status = status
    }
}

struct Answers: Codable {
    let item: Int
    let answer: String
    let status: Bool
}

extension Question {
    
    // MARK: - Functions
    func mock() -> [Question] {
        let question:[Question] = [
            .init(number: 0, question: "", amount: 0, answerOptions: [.init(item: 0, answer: "", status: true)], status: true),
            .init(number: 1,
                  question: "Кто был звездой фильма 1973 года «Затянувшаяся расплата»?",
                  amount: 1000,
                  answerOptions: [.init(item: 0, answer: "Амитабх Баччан", status: true),
                                  .init(item: 1, answer: "Джамаль Малик", status: false),
                                  .init(item: 2, answer: "Старик Хоттабыч", status: false),
                                  .init(item: 3, answer: "Рик Санчис", status: false)], status: false),
            .init(number: 2,
                  question: "На национальной эмблеме Индии изображены три льва. А что написано под ними?",
                  amount: 4000,
                  answerOptions: [.init(item: 0, answer: "Побеждает только истина.", status: true),
                                  .init(item: 1, answer: "Только ложь побеждает.", status: false),
                                  .init(item: 2, answer: "Только гламур побеждает.", status: false),
                                  .init(item: 3, answer: "Побеждают только деньги.", status: false)],
                  status: false),
            .init(number: 3,
                  question: "?",
                  amount: 8000,
                  answerOptions: [.init(item: 0, answer: "?", status: false),
                                  .init(item: 1, answer: "?", status: true),
                                  .init(item: 2, answer: "?", status: false),
                                  .init(item: 3, answer: "?", status: false)],
                  status: false),
            .init(number: 4,
                  question: "На изображениях бога Рамы, что он обычно держит в правой руке?",
                  amount: 16000,
                  answerOptions: [.init(item: 0, answer: "Цветок", status: false),
                                  .init(item: 1, answer: "Меч", status: false),
                                  .init(item: 2, answer: "Дитя", status: false),
                                  .init(item: 3, answer: "Лук и стрелу", status: true)],
                  status: false),
            .init(number: 5,
                  question: "Какой известный индийский поэт написал песню «Явись, Кришна»?",
                  amount: 250000,
                  answerOptions: [.init(item: 0, answer: "Сурдас.", status: true),
                                  .init(item: 1, answer: "Тулсидас", status: false),
                                  .init(item: 2, answer: "Мира Баи", status: false),
                                  .init(item: 3, answer: "Кабир", status: false)],
                  status: false),
            .init(number: 6,
                  question: "Какой американский деятель изображён на 100-долларовой купюре?",
                  amount: 1000000,
                  answerOptions: [.init(item: 0, answer: "Джордж Вашингтон", status: false),
                                  .init(item: 1, answer: "Франклин Рузвельт", status: false),
                                  .init(item: 2, answer: "Бенджамин Франклин", status: true),
                                  .init(item: 3, answer: "Авраам Линкольн", status: false)],
                  status: false),
            .init(number: 7,
                  question: "Кто изобрёл револьвер?",
                  amount: 2500000,
                  answerOptions: [.init(item: 0, answer: "Сэмюэл Кольт", status: true),
                                  .init(item: 1, answer: "Брюс Браунинг", status: false),
                                  .init(item: 2, answer: "Дэн Вессон", status: false),
                                  .init(item: 3, answer: " Джеймс Револьвер", status: false)],
                  status: false),
            .init(number: 8,
                  question: "В каком британском городе находится Кембридж Циркус?",
                  amount: 5000000,
                  answerOptions: [.init(item: 0, answer: "Оксфорд", status: false),
                                  .init(item: 1, answer: "Лидс.", status: false),
                                  .init(item: 2, answer: "Кембридж", status: false),
                                  .init(item: 3, answer: "Кембридж", status: true)],
                  status: false),
            .init(number: 9,
                  question: "Какой игрок в крикет набрал самое большое число очков в истории?",
                  amount: 10000000,
                  answerOptions: [.init(item: 0, answer: "Сачин Тендулкар", status: false),
                                  .init(item: 1, answer: "Рикки Понтинг", status: false),
                                  .init(item: 2, answer: "Майкл Слэйтер", status: false),
                                  .init(item: 3, answer: "Джек Хоббс", status: true)],
                  status: false),
            .init(number: 10,
                  question: "Двух мушкетёров в романе Александра Дюма «Три мушкетёра» звали Атос и Портос. Как звали третьего?",
                  amount: 20000000,
                  answerOptions: [.init(item: 0, answer: "Арамис", status: true),
                                  .init(item: 1, answer: "Кардинал Ришелье", status: false),
                                  .init(item: 2, answer: "д’Артаньян", status: false),
                                  .init(item: 3, answer: "Планше", status: false)],
                  status: false)
        ]
        return question
    }
}

