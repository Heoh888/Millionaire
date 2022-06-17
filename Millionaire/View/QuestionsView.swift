//
//  QuestionsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

protocol GameSceneDelegat: AnyObject {
    func didendGame(withResult result: Int, record: Record)
}

struct QuestionsView: View {

    // MARK: - State properties
    @State var question: Int = 0
    @State var showAlert: Bool
    
    // MARK: - State Private properties
    @State private var showMainView = false
    
    // MARK: - Constants
    let observer = Observer()
    
    // MARK: - Properties
    var session: GameSession = Game.shared.session!
    var displayingHints: Bool
    weak var gameDelegat: GameSceneDelegat?
        
    // MARK: - Views
    var body: some View {
        
        session.question.addObserver(observer, options: [.initial, .new, .old]) { questionNew, change in
            question = questionNew
        }
        
        session.alertNotification.addObserver(observer, options: [.new, .old]) { alertNew, change in
            if session.alertNotification.value {
                if showAlert && alertNew {
                    /*
                      TO:DO -  Выплывающее в верху экрана уведомление о том что
                               "Только одну подсказку можно использовать за ход"
                     */
                    print("Alert Show", alertNew)
                }
            }
            if alertNew {
                showAlert = alertNew
            }
        }
        
        return (
            VStack {
                HStack {
                    Text("номер вопроса: \(question + 1)" )
                    Spacer()
                    Text("верных ответов: \(String(format: "%.0f", Double(question) / Double(session.questions.count - 1) * 100)) %" )
                }.padding(15.0)
                
                Text("Твой выигрыш: \(Game.shared.yourWinnings(amount: session.questions[question].amount!))")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                
                VStack(alignment: .center, spacing: 6) {
                    ForEach(1 ..< session.questions.count, id:\.self) { i in
                        WinningAmountCell(checkSum: session.questions[i].status!,
                                          amount: String(session.questions[i].amount!))
                    }
                }
                
                Spacer()
                Text(session.questions[question + 1].question!)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                AnswerButtons(session: session, question: question)
                    .padding()
                
                Spacer()
                
                if displayingHints {
                    ButtonHints(questionNmber: question, session: session)
                        .padding(.bottom, 40)
                }
                
                ZStack {
                    Color.black
                    Button(action: {
                        self.showMainView.toggle()
                        let record = Record(date: Date(),
                                            amount: Game.shared.yourWinnings(amount: session.questions[question].amount!))
                        
                        Game.shared.session?.didendGame(withResult: question, record: record)
                    }) {
                        Text("Завершить игру")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .semibold))
                            .background(.black)
                    }
                    .fullScreenCover(isPresented: $showMainView) {
                        MainView()
                    }
                }
                .background(.black)
                .ignoresSafeArea(.all, edges: .top)
                .frame(height: 100)
                .cornerRadius(30)
                
            }.ignoresSafeArea(.all, edges: .bottom)
            
        )
    }
}
