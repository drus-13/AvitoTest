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

    let dataService: DataService
    let networkService: Network
    let cacheService: Cache
    
    // MARK: - Initializers
    private init() {
        self.networkService = NetworkService()
        self.cacheService = CacheService()
        self.dataService = DataService(networkService: networkService, cacheService: cacheService)
    }
}
