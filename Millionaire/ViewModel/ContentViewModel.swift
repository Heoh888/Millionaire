//
//  ContentViewModel.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 02.06.2022.
//

import Foundation

enum Page {
    case main
    case statistics
    case questions
}

final class ContentViewModel {
    
    var page: Page = .main
    static var shared = ContentViewModel()
    
    func toogle(val: Page) {
        page = val
        print(page)
    }
}
