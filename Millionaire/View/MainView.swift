//
//  MainView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Private properties
    @State private var showStatisticsView = false
    @State private var questionsView = false
    
    // MARK: - Views
    var body: some View {
        VStack {
            Text("Твои лимоны: \( Game.shared.totalAmount(Game.shared.records)) ")
                .multilineTextAlignment(.center)
                .padding(.top, 50)
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
                self.questionsView.toggle()
                Game.shared.session = GameSession()
            }) {
                Text("Я хочу")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 130, height: 50)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
            }
            .fullScreenCover(isPresented: $questionsView) {
                QuestionsView()
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
