//
//  Question.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import Foundation


struct Question {
    let number: Int?
    let question: String?
    let amount: Int?
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

struct Answers {
    let item: Character
    let answer: String
    let status: Bool
}

extension Question {
    
    // MARK: - Functions
    func mock() -> [Question] {
        let question:[Question] = [
            .init(number: 0, question: "", amount: 0, answerOptions: [.init(item: "A", answer: "", status: true)], status: true),
            .init(number: 1,
                  question: "Кто был звездой фильма 1973 года «Затянувшаяся расплата»?",
                  amount: 1000,
                  answerOptions: [.init(item: "A", answer: "Амитабх Баччан", status: true),
                                  .init(item: "В", answer: "Джамаль Малик", status: false),
                                  .init(item: "C", answer: "Старик Хоттабыч", status: false),
                                  .init(item: "D", answer: "Рик Санчис", status: false)], status: false),
            .init(number: 2,
                  question: "На национальной эмблеме Индии изображены три льва. А что написано под ними?",
                  amount: 4000,
                  answerOptions: [.init(item: "A", answer: "Побеждает только истина.", status: true),
                                  .init(item: "B", answer: "Только ложь побеждает.", status: false),
                                  .init(item: "C", answer: "Только гламур побеждает.", status: false),
                                  .init(item: "D", answer: "Побеждают только деньги.", status: false)],
                  status: false),
            .init(number: 3,
                  question: "?",
                  amount: 8000,
                  answerOptions: [.init(item: "A", answer: "?", status: false),
                                  .init(item: "B", answer: "?", status: true),
                                  .init(item: "C", answer: "?", status: false),
                                  .init(item: "D", answer: "?", status: false)],
                  status: false),
            .init(number: 4,
                  question: "На изображениях бога Рамы, что он обычно держит в правой руке?",
                  amount: 16000,
                  answerOptions: [.init(item: "A", answer: "Цветок", status: false),
                                  .init(item: "B", answer: "Меч", status: false),
                                  .init(item: "C", answer: "Дитя", status: false),
                                  .init(item: "D", answer: "Лук и стрелу", status: true)],
                  status: false),
            .init(number: 5,
                  question: "Какой известный индийский поэт написал песню «Явись, Кришна»?",
                  amount: 250000,
                  answerOptions: [.init(item: "A", answer: "Сурдас.", status: true),
                                  .init(item: "B", answer: "Тулсидас", status: false),
                                  .init(item: "C", answer: "Мира Баи", status: false),
                                  .init(item: "D", answer: "Кабир", status: false)],
                  status: false),
            .init(number: 6,
                  question: "Какой американский деятель изображён на 100-долларовой купюре?",
                  amount: 1000000,
                  answerOptions: [.init(item: "A", answer: "Джордж Вашингтон", status: false),
                                  .init(item: "B", answer: "Франклин Рузвельт", status: false),
                                  .init(item: "C", answer: "Бенджамин Франклин", status: true),
                                  .init(item: "D", answer: "Авраам Линкольн", status: false)],
                  status: false),
            .init(number: 7,
                  question: "Кто изобрёл револьвер?",
                  amount: 2500000,
                  answerOptions: [.init(item: "A", answer: "Сэмюэл Кольт", status: true),
                                  .init(item: "B", answer: "Брюс Браунинг", status: false),
                                  .init(item: "c", answer: "Дэн Вессон", status: false),
                                  .init(item: "D", answer: " Джеймс Револьвер", status: false)],
                  status: false),
            .init(number: 8,
                  question: "В каком британском городе находится Кембридж Циркус?",
                  amount: 5000000,
                  answerOptions: [.init(item: "A", answer: "Оксфорд", status: false),
                                  .init(item: "B", answer: "Лидс.", status: false),
                                  .init(item: "C", answer: "Кембридж", status: false),
                                  .init(item: "D", answer: "Кембридж", status: true)],
                  status: false),
            .init(number: 9,
                  question: "Какой игрок в крикет набрал самое большое число очков в истории?",
                  amount: 10000000,
                  answerOptions: [.init(item: "A", answer: "Сачин Тендулкар", status: false),
                                  .init(item: "B", answer: "Рикки Понтинг", status: false),
                                  .init(item: "C", answer: "Майкл Слэйтер", status: false),
                                  .init(item: "D", answer: "Джек Хоббс", status: true)],
                  status: false),
            .init(number: 10,
                  question: "Двух мушкетёров в романе Александра Дюма «Три мушкетёра» звали Атос и Портос. Как звали третьего?",
                  amount: 20000000,
                  answerOptions: [.init(item: "A", answer: "Арамис", status: true),
                                  .init(item: "B", answer: "Кардинал Ришелье", status: false),
                                  .init(item: "C", answer: "д’Артаньян", status: false),
                                  .init(item: "D", answer: "Планше", status: false)],
                  status: false)
        ]
        return question
    }
}
