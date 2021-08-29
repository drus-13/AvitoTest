//
//  Localization.swift
//  AvitoTest
//
//  Created by Andrey on 28.08.2021.
//

import Foundation

struct Localization {
    static func string(key: String, defaultValues: String) -> String {
        return NSLocalizedString(key, comment: defaultValues)
    }
}
