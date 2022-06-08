//
//  StatisticsViewCell.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import SwiftUI

struct StatisticsViewCell: View {
    
    // MARK: - Properties
    var dateRecrd: String
    var correctAnswers: Double = 0
    var amount: Int
    
    // MARK: - Views
    var body: some View {
        HStack {
            Text(dateRecrd)
                .padding(.leading)
                .frame(width: UIScreen.main.bounds.width / 3,
                       alignment: .leading)
            Spacer()
            Text("\(String(format: "%.1f", correctAnswers)) %")
                .multilineTextAlignment(.center)

            Spacer()
            Text("\(amount)")
                .padding(.trailing)
                .frame(width: UIScreen.main.bounds.width / 3,
                       alignment: .trailing)
        }
        .padding(.horizontal)
        .background(.white)
        Divider()
    }
}

