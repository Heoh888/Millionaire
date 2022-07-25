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
    
    // MARK: - Properties
    weak var gameDelegat: GameSceneDelegat?
    @State var question: Int = 0
    var amounts: GameSession = Game.shared.session!
    
    // MARK: - Private properties
    @State private var showMainView = false
    
    // MARK: - Views
    var body: some View {
        VStack {
            Text("Твой выигрыш: \(Game.shared.yourWinnings(amount: amounts.amounts[question].amount!))")
                .multilineTextAlignment(.center)
            Spacer()
            
            VStack(alignment: .center, spacing: 6) {
                ForEach(1 ..< amounts.amounts.count) { i in
                    WinningAmountCell(checkSum: amounts.amounts[i].status!,
                                      amount: String(amounts.amounts[i].amount!))
                }
            }
            
            Spacer()
            Text(amounts.amounts[question + 1].question!)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            HStack {
                VStack {
                    Button(action:{
                        answerButton(answer: 0)
                    }) {
                        Text(amounts.amounts[question + 1].answerOptions![0].answer)
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
                    
                    Button(action:{
                        answerButton(answer: 1)
                    }) {
                        Text(amounts.amounts[question + 1].answerOptions![1].answer)
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
                
                Spacer()
                VStack {
                    Button(action:{
                        answerButton(answer: 2)
                    }) {
                        Text(amounts.amounts[question + 1].answerOptions![2].answer)
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
                    
                    Button(action:{
                        answerButton(answer: 3)
                    }) {
                        Text(amounts.amounts[question + 1].answerOptions![3].answer)
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
            .padding()
            
            Spacer()
            ZStack {
                Color.black
                Button(action: {
                    self.showMainView.toggle()
                    let record = Record(date: Date(),
                                        amount: Game.shared.yourWinnings(amount: amounts.amounts[question].amount!))
                    
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
    }
}

extension QuestionsView {
    
    // MARK: - Private functions
    /// - Parameter answer option: В это параметр нужно передавать число 0...4, это варианты ответов.
    private func answerButton(answer option: Int) {
        if amounts.amounts[question + 1].answerOptions![option].status {
            Game.shared.checkAmount(questions: amounts.amounts,
                                              numQuestion: question + 1)
            if question < 9 {
                question += 1
            } else {
                self.showMainView.toggle()
                let record = Record(date: Date(),
                                    amount: Game.shared.yourWinnings(amount: amounts.amounts[question].amount!))
                Game.shared.session?.didendGame(withResult: question, record: record)
            }
        } else {
            self.showMainView.toggle()
            let record = Record(date: Date(), amount: 0)
            Game.shared.session?.didendGame(withResult: question, record: record)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}


