//
//  SceneDelegate.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 26/07/23.
//

import UIKit
import FacebookCore
import Swifter

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // Check if the user is logged in
        let isLoggedIn = checkLoginStatus()
        
        if isLoggedIn {
            // User is logged in, show HomeViewController
            let homeVC = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeVC)
            window?.rootViewController = navigationController
        } else {
            // User is not logged in, show GetStartedViewController
            let getStartedVC = GetStartedViewController()
            let navigationController = UINavigationController(rootViewController: getStartedVC)
            window?.rootViewController = navigationController
        }
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }
    
    
}

func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let context = URLContexts.first else { return }
    // Check if the URL is for Twitter authentication
    if context.url.scheme == "your_twitter_callback_url_scheme" {
        let callbackUrl = URL(string: "your_twitter_callback_url_scheme")!
        Swifter.handleOpenURL(context.url, callbackURL: callbackUrl)
    } else {
        // Handle other custom URL schemes (e.g., Facebook)
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: context.url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}

// MARK: - User Login Status

private func checkLoginStatus() -> Bool {
    // Check if the login data (username and password) exists in UserDefaults
    if let savedUsername = UserDefaults.standard.string(forKey: "username"),
       let _ = UserDefaults.standard.string(forKey: "password") {
        // User is logged in
        print("User Telah Login")
        print(savedUsername)
        return true
    } else {
        // User is not logged in
        print("User Belum Login")
        return false
    }
}

func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

