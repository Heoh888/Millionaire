//
//  StatisticsViewCell.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import SwiftUI

struct StatisticsViewCell: View {
    var body: some View {
        HStack {
            Text("10/05/2022").padding(.leading)
            Spacer()
            Text("16 000").padding(.trailing)
        }
        .padding(.horizontal)
        .background(.white)
        Divider()
    }
}

struct StatisticsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsViewCell()
    }
}
