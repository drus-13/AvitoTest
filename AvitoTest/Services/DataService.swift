//
//  DataService.swift
//  AvitoTest
//
//  Created by Andrey on 28.08.2021.
//

import Foundation

enum DataServiceError: Error {
    case notFound
}

protocol DataServiceProtocol: AnyObject {
    associatedtype T

    func fetchResult(_ completion: @escaping(Result<T, Error>) -> Void)
}

class DataService: DataServiceProtocol {
    typealias T = NetworkResponseModel
    
    // MARK: - Private Properties
    private let networkService: Network
    private let cacheService: Cache
    
    // MARK: - Initiliser
    init(networkService: Network, cacheService: Cache) {
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    // MARK: - Fetch Result
    func fetchResult(_ completion: @escaping(Result<T, Error>) -> Void) {
        guard let cacheData = cacheService.fetchData(T.self) else {
            guard let requestURL = Constants.APIConfiguration.requestURL else {
                completion(.failure(DataServiceError.notFound))
                return
            }
            
            networkService.requestData(url: requestURL) { (response: Result<NetworkResponseModel, Error>) in
                switch response {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let model):
                    completion(.success(model))
                    self.cacheService.setDataCache(data: model)
                }
            }
            return
        }
        
        completion(.success(cacheData))
    }
}
