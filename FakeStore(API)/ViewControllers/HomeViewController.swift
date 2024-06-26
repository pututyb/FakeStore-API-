//
//  HomeViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 27/07/23.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    
    let menu = SideMenuNavigationController(rootViewController: MenuListController())
    
    private lazy var btnBurgerMenu: UIButton = {
        let btnBurgerMenu = UIButton()
        btnBurgerMenu.translatesAutoresizingMaskIntoConstraints = false
        btnBurgerMenu.backgroundColor = UIColor(named: "btnBurgerMenu")
        btnBurgerMenu.layer.cornerRadius = 4
        btnBurgerMenu.tintColor = UIColor(named: "textPrimaryColor")
        btnBurgerMenu.addTarget(self, action: #selector(sideMenuTapped), for: .touchUpInside)
        return btnBurgerMenu
    }()
    
    private lazy var btnBagMenu: UIButton = {
        let btnBagMenu = UIButton()
        btnBagMenu.translatesAutoresizingMaskIntoConstraints = false
        btnBagMenu.backgroundColor = UIColor(named: "btnBurgerMenu")
        btnBagMenu.layer.cornerRadius = 4
        btnBagMenu.tintColor = UIColor(named: "textPrimaryColor")
        btnBagMenu.addTarget(self, action: #selector(infoButton), for: .touchUpInside)
        return btnBagMenu
    }()
    
    let lblHello: UILabel = {
        let lblHello = UILabel()
        lblHello.translatesAutoresizingMaskIntoConstraints = false
        lblHello.text = "Hello"
        lblHello.textColor = UIColor(named: "textPrimaryColor")
        lblHello.font = UIFont(name: "Inter-Bold", size: 28)
        return lblHello
    }()
    
    let lblWelcome: UILabel = {
        let lblWelcome = UILabel()
        lblWelcome.translatesAutoresizingMaskIntoConstraints = false
        lblWelcome.text = "Welcome to Laza."
        lblWelcome.textColor = UIColor(named: "textPrimaryColor")
        lblWelcome.font = UIFont(name: "Inter-Regular", size: 15)
        return lblWelcome
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 20) // Adjust the font size as needed
        searchBar.backgroundColor = UIColor(named: "appBackgroundColor")
        searchBar.placeholder = "Search.."
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var btnMic: UIButton = {
        let btnMic = UIButton()
        btnMic.translatesAutoresizingMaskIntoConstraints = false
        btnMic.backgroundColor = UIColor(named: "btnOnBoardingTapped")
        btnMic.setImage(UIImage(named: "mic"), for: .normal)
        btnMic.layer.cornerRadius = 6
        btnMic.tintColor = UIColor(named: "textPrimaryColor")
        btnMic.addTarget(self, action: #selector(btnMicTapepd), for: .touchUpInside)
        return btnMic
    }()
    
    let lblChooseBrand: UILabel = {
        let lblChooseBrand = UILabel()
        lblChooseBrand.translatesAutoresizingMaskIntoConstraints = false
        lblChooseBrand.text = "Choose Brand"
        lblChooseBrand.textColor = UIColor(named: "textPrimaryColor")
        lblChooseBrand.font = UIFont(name: "Inter-Bold", size: 17)
        return lblChooseBrand
    }()
    
    private lazy var btnViewAll1: UIButton = {
       let btnViewAll1 = UIButton()
        btnViewAll1.translatesAutoresizingMaskIntoConstraints = false
        btnViewAll1.setTitle("View All", for: .normal)
        btnViewAll1.setTitleColor(UIColor(named: "txtDescColor"), for: .normal)
        btnViewAll1.addTarget(self, action: #selector(btnViewAll1Tapped), for: .touchUpInside)
        
        return btnViewAll1
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        
        
        //Side MenuBar
        menu.leftSide = true
        
        view.addSubview(btnBurgerMenu)
        view.addSubview(btnBagMenu)
        view.addSubview(lblHello)
        view.addSubview(lblWelcome)
        view.addSubview(searchBar)
        view.addSubview(btnMic)
        view.addSubview(lblChooseBrand)
        view.addSubview(btnViewAll1)
        
        
        NSLayoutConstraint.activate([
            btnBurgerMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            btnBurgerMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnBurgerMenu.widthAnchor.constraint(equalToConstant: 50),
            btnBurgerMenu.heightAnchor.constraint(equalToConstant: 50),
            
            btnBagMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            btnBagMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btnBagMenu.widthAnchor.constraint(equalToConstant: 50),
            btnBagMenu.heightAnchor.constraint(equalToConstant: 50),
            
            lblHello.topAnchor.constraint(equalTo: btnBurgerMenu.bottomAnchor, constant: 20),
            lblHello.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            lblWelcome.topAnchor.constraint(equalTo: lblHello.bottomAnchor, constant: 5),
            lblWelcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            searchBar.topAnchor.constraint(equalTo: lblWelcome.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            btnMic.topAnchor.constraint(equalTo: lblWelcome.bottomAnchor, constant: 20),
            btnMic.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 10),
            btnMic.widthAnchor.constraint(equalToConstant: 50),
            btnMic.heightAnchor.constraint(equalToConstant: 50),
            
            lblChooseBrand.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            lblChooseBrand.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            btnViewAll1.topAnchor.constraint(equalTo: btnMic.bottomAnchor, constant: 20),
            btnViewAll1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
            btnBagMenu.setImage(UIImage(named: "bagLight"), for: .normal)
        } else {
            btnBurgerMenu.setImage(UIImage(named: "burgerDark"), for: .normal)
            btnBagMenu.setImage(UIImage(named: "bagDark"), for: .normal)
        }
    }
    
    @objc private func infoButton() {
        print("Info Logout Terbaru")
        // Remove username and password from UserDefaults
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.synchronize()
        print(UserDefaults.standard.removeObject(forKey: "username"))
        
        // Navigate back to the GetStarted Screenhid
        let getStartedVC = GetStartedViewController()
        let navigationController = UINavigationController(rootViewController: getStartedVC)
        view.window?.windowScene?.keyWindow?.rootViewController = navigationController
    }
    
    @objc private func sideMenuTapped() {
        present(menu, animated: true)
        print("This is sde menu")
    }
    
    @objc private func btnMicTapepd() {
        print("Button Mic Tapped")
    }
    
    @objc private func btnViewAll1Tapped() {
        print("btnViewAll1 Tapped")
    }
}
