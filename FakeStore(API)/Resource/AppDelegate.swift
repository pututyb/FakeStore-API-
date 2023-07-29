//
//  AppDelegate.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 26/07/23.
//

import UIKit
import FBSDKCoreKit
import Swifter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let userViewModel = UserViewModel()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Thread.sleep(forTimeInterval: 3.0)
        
        // Initialize the UIWindow
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Check if the user is logged in
        let isLoggedIn = checkLoginStatus()
        
        if isLoggedIn {
            // User is logged in, show HomeViewController
            let homeVC = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeVC)
            window?.rootViewController = navigationController
        } else {
            // User is not logged in, show LoginViewController
            let loginVC = LoginViewController()
            window?.rootViewController = loginVC
        }
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        // Initialize Facebook SDK
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )
        
        return true
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
    
    // MARK: - Other AppDelegate methods
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // Method Facebook SDK
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // Check if the URL is for Twitter authentication
        if url.scheme == "your_twitter_callback_url_scheme" {
            Swifter.handleOpenURL(url, callbackURL: url)
            return true
        }
        
        return ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}
