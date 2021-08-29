//
//  MainViewPresenter.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

class MainViewPresenter: MainViewPresenterOutput {
    // MARK: - Private Properties
    private var dataService: DataService!
    private var data: NetworkResponseModel?
    
    weak var view: MainViewPresenterInput!
    
    // MARK: - Initiliser
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Fetch Data
    func fetchData() {
        dataService.fetchResult { [weak self] (result: Result<NetworkResponseModel, Error>) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.view.showAlert(error: error)
            case .success(let model):
                self.data = model
                self.data?.company.sortEmployees()
                
                self.view.showResponseData()
            }
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
    
    // MARK: - Get Response Data
    func getResponseData() -> NetworkResponseModel {
        return data!
    }
}
