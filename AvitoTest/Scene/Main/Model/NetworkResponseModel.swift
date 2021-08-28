//
//  NetworkResponseModel.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

// MARK: - NetworkResponseModel
class NetworkResponseModel: Codable {
    var company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    var employees: [Employee]
    
    mutating func sortEmployees() {
        self.employees.sort { return $0.name < $1.name }
    }
}

// MARK: - Employee
struct Employee: Codable {
    var name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
