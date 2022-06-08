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
    
    // MARK: - Constants
    let observer = Observer()
    let questionObserver = Game.shared.session!
    
    // MARK: - Properties
    @State var question: Int = 0
    weak var gameDelegat: GameSceneDelegat?
    var session: GameSession = Game.shared.session!
    var displayingHints = true
    
    // MARK: - Private properties
    @State private var showMainView = false
    
    // MARK: - Views
    var body: some View {
        questionObserver.question.addObserver(observer, options: [.initial, .new, .old]) { questionNew, change in
            question = questionNew
        }
        return (
            VStack {
                Text("Твой выигрыш: \(Game.shared.yourWinnings(amount: session.amounts[question].amount!))")
                    .multilineTextAlignment(.center)
                Spacer()
                
                VStack(alignment: .center, spacing: 6) {
                    ForEach(1 ..< session.amounts.count) { i in
                        WinningAmountCell(checkSum: session.amounts[i].status!,
                                          amount: String(session.amounts[i].amount!))
                    }
                }
                
                Spacer()
                Text(session.amounts[question + 1].question!)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                AnswerButtons(session: session, question: question)
                    .padding()
                
                Spacer()
                
                if displayingHints {
                    ButtonHints()
                        .padding(.bottom, 40)
                }
                
                ZStack {
                    Color.black
                    Button(action: {
                        self.showMainView.toggle()
                        let record = Record(date: Date(),
                                            amount: Game.shared.yourWinnings(amount: session.amounts[question].amount!))
                        
                        Game.shared.session?.didendGame(withResult: question, record: record)
                    }) {
                        Text("Завершить игру")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    .fullScreenCover(isPresented: $showMainView) {
                        MainView()
                    }
                }
                .ignoresSafeArea(.all, edges: .top)
                .frame(height: 100)
                .cornerRadius(30)
            }.ignoresSafeArea(.all, edges: .bottom)
        )
    }
}
