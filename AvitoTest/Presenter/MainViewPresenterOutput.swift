//
//  MainViewPresenterOutput.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

protocol MainViewPresenterOutput: AnyObject {
    func fetchData()
    func getEmployeesCount() -> Int
    func getEmployee(for row: Int) -> Employee?
    func getResponseData() -> NetworkResponseModel
}
