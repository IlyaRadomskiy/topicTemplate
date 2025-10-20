//
//  SceneDelegate.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(
            _ scene: UIScene,
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions
        ) {
            guard let windowScene = (scene as? UIWindowScene) else { return }

            let window = UIWindow(windowScene: windowScene)
            let rootVC = TopicAssembly().createModule()
            let navController = UINavigationController(rootViewController: rootVC)

            window.rootViewController = navController
            window.makeKeyAndVisible()
            self.window = window
        }
}
