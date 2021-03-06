//
//  MainView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - State private properties
    @State private var showStatisticsView = false
    @State private var showQuestionsView = false
    @State private var showGameSettingsView = false
    @State private var showAddingQuestionView = false
    
    // MARK: - Private properties
    private let recordsCaretaker = RecordsCaretaker()
    private var questions: [Question] {
        switch recordsCaretaker.retrieveSettings(key: "orderQuestions") {
        case true : return InOrderDisplayingQuestions().displayingQuestions()
        case false : return RandomDisplayingQuestions().displayingQuestions()
        }
    }
    
    // MARK: - Views
    var body: some View {
        VStack {
            HStack {
                Button(action:{
                    self.showAddingQuestionView.toggle()
                }) {
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showAddingQuestionView) {
                    AddingQuestionView()
                }
                Spacer()
                
                Button(action:{
                    self.showGameSettingsView.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showGameSettingsView) {
                    GameSettingsView(displayingQuestions: recordsCaretaker.retrieveSettings(key: "orderQuestions"),
                                     displayingHints: recordsCaretaker.retrieveSettings(key: "displayingHints"))
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.top)
            
            Text("Твои лимоны: \( Game.shared.totalAmount(Game.shared.records)) ")
                .multilineTextAlignment(.center)
                .padding()
                .padding()
            
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .padding(.all)
            
            Text("Кто хочет стать лиммонером?")
                .padding(.all)
                .font(.system(size: 20, weight: .regular))
            
            Button(action:{
                self.showQuestionsView.toggle()
                Game.shared.session = GameSession(orderQuestions: recordsCaretaker.retrieveSettings(key: "orderQuestions"),
                                                  question: 0,
                                                  fiftyFifty: true,
                                                  alertNotification: false,
                                                  alertShowNotification: false,
                                                  questions: questions)
            }) {
                Text("Я хочу")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 130, height: 50)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
            }
            .fullScreenCover(isPresented: $showQuestionsView) {
                QuestionsView(showAlert: false, displayingHints: recordsCaretaker.retrieveSettings(key: "displayingHints"))
            }
            .padding(.all)
            
            Spacer()
            Button(action:{
                self.showStatisticsView.toggle()
            }) {
                Text("Статистика")
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $showStatisticsView) {
                StatisticsView()
            }
            .padding(.all)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
