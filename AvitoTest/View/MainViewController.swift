//
//  ViewController.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewPresenterInput {
    
    var presenter: MainViewPresenterOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        presenter.fetchData()
    }

    // MARK: - Show Response Data
    func showResponseData(data: NetworkResponseModel) {
        print(data)
    }
}

