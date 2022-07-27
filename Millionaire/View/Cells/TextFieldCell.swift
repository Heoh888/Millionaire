//
//  TextFieldCell.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 15.06.2022.
//

import SwiftUI

protocol TextFieldCellDelegat: AnyObject {
    func checkBoxCcontrol()
}

struct TextFieldCell: View {
    
    // MARK: - Properties
    var title: String
    var showCheckBox: Bool
    
    // MARK: - State properties
    @StateObject var manager: TFManager
    @State var isTapped = false
    @State var checkBox = false
    
    // MARK: - Views
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15) {
                    TextField("", text: $manager.text) { (status) in
                        if status {
                            withAnimation(.easeIn) {
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if manager.text == "" {
                            withAnimation(.easeOut) {
                                isTapped = false
                            }
                        }
                    }
                    if showCheckBox {
                        Button(action: {
                            manager.checkBox.toggle()
                            
                        }, label: {
                            Image(systemName: !manager.checkBox ? "circle" : "circle.circle.fill")
                                .foregroundColor(.gray)
                        })
                    }
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text(title)
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                        .foregroundColor(isTapped ? .black : .gray)
                    , alignment: .leading
                )
                .padding(.horizontal)
                
                Rectangle()
                    .fill(isTapped ? Color.black : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 10)
            })
            .padding(.top, 12)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)
            
            HStack {
                Spacer()
                Text("\(manager.text.count)/\(manager.maxLimitNum)")
                    .font(.caption)
                    .foregroundColor(manager.text.count > manager.maxLimitNum ? .red : .gray)
                    .padding(.trailing)
                    .padding(.top, 4)
            }
        }
        .padding()
    }
}

