//
//  MainViewPresenter.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

class MainViewPresenter: MainViewPresenterOutput {
    // MARK: - Private Properties
    private var networkService: Network!
    
    weak var view: MainViewPresenterInput!
    
    // MARK: - Initiliser
    init(networkService: Network) {
        self.networkService = networkService
    }
    
    func fetchData() {
        guard let requestURL = Constants.APIConfiguration.requestURL else { return }
        
        networkService.requestData(url: requestURL) { [weak self]
            (response: Result<NetworkResponseModel, Error>) in
            
            guard let self = self else { return }
            switch response {
            case .failure(let error):
                print(error)
            case .success(let model):
                self.view.showResponseData(data: model)
            }
        }
    }
}
