//
//  ServiceLayer.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

final class ServiceLayer {
    // MARK: - Public Properties
    static let shared = ServiceLayer()

    let networkService: Network
    
    // MARK: - Initializers
    private init() {
        self.networkService = NetworkService()
    }
}
