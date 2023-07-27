//
//  HomeViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 27/07/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: WishlistViewController())
        let vc3 = UINavigationController(rootViewController: OrderViewController())
        let vc4 = UINavigationController(rootViewController: MyCardsViewController())
        
        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "heart")
        vc3.tabBarItem.image = UIImage(named: "bag")
        vc4.tabBarItem.image = UIImage(named: "mycards")
        
        tabBar.tintColor = .label
        
        setupTabBarItemImage(title: "Home", vc: vc1)
        setupTabBarItemImage(title: "Wishlist", vc: vc2)
        setupTabBarItemImage(title: "Order", vc: vc3)
        setupTabBarItemImage(title: "MyCards", vc: vc4)
        
        setViewControllers([vc1, vc2, vc3 ,vc4], animated: true)
    }
    
    private func setupTabBarItemImage(title: String, vc: UIViewController) {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = title
        label.font = UIFont(name: "Inter-Medium", size: 11)
        label.sizeToFit()
        
        vc.tabBarItem.standardAppearance?.selectionIndicatorTintColor = UIColor(named: "btnGoogle")
        vc.tabBarItem.selectedImage = UIImage(view: label)
    }
}

extension UIImage {
    // This method creates an image of a view
    convenience init?(view: UIView) {
        
        // Based on https://stackoverflow.com/a/41288197/1118398
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }
        
        if let cgImage = image.cgImage {
            self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
        } else {
            return nil
        }
    }
}
