//
//  Assembler.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import UIKit

protocol AssemblerProtocol {
    func main() -> UIViewController
}

class Assembler: AssemblerProtocol {
    let serviceLayer: ServiceLayer = ServiceLayer.shared
    
    func main() -> UIViewController {
        let presenter = MainViewPresenter(dataService: serviceLayer.dataService)
        
        let view = MainViewController()
        view.presenter = presenter
        
        presenter.view = view
        
        return view
    }
}
