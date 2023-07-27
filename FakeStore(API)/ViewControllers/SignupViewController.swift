//
//  SignupViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 27/07/23.
//

import UIKit

class SignupViewController: UIViewController {
    
    private lazy var btnBack: UIButton = {
        let btnBack = UIButton()
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.backgroundColor = UIColor(named: "btnBack")
        btnBack.layer.cornerRadius = 24
        btnBack.tintColor = UIColor(named: "textPrimaryColor")
        btnBack.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        return btnBack
    }()
    
    let txtTitle: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Sign Up"
        txtTitle.numberOfLines = 0
        txtTitle.textAlignment = .center
        txtTitle.textColor = UIColor(named: "textPrimaryColor")
        txtTitle.font = UIFont(name: "Inter-Bold", size: 28)
        
        return txtTitle
    }()
    
    let lblUsername: UILabel = {
        let lblUsername = UILabel()
        lblUsername.translatesAutoresizingMaskIntoConstraints = false
        lblUsername.text = "Username"
        lblUsername.textColor = UIColor(named: "txtDescColor")
        lblUsername.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblUsername
    }()
    
    let txtFUsername: UITextField = {
        let txtFUsername = UITextField()
        txtFUsername.translatesAutoresizingMaskIntoConstraints = false
        txtFUsername.placeholder = "Username"
        txtFUsername.borderStyle = .none
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFUsername.frame.height + 35, width: 335, height: 1)
        txtFUsername.layer.addSublayer(underlineLayer)
        
        return txtFUsername
    }()
    
    let lblPassword: UILabel = {
        let lblPassword = UILabel()
        lblPassword.translatesAutoresizingMaskIntoConstraints = false
        lblPassword.text = "Password"
        lblPassword.textColor = UIColor(named: "txtDescColor")
        lblPassword.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblPassword
    }()
    
    let txtFPassword: UITextField = {
        let txtFPassword = UITextField()
        txtFPassword.translatesAutoresizingMaskIntoConstraints = false
        txtFPassword.placeholder = "Password"
        txtFPassword.textColor = UIColor(named: "textPrimaryColor")
        txtFPassword.borderStyle = .none
        txtFPassword.isSecureTextEntry = true
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFPassword.frame.height + 35, width: 335, height: 1)
        txtFPassword.layer.addSublayer(underlineLayer)
        
        return txtFPassword
    }()
    
    let lblEmailAddress: UILabel = {
        let lblEmailAddress = UILabel()
        lblEmailAddress.translatesAutoresizingMaskIntoConstraints = false
        lblEmailAddress.text = "Email Address"
        lblEmailAddress.textColor = UIColor(named: "txtDescColor")
        lblEmailAddress.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblEmailAddress
    }()
    
    let txtFEmailAdress: UITextField = {
        let txtFEmailAdress = UITextField()
        txtFEmailAdress.translatesAutoresizingMaskIntoConstraints = false
        txtFEmailAdress.textColor = UIColor(named: "textPrimaryColor")
        txtFEmailAdress.placeholder = "Email Address"
        txtFEmailAdress.borderStyle = .none
        txtFEmailAdress.autocapitalizationType = .none
        txtFEmailAdress.keyboardType = .emailAddress
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFEmailAdress.frame.height + 35, width: 335, height: 1)
        txtFEmailAdress.layer.addSublayer(underlineLayer)
        
        return txtFEmailAdress
    }()
    
    let lblFirstName: UILabel = {
        let lblFirstName = UILabel()
        lblFirstName.translatesAutoresizingMaskIntoConstraints = false
        lblFirstName.text = "First Name"
        lblFirstName.textColor = UIColor(named: "txtDescColor")
        lblFirstName.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblFirstName
    }()
    
    let txtFFirstName: UITextField = {
        let txtFFirstName = UITextField()
        txtFFirstName.translatesAutoresizingMaskIntoConstraints = false
        txtFFirstName.placeholder = "First Name"
        txtFFirstName.borderStyle = .none
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFFirstName.frame.height + 35, width: 335, height: 1)
        txtFFirstName.layer.addSublayer(underlineLayer)
        
        return txtFFirstName
    }()
    
    let lblLastName: UILabel = {
        let lblLastName = UILabel()
        lblLastName.translatesAutoresizingMaskIntoConstraints = false
        lblLastName.text = "Last Name"
        lblLastName.textColor = UIColor(named: "txtDescColor")
        lblLastName.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblLastName
    }()
    
    let txtFLastName: UITextField = {
        let txtFLastName = UITextField()
        txtFLastName.translatesAutoresizingMaskIntoConstraints = false
        txtFLastName.placeholder = "Last Name"
        txtFLastName.borderStyle = .none
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFLastName.frame.height + 35, width: 335, height: 1)
        txtFLastName.layer.addSublayer(underlineLayer)
        
        return txtFLastName
    }()
    
    let lblRememberMe: UILabel = {
        let lblRememberMe = UILabel()
        lblRememberMe.translatesAutoresizingMaskIntoConstraints = false
        lblRememberMe.text = "Remember me"
        lblRememberMe.textColor = UIColor(named: "txtDescColor")
        lblRememberMe.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblRememberMe
    }()
    
    let switchRememberMe: UISwitch = {
        let switchRememberMe = UISwitch()
        switchRememberMe.translatesAutoresizingMaskIntoConstraints = false
        return switchRememberMe
        
    }()
    
    private lazy var btnSignup: UIButton = {
        let btnSignup = UIButton()
        btnSignup.translatesAutoresizingMaskIntoConstraints = false
        btnSignup.setTitle("Sign Up", for: .normal)
        btnSignup.backgroundColor = UIColor(named: "btnOnBoardingTapped")
        btnSignup.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnSignup.titleLabel?.font = UIFont(name: "Inter-Regular", size: 17)
        btnSignup.addTarget(self, action: #selector(btnSignupTapped), for: .touchUpInside)
        return btnSignup
    }()
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        view.addSubview(btnBack)
        view.addSubview(txtTitle)
        view.addSubview(lblUsername)
        view.addSubview(txtFUsername)
        view.addSubview(lblPassword)
        view.addSubview(txtFPassword)
        view.addSubview(lblEmailAddress)
        view.addSubview(txtFEmailAdress)
        view.addSubview(lblFirstName)
        view.addSubview(txtFFirstName)
        view.addSubview(lblLastName)
        view.addSubview(txtFLastName)
        view.addSubview(lblRememberMe)
        view.addSubview(switchRememberMe)
        view.addSubview(btnSignup)
        
        NSLayoutConstraint.activate([
            
            //Untuk Button Back
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBack.heightAnchor.constraint(equalToConstant: 50),
            btnBack.widthAnchor.constraint(equalToConstant: 50),
            
            //Untuk Title Label Judul
            txtTitle.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 15),
            txtTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135),
            
            //Untuk label username
            lblUsername.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 100),
            lblUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk Textfield Username
            txtFUsername.topAnchor.constraint(equalTo: lblUsername.bottomAnchor, constant: 15),
            txtFUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFUsername.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk label password
            lblPassword.topAnchor.constraint(equalTo: txtFUsername.bottomAnchor, constant: 20),
            lblPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk Textfield Password
            txtFPassword.topAnchor.constraint(equalTo: lblPassword.bottomAnchor, constant: 15),
            txtFPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFPassword.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Email Address
            lblEmailAddress.topAnchor.constraint(equalTo: txtFPassword.bottomAnchor, constant: 20),
            lblEmailAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk Textfield Email Address
            txtFEmailAdress.topAnchor.constraint(equalTo: lblEmailAddress.bottomAnchor, constant: 15),
            txtFEmailAdress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFEmailAdress.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Fisrt Name
            lblFirstName.topAnchor.constraint(equalTo: txtFEmailAdress.bottomAnchor, constant: 20),
            lblFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk TextField First Name
            txtFFirstName.topAnchor.constraint(equalTo: lblFirstName.bottomAnchor, constant: 15),
            txtFFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFFirstName.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Last Name
            lblLastName.topAnchor.constraint(equalTo: txtFFirstName.bottomAnchor, constant: 20),
            lblLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk TextField Last Name
            txtFLastName.topAnchor.constraint(equalTo: lblLastName.bottomAnchor, constant: 15),
            txtFLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFLastName.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Remember Me
            lblRememberMe.topAnchor.constraint(equalTo: txtFLastName.bottomAnchor, constant: 52),
            lblRememberMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk Switch RememberMe
            switchRememberMe.topAnchor.constraint(equalTo: txtFLastName.bottomAnchor, constant: 52),
            switchRememberMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Untuk View Bottom Ungu
            btnSignup.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            btnSignup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            btnSignup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            btnSignup.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    @objc func btnSignupTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
        print("Button SignUp Tapped")
    }
    
    @objc func btnBackTapped() {
        navigationController?.popViewController(animated: true)
        print("btnBack Tapped")
    }
}
