//
//  Date.swift
//  AvitoTest
//
//  Created by Andrey on 27.08.2021.
//

import UIKit

extension Date {
    
    // MARK: - Returns the amount of minutes from another date
    func minutes() -> Int {
        let current = Date()
        return Calendar.current.dateComponents([.second, .minute, .hour, .day], from: self, to: current).minute ?? 0
    }
}


