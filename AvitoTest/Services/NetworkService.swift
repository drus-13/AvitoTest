//
//  NetworkService.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

protocol Network {
    func requestData<M: Decodable>(url: URL, _ completion: @escaping(Result<M, Error>) -> Void)
}

class NetworkService: Network {
    // MARK: - Private Properties
    private let session: URLSession
    
    // MARK: - Initializers
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    // MARK: - Request Data
    func requestData<M: Decodable>(url: URL, _ completion: @escaping (Result<M, Error>) -> Void) {
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let networkError = error {
                DispatchQueue.main.async {
                    completion(.failure(networkError))
                }
            }
            
            do {
                let decodedData = try JSONDecoder().decode(M.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch let networkError {
                DispatchQueue.main.async {
                    completion(.failure(networkError))
                }
            }
            
        }
        dataTask.resume()
    }
}
