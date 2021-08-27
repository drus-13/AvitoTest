//
//  Constants.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import UIKit

struct Constants {
    // MARK: - Types
    enum APIConfiguration {
        static let requestURL = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")
    }
    
    // MARK: - Table Parameters
    enum MainCellSize {
        static let cellHeight: CGFloat = 120
    }
    
    // MARK: - Cell Parameters
    enum CellParametersSize {
        static let indentHeight: CGFloat = 10
        static let indentWidth: CGFloat = 16
        static let labelHeight: CGFloat = 30
    }
    
    // MARK: - Cache Delay
    static let cacheDelayInMinutes: Int = 60
}
