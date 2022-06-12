//
//  CallFriendView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 10.06.2022.
//

import SwiftUI

struct CallFriendView: View {
    
    var answers: [Answers]
    var question: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Званок другу")
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundColor(.white)
                .padding()
                .background(.black)
            Spacer()

            HStack {
                Image("Call a friend")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .padding(.leading)
                
                Text("дзынь-дзынь!... звоним Марку")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
            .padding(.top, 40)
            
            VStack(alignment: .leading) {
                Text("Привет Марк, поскажи пожалуста:  \(Text(question).fontWeight(.bold)) ")
                    .foregroundColor(.black)
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Вот варианты ответов:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(answers[0].answer)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(answers[1].answer)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(answers[2].answer)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(answers[3].answer)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Привет! Я думаю это:  \(Text(answers[Int.random(in: 0..<3)].answer).fontWeight(.bold)) ")
                        .foregroundColor(.black)
                        .padding(.top, 50.0)
                    Spacer()
                }
                .padding()
            }
            Spacer()
            Image("Call a friend")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
        }
    }
}

struct CallFriendView_Previews: PreviewProvider {
    static var previews: some View {
        CallFriendView(answers: Question().mock()[6].answerOptions!,
                       question: Question().mock()[6].question!)
    }
}
