//
//  MainViewPresenterInput.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import Foundation

protocol MainViewPresenterInput: AnyObject {
    func showResponseData()
    func showAlert(error: Error)
}
