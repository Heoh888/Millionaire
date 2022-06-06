//
//  StatisticsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

struct StatisticsView: View {
    
    // MARK: - Private properties
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    
    // MARK: - Views
    var body: some View {
        VStack{
            HStack {
                Text("Дата")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30.0)
                    .foregroundColor(.white)
                Spacer()
                Text("Правельных ответов")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .bottom])
                    .frame(width: 150)
                    .foregroundColor(.white)
                Spacer()
                Text("Сумма")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 30.0)
                    .foregroundColor(.white)
            }
            .background(.black)
            ScrollView {
                Divider()
                ForEach(0 ..< Game.shared.records.count) { index in
                    let record = Game.shared.records[index]
                    StatisticsViewCell(dateRecrd: dateFormatter.string(from: record.date),
                                       correctAnswers: record.correctAnswers ?? 0,
                                       amount: record.amount)
                }
            }.padding(.top, 30.0)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
