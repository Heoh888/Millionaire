//
//  QuestionsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

struct QuestionsView: View {
    
    @State private var showMainView = false
    @State var question: Int = 0
    @State var amounts: [Question] = Question().mock()


    var body: some View {
        VStack {
            Text("Твой выигрыш: 16 000")
                .multilineTextAlignment(.center)
            Spacer()

            VStack(alignment: .center, spacing: 6) {
                ForEach(0 ..< amounts.count) { i in
                    WinningAmountCell(checkSum: amounts[i].status!,
                                      amount: amounts[i].amount!)
                }
            }

            Spacer()
            
            Text(amounts[question].question!)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            HStack {
                VStack {
                    
                    Button(action:{
                        if amounts[question].answerOptions![0].status {
                            amounts = Question().checkAmount(questions: amounts,
                                                             numQuestion: question)
                            if question < 9 {
                                question += 1
                            } else {
                                self.showMainView.toggle()
                            }
                        } else {
                            self.showMainView.toggle()
                        }
                    }) {
                        Text(amounts[question].answerOptions![0].answer)
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
                        if amounts[question].answerOptions![1].status {
                            amounts = Question().checkAmount(questions: amounts,
                                                             numQuestion: question)
                            if question < 9 {
                                question += 1
                            } else {
                                self.showMainView.toggle()
                            }
                        } else {
                            self.showMainView.toggle()
                        }
                    }) {
                        Text(amounts[question].answerOptions![1].answer)
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
                        if amounts[question].answerOptions![2].status {
                            amounts = Question().checkAmount(questions: amounts,
                                                             numQuestion: question)
                            if question < 9 {
                                question += 1
                            } else {
                                self.showMainView.toggle()
                            }
                        } else {
                            self.showMainView.toggle()
                        }
                    }) {
                        Text(amounts[question].answerOptions![2].answer)
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
                        if amounts[question].answerOptions![3].status {
                            amounts = Question().checkAmount(questions: amounts,
                                                             numQuestion: question)
                            if question < 9 {
                                question += 1
                            } else {
                                self.showMainView.toggle()
                            }
                        } else {
                            self.showMainView.toggle()
                        }
                    }) {
                        Text(amounts[question].answerOptions![3].answer)
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
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}


