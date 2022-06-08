//
//   GameSettingsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import SwiftUI

struct GameSettingsView: View {
    @State var displayingQuestions = false
    @State var displayingHints = false
    
    private var selectedDisplayingQuestions: DisplayingQuestions {
        switch displayingQuestions {
        case true:
            return .random
        case false:
            return .inOrder
        }
    }
    
    private var selecteddisplayingHints: DisplayingQuestions {
        switch displayingHints {
        case true:
            return .random
        case false:
            return .inOrder
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
                Text("Настройки игры")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
            
            HStack {
                Text(displayingQuestions ?
                     "Вопросы идут по порядку" :
                        "Вопросы в рандомном прядке")
                Spacer()
                Button {
                    self.displayingQuestions.toggle()
                } label: {
                    ToggleItem(isOne: displayingQuestions)
                }
            }
            .padding(.top, 40.0)
            .padding()
            
            HStack {
                Text(displayingHints ?
                     "Подсказки включены" :
                        "Подсказки выключинны")
                Spacer()
                Button {
                    self.displayingHints.toggle()
                } label: {
                    ToggleItem(isOne: displayingHints)
                }
            }
            .padding()
            .padding(.bottom)
            Spacer()
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView()
    }
}
