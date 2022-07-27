//
//  Adding Question.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 12.06.2022.
//

import SwiftUI

struct AddingQuestionView: View {
    
    // MARK: - State properties
    @StateObject var question = TFManager(maxLimitNum: 100)
    @StateObject var answer1 = TFManager(maxLimitNum: 20)
    @StateObject var answer2 = TFManager(maxLimitNum: 20)
    @StateObject var answer3 = TFManager(maxLimitNum: 20)
    @StateObject var answer4 = TFManager(maxLimitNum: 20)
        
    // MARK: - Views
    var body: some View {
        VStack(alignment: .center) {
            Text("Добавить вопрос")
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundColor(.white)
                .padding()
                .background(.black)
            ScrollView {
                TextFieldCell(title: "Вопрос", showCheckBox: false, manager: question)
                TextFieldCell(title: "Ответ 1", showCheckBox: true, manager: answer1)
                TextFieldCell(title: "Ответ 2", showCheckBox: true, manager: answer2)
                TextFieldCell(title: "Ответ 3", showCheckBox: true, manager: answer3)
                TextFieldCell(title: "Ответ 4", showCheckBox: true, manager: answer4)
            }
            
            Button(action:{
                Game.shared.addQuestions(saveQuestion())
            }) {
                Text("Сохраннить")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 150, height: 50)
                    .foregroundColor(.white)
                    .background(!question.maxLimit &&
                                !answer1.maxLimit &&
                                !answer2.maxLimit &&
                                !answer3.maxLimit &&
                                !answer4.maxLimit ? .black : .gray)
                    .cornerRadius(50)
            }
            .disabled(!question.maxLimit &&
                      !answer1.maxLimit &&
                      !answer2.maxLimit &&
                      !answer3.maxLimit &&
                      !answer4.maxLimit ? false : true)
            
        }
    }
}
extension AddingQuestionView {
    
    // MARK: - Private functions
    private func saveQuestion() -> Question {
        let question = Question(number: 11,
                                question: question.text,
                                amount: 0,
                                answerOptions: [Answers(item: 0,
                                                        answer: answer1.text,
                                                        status: answer1.checkBox),
                                                Answers(item: 1,
                                                        answer: answer2.text,
                                                        status: answer2.checkBox),
                                                Answers(item: 2,
                                                        answer: answer3.text,
                                                        status: answer3.checkBox),
                                                Answers(item: 3,
                                                        answer: answer4.text,
                                                        status: answer4.checkBox)],
                                status: false)
        return question
    }
}

struct AddingQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddingQuestionView()
    }
}

