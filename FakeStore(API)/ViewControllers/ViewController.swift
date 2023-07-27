//
//  ViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 26/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pria")
        
        return imageView
    }()
    
    let uiViewBottom: UIView = {
        let uiViewBottom = UIView()
        uiViewBottom.backgroundColor = UIColor(named: "uiViewBottomColor")
        uiViewBottom.translatesAutoresizingMaskIntoConstraints = false
        uiViewBottom.layer.cornerRadius = 15
        
        return uiViewBottom
    }()
    
    let txtTitle: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Look Good, Feel Good"
        txtTitle.textColor = UIColor(named: "textPrimaryColor")
        txtTitle.font = UIFont(name: "Inter-Bold", size: 25)
        
        return txtTitle
    }()
    
    let txtDesc: UILabel = {
        let txtDesc = UILabel()
        txtDesc.translatesAutoresizingMaskIntoConstraints = false
        txtDesc.text = "Create your individual & unique style and look amazing everyday."
        txtDesc.numberOfLines = 0
        txtDesc.textAlignment = .center
        txtDesc.textColor = UIColor(named: "txtDescColor")
        txtDesc.font = UIFont(name: "Inter-Regular", size: 15)
        
        return txtDesc
    }()
    
    private lazy var btnMen: UIButton = {
        let btnMen = UIButton()
        btnMen.translatesAutoresizingMaskIntoConstraints = false
        btnMen.backgroundColor = UIColor(named: "btnOnBoarding")
        btnMen.setTitle("Men", for: .normal)
        btnMen.layer.cornerRadius = 10
        btnMen.setTitleColor(UIColor(named: "btnTitleColor"), for: .normal)
        btnMen.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        let customFont = UIFont(name: "Inter-Regular", size: 17)
        btnMen.titleLabel?.font = customFont
        
        return btnMen
    }()
    
    private lazy var btnWomen: UIButton = {
        let btnWomen = UIButton()
        btnWomen.translatesAutoresizingMaskIntoConstraints = false
        btnWomen.backgroundColor = UIColor(named: "btnOnBoarding")
        btnWomen.setTitle("Women", for: .normal)
        btnWomen.layer.cornerRadius = 10
        btnWomen.setTitleColor(UIColor(named: "btnTitleColor"), for: .normal)
        btnWomen.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        let customFont = UIFont(name: "Inter-Regular", size: 17)
        btnWomen.titleLabel?.font = customFont
        
        return btnWomen
    }()
    
    private lazy var btnSkip: UIButton = {
        let btnSkip = UIButton()
        btnSkip.translatesAutoresizingMaskIntoConstraints = false
        btnSkip.setTitle("Skip", for: .normal)
        btnSkip.setTitleColor(UIColor(named: "txtDescColor"), for: .normal)
        btnSkip.addTarget(self, action: #selector(btnSkipTapped), for: .touchUpInside)
        
        let customFont = UIFont(name: "Inter-Regular", size: 17)
        btnSkip.titleLabel?.font = customFont
        
        return btnSkip
    }()
    
    
    
    
    var isButtonMenToggled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "backgroundLaunchScreen")
        view.addSubview(imageView)
        view.addSubview(uiViewBottom)
        view.addSubview(txtTitle)
        view.addSubview(txtDesc)
        view.addSubview(btnMen)
        view.addSubview(btnWomen)
        view.addSubview(btnSkip)
        
        NSLayoutConstraint.activate([
            
            //Gambar Object Pria
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            //Untuk ViewBottom yang Warna Putih
            uiViewBottom.topAnchor.constraint(equalTo: view.topAnchor, constant: 553),
            uiViewBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            uiViewBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            uiViewBottom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            
            //Untuk Title Label
            txtTitle.topAnchor.constraint(equalTo: uiViewBottom.topAnchor, constant: 25),
            txtTitle.leadingAnchor.constraint(equalTo: uiViewBottom.leadingAnchor, constant: 60),
            txtTitle.trailingAnchor.constraint(equalTo: uiViewBottom.trailingAnchor, constant: 42),
            
            //Untuk Desc Label
            txtDesc.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 10),
            txtDesc.leadingAnchor.constraint(equalTo: uiViewBottom.leadingAnchor, constant: 25),
            txtDesc.trailingAnchor.constraint(equalTo: uiViewBottom.trailingAnchor, constant: -25),
            
            //Untuk Button Men
            btnMen.topAnchor.constraint(equalTo: txtDesc.bottomAnchor, constant: 40),
            btnMen.leadingAnchor.constraint(equalTo: uiViewBottom.leadingAnchor, constant: 15),
            btnMen.heightAnchor.constraint(equalToConstant: 60),
            btnMen.widthAnchor.constraint(equalToConstant: 152),
            
            //Untuk Button Women
            btnWomen.topAnchor.constraint(equalTo: txtDesc.bottomAnchor, constant: 40),
            btnWomen.trailingAnchor.constraint(equalTo: uiViewBottom.trailingAnchor, constant: -16),
            btnWomen.heightAnchor.constraint(equalToConstant: 60),
            btnWomen.widthAnchor.constraint(equalToConstant: 152),
            
            //Untuk Button Skip
            btnSkip.topAnchor.constraint(equalTo: btnMen.bottomAnchor, constant: 20),
            btnSkip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 154),
            btnSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -154),
//            btnSkip.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Check which button was tapped and update the background color accordingly
        if sender == btnMen {
            btnMen.backgroundColor = UIColor(named: "btnOnBoardingTapped")
            btnWomen.backgroundColor = UIColor(named: "btnOnBoarding")
            isButtonMenToggled = true
            print("Button Men Tapped")
        } else if sender == btnWomen {
            btnWomen.backgroundColor = UIColor(named: "btnOnBoardingTapped")
            btnMen.backgroundColor = UIColor(named: "btnOnBoarding")
            isButtonMenToggled = false
            print("Button Women Tapped")
        }
    }
    
    @objc func btnSkipTapped() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
        print("Skip Tapped")
    }
}
