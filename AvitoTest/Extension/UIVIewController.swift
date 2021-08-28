//
//  UIVIewController.swift
//  AvitoTest
//
//  Created by Andrey on 28.08.2021.
//

import UIKit

extension UIViewController {
    
    // MARK: - Show Alerts
    func showAlerts(error: Error?) {
        let alert = UIAlertController(title: NetworkError.defaultTitleError.localizedDescription,
                                      message: error?.localizedDescription ??
                                        NetworkError.defaultTitleError.localizedDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
