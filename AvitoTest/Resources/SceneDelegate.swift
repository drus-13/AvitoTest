//
//  SceneDelegate.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let assembler: AssemblerProtocol = Assembler()
        
        let mainViewController = assembler.main()
        
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}

