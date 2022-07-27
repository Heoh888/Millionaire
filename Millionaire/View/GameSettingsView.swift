//
//   GameSettingsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import SwiftUI

struct GameSettingsView: View {
    
    // MARK: - State properties
    @State var displayingQuestions: Bool
    @State var displayingHints: Bool
    
    // MARK: - Private properties
    private let recordsCaretaker = RecordsCaretaker()
    
    // MARK: - Views
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
                    recordsCaretaker.save(records: displayingQuestions, key: "orderQuestions")
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
                    recordsCaretaker.save(records: displayingHints, key: "displayingHints")
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
        GameSettingsView(displayingQuestions: true, displayingHints: true)
    }
}
