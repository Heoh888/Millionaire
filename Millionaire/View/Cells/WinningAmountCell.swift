//
//  WinningAmountCell.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 03.06.2022.
//

import SwiftUI

struct WinningAmountCell: View {
    
    // MARK: - Properties
    var checkSum: Bool
    var amount: String
    
    // MARK: - Views
    var body: some View {
        if checkSum {
            Text(amount)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(6.0)
                .background(.red)
        } else {
            switch amount {
            case "16 000", "2 500 000", "20 000 000":
                Text(amount)
                    .fontWeight(.bold)
            default:
                Text(amount)
            }
        }
    }
}
