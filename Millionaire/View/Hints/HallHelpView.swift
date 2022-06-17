//
//  HallHelpView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 08.06.2022.
//

import SwiftUI

struct HallHelpView: View {
    
    // MARK: - Properties
    var questionNumber: Int
    var session: GameSession
    
    // MARK: - Private properties
    private var voices : [Double] {
            return voicesAudience(question: session.questions[questionNumber + 1])
    }
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .center) {
            Text("Помощь зала")
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundColor(.white)
                .padding()
                .background(.black)
            Spacer()
            
            VStack {
                ForEach(0 ..< 4) { i in
                    VStack(alignment: .leading) {
                        Text(session.questions[questionNumber + 1].answerOptions![i].answer)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .foregroundColor(.black)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: voices[i] , height: 20)
                                .padding(.leading)
                            
                            Spacer()
                            Text("\(String(format: "%.0f", voices[i])) голосов")
                                .padding(.trailing)
                        }
                    }
                    Divider()
                }
                Spacer()
            }.padding(.top, 50.0)
            
            Image("Hall help")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
        }
    }
}
extension HallHelpView {
    
    // MARK: - Functions
    func voicesAudience(question: Question) -> [Double] {
        var totalVotes: Double = 100
        var arr = [0.0, 0.0, 0.0, 0.0]
        for i in 0 ..< question.answerOptions!.count {
            if  question.answerOptions![i].status {
                let random = Double.random(in: 20...100)
                arr[i] = random
                totalVotes -= random
            }
        }
        for i in 0 ..< question.answerOptions!.count {
            if  !question.answerOptions![i].status {
                let random = Double.random(in: 0...totalVotes)
                arr[i] = random
                totalVotes -= random
            }
            if i == question.answerOptions!.count {
                arr[i] = totalVotes
            }
        }
        return arr
    }
}
