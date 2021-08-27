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
    private var data: NetworkResponseModel?
    private var dataCache = NSCache<AnyObject, NetworkResponseModel>()
    private var date: Date = Date()
    
    weak var view: MainViewPresenterInput!
    
    // MARK: - Initiliser
    init(networkService: Network) {
        self.networkService = networkService
    }
    
    // MARK: - URL Request
    private func URLRequest() {
        guard let requestURL = Constants.APIConfiguration.requestURL else { return }
        
        networkService.requestData(url: requestURL) { [weak self]
            (response: Result<NetworkResponseModel, Error>) in
            
            guard let self = self else { return }
            
            switch response {
            case .failure(let error):
                print(error)
            case .success(let model):
                self.data = model
                self.data?.company.sortEmployees()
                
                self.dataCache.setObject(model, forKey: "response" as AnyObject)
                
                self.date = Date()
                
                self.view.showResponseData()
            }
        }
    }
    
    // MARK: - Fetch Data
    func fetchData() {
        if (date.minutes() < Constants.cacheDelayInMinutes) {
            if let cache = dataCache.object(forKey: "response" as AnyObject) {
                self.data = cache
                self.view.showResponseData()
            } else {
                URLRequest()
            }
        } else {
            URLRequest()
        }
    }
    
    // MARK: - Get Empluyees Count
    func getEmployeesCount() -> Int {
        return data?.company.employees.count ?? 0
    }
    
    // MARK: - Get Employee
    func getEmployee(for row: Int) -> Employee? {
        guard let employee = data?.company.employees[row] else { return nil }
        
        return employee
    }
}
