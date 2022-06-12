//
//  ButtonHints.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import SwiftUI

struct ButtonHints: View {
    
    var questionNmber: Int
    var session: GameSession
    
    @State var fiftyFifty = true
    @State var hallHelp = true
    @State var callFriend = true
    
    @State var showHallHelp: Bool = false
    @State var showCallFriend: Bool = false
    
    @State private var hallHelpDisabled = true
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            
            Button {
                if !session.alertNotification.value {
                    self.fiftyFifty = false
                    session.hintsFiftyFifty(hints: false)
                    session.alertHints(hints: true)
                } else {
                    session.alertHints(hints: true)
                }
            } label: {
                Image(fiftyFifty ? "Fifty-fifty" : "Spent Fifty-fifty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .background(.white)
            }.disabled(!fiftyFifty)
            
            Button {
                if !session.alertNotification.value {
                    self.hallHelp = false
                    self.showHallHelp.toggle()
                    session.alertHints(hints: true)
                } else {
                    session.alertHints(hints: true)
                }
            } label: {
                Image(hallHelp ? "Hall help" : "Spent Hall help")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .background(.white)
            }.sheet(isPresented: $showHallHelp) {
                    HallHelpView(questionNumber: questionNmber, session: session)
            }.disabled(!hallHelp)
            
            Button {
                if !session.alertNotification.value {
                    self.callFriend = false
                    self.showCallFriend.toggle()
                    session.alertHints(hints: true)
                } else {
                    session.alertHints(hints: true)
                }
            } label: {
                Image(callFriend ? "Call a friend" : "Spent Call a friend")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }.sheet(isPresented: $showCallFriend) {
                CallFriendView(answers: session.questions[questionNmber + 1].answerOptions!,
                               question: session.questions[questionNmber + 1].question!)
            }.disabled(!callFriend)
        }
    }
}
