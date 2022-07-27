//
//  ToggleItem.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 07.06.2022.
//

import SwiftUI

struct ToggleItem: View {
    var isOne = true
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.black)
            .frame(width: 60, height: 25)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.black)
                    .frame(width: 30, height: 25),
                alignment: !isOne ? .leading : .trailing
            )
    }
}

struct ToggleItem_Previews: PreviewProvider {
    static var previews: some View {
        ToggleItem()
    }
}
