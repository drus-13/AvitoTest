//
//  NetworkService.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

protocol Network: AnyObject {
    func requestData<M: Decodable>(url: URL, _ completion: @escaping(Result<M, Error>) -> Void)
}

class NetworkService: NSObject, Network {
    // MARK: - Private Properties
    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        let session: URLSession = URLSession(configuration: config, delegate: self, delegateQueue: .main)
        return session
    }()
    
    // MARK: - Request Data
    func requestData<M: Decodable>(url: URL, _ completion: @escaping(Result<M, Error>) -> Void) {
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard let existData = data else {
                guard let existError = error else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.unknownError))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.failure(existError))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(M.self, from: existData)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch let dataError {
                DispatchQueue.main.async {
                    completion(.failure(dataError))
                }
            }
        }
        dataTask.resume()
    }
}

// MARK: - URLSessionTaskDelegate
extension NetworkService: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        print("No connect")
    }
}

// MARK: - Network Messages
enum NetworkError: Error {
    case defaultTitleError
    case unknownError
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .defaultTitleError:
            return Localization.string(key: "error.default", defaultValues: "")
        case .unknownError:
            return Localization.string(key: "error.unknown", defaultValues: "")
        }
    }
}
