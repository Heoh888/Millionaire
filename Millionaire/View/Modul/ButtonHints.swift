//
//  ButtonHints.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import SwiftUI

struct ButtonHints: View {
    
    @State var fiftyFifty = true
    @State var hallHelp = true
    @State var callFriend = true
    
    @State var showHallHelp: Bool = false
    @State var showCallFriend: Bool = false
    
    @State private var hallHelpDisabled = true
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            
            Button {
                self.fiftyFifty = false
                Game.shared.session?.hintsFiftyFifty(hints: false)
            } label: {
                Image(fiftyFifty ? "Fifty-fifty" : "Spent Fifty-fifty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }.disabled(!fiftyFifty)
            
            Button {
                self.hallHelp = false
                self.showHallHelp.toggle()
            } label: {
                Image(hallHelp ? "Hall help" : "Spent Hall help")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }.sheet(isPresented: $showHallHelp) {
                Text("КуКу")
            }.disabled(!hallHelp)
            
            Button {
                self.callFriend = false
                self.showCallFriend.toggle()
            } label: {
                Image(callFriend ? "Call a friend" : "Spent Call a friend")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }.sheet(isPresented: $showCallFriend) {
                Text("КуКу")
            }.disabled(!callFriend)
        }
    }
}

struct ButtonHints_Previews: PreviewProvider {
    static var previews: some View {
        ButtonHints()
    }
}
