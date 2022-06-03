//
//  StatisticsView.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import SwiftUI

struct StatisticsView: View {
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(0 ..< 10) { _ in
                    StatisticsViewCell()
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
