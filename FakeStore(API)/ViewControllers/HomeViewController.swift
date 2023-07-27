//
//  HomeViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 27/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var btnBurgerMenu: UIButton = {
        let btnBurgerMenu = UIButton()
        btnBurgerMenu.translatesAutoresizingMaskIntoConstraints = false
        btnBurgerMenu.backgroundColor = UIColor(named: "btnBurgerMenu")
        btnBurgerMenu.layer.cornerRadius = 20
        btnBurgerMenu.tintColor = UIColor(named: "textPrimaryColor")
        return btnBurgerMenu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        view.addSubview(btnBurgerMenu)
        
        
        NSLayoutConstraint.activate([
            btnBurgerMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            btnBurgerMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnBurgerMenu.widthAnchor.constraint(equalToConstant: 45),
            btnBurgerMenu.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        updateBurgerButtonImage()
    }
    
    //Untuk Mengeksekusi jika pergantian antara darkmode dan lightmode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateBurgerButtonImage()
        
    }
    
    private func updateBurgerButtonImage() {
        if traitCollection.userInterfaceStyle == .dark {
            btnBurgerMenu.setImage(UIImage(named: "burgerLight"), for: .normal)
        } else {
            btnBurgerMenu.setImage(UIImage(named: "burgerDark"), for: .normal)
        }
    }
}
