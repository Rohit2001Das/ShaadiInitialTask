//
//  SceneDelegate.swift
//  Shaadi
//
//  Created by ROHIT DAS on 03/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // Create the onboarding items
               let items = [
                   OnboardingItem(title: "Find you first Meta Matches", description: "Join us and socialize with millions of meta humans"),
               ]
               
               let viewModel = OnboardingViewModel(items: items)
               
               let onboardingViewController = OnboardingViewController(viewModel: viewModel)
               let navigationController = UINavigationController(rootViewController: onboardingViewController)

                 let window = UIWindow(windowScene: windowScene)
               window.rootViewController = navigationController
               window.makeKeyAndVisible()
               self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

