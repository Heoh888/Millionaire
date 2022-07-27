//
//  AnswerButtons.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 08.06.2022.
//

import SwiftUI

protocol AnswerButtonsDelegat: AnyObject {
    func question(correct answers: Int)
}

protocol HintsButtonsDelegat: AnyObject {
    func hintsFiftyFifty(hints value: Bool)
}

struct AnswerButtons: View {
    
    // MARK: - Constants
    let observer = Observer()
    let hintsObserver = Game.shared.session!
    
    // MARK: - Properties
    var session: GameSession
    
    // MARK: - State properties
    @State var answer: [Int] = [0, 1, 2, 3]
    @State var question: Int
    
    // MARK: - State private properties
    @State private var showMainView = false
    
    // MARK: - Views
    var body: some View {
        hintsObserver.fiftyFifty.addObserver(observer, options: [.initial, .new, .old]) { hintsFiftyFifty, change in
            answer = fiftyFiftyAnswers(items: hintsFiftyFifty ? 2 : 1,
                                       question: session.questions[question + 1])
        }
        return (
            // TO:DO - переделать
            HStack {
                VStack {
                    ForEach(0 ..< (answer.count == 2 ? 1 : 2), id:\.self) { i in
                        HStack {
                            ForEach(0 ..< 2) { j in
                                Button(action:{
                                    answerButton(answer: answer[i == 0 ? i + j : i + (1 + j)])
                                    session.alertHints(hints: false)
                                    hintsObserver.hintsFiftyFifty(hints: true)
                                    hintsObserver.question(correct: question)
                                }) {
                                    Text(session.questions[question + 1].answerOptions![answer[i == 0 ? i + j : i + (1 + j)]].answer)
                                        .font(.system(size: 17, weight: .semibold))
                                        .padding(.horizontal)
                                        .frame(width: 170, height: 50)
                                        .foregroundColor(.white)
                                        .background(.black)
                                        .cornerRadius(50)
                                }
                                .fullScreenCover(isPresented: $showMainView) {
                                    MainView()
                                }
                            }
                        }
                    }
                }
            }
        )
    }
}

extension AnswerButtons {
    
    // MARK: - Private functions
    /// - Parameter answer option: В это параметр нужно передавать число 0...4, это варианты ответов.
    private func answerButton(answer option: Int) {
        if session.questions[question + 1].answerOptions![option].status {
            Game.shared.checkAmount(questions: session.questions,
                                    numQuestion: question + 1)
            if question < 9 {
                question += 1
                Game.shared.session?.question(correct: question + 1)
            } else {
                self.showMainView.toggle()
                let record = Record(date: Date(),
                                    amount: Game.shared.yourWinnings(amount: session.questions[question].amount!))
                Game.shared.session?.didendGame(withResult: question, record: record)
            }
        } else {
            self.showMainView.toggle()
            let record = Record(date: Date(), amount: 0)
            Game.shared.session?.didendGame(withResult: question, record: record)
        }
    }
    
    private func fiftyFiftyAnswers(items: Int, question: Question) -> [Int] {
        var questionNew: [Int] = []
        for item in question.answerOptions! {
            if item.status {
                questionNew.append(item.item)
            }
        }
        if items == 2 {
            questionNew = [0, 1, 2, 3]
        } else {
            for _ in 0 ..< 1 {
                switch questionNew[0] {
                case 0 :
                    questionNew.append(Int.random(in: 1 ..< 3))
                case 1 :
                    questionNew.append(Int.random(in: 2 ..< 3))
                default:
                    questionNew.append(0)
                }
            }
        }
        return questionNew
    }
}

