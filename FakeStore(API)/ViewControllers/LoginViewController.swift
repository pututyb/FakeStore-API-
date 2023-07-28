//
//  LoginViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 27/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let userViewModel = UserViewModel()
    
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
    
    let lblWelcome: UILabel = {
        let lblWelcome = UILabel()
        lblWelcome.translatesAutoresizingMaskIntoConstraints = false
        lblWelcome.text = "Welcome"
        lblWelcome.numberOfLines = 0
        lblWelcome.textAlignment = .center
        lblWelcome.textColor = UIColor(named: "textPrimaryColor")
        lblWelcome.font = UIFont(name: "Inter-Bold", size: 28)
        
        
        return lblWelcome
    }()
    
    let lblDescWelcome: UILabel = {
        let lblDescWelcome = UILabel()
        lblDescWelcome.translatesAutoresizingMaskIntoConstraints = false
        lblDescWelcome.text = "Please enter your data to continue"
        lblDescWelcome.numberOfLines = 0
        lblDescWelcome.textAlignment = .center
        lblDescWelcome.textColor = UIColor(named: "textPrimaryColor")
        lblDescWelcome.font = UIFont(name: "Inter-Regular", size: 15)
        
        return lblDescWelcome
    }()
    
    let lblUsername: UILabel = {
        let lblUsername = UILabel()
        lblUsername.translatesAutoresizingMaskIntoConstraints = false
        lblUsername.text = "Username"
        lblUsername.numberOfLines = 0
        lblUsername.textAlignment = .center
        lblUsername.textColor = UIColor(named: "textPrimaryColor")
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
        lblPassword.numberOfLines = 0
        lblPassword.textAlignment = .center
        lblPassword.textColor = UIColor(named: "textPrimaryColor")
        lblPassword.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblPassword
    }()
    
    let txtFPassword: UITextField = {
        let txtFPassword = UITextField()
        txtFPassword.translatesAutoresizingMaskIntoConstraints = false
        txtFPassword.placeholder = "Password"
        txtFPassword.borderStyle = .none
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFPassword.frame.height + 35, width: 335, height: 1)
        txtFPassword.layer.addSublayer(underlineLayer)
        
        return txtFPassword
    }()
    
    let btnForgotPassword: UIButton = {
        let btnForgotPassword = UIButton()
        btnForgotPassword.translatesAutoresizingMaskIntoConstraints = false
        btnForgotPassword.setTitle("Forgot Password?", for: .normal)
        btnForgotPassword.setTitleColor(UIColor.red, for: .normal)
        
        return btnForgotPassword
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
    
    let lblTermConditionTop: UILabel = {
        let lblTermConditionTop = UILabel()
        lblTermConditionTop.translatesAutoresizingMaskIntoConstraints = false
        lblTermConditionTop.text = "By connecting your account confirm that you agree"
        lblTermConditionTop.textColor = UIColor(named: "txtDescColor")
        lblTermConditionTop.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblTermConditionTop
    }()
    
    let lblTermConditionBottom: UILabel = {
        let lblTermConditionBottom = UILabel()
        lblTermConditionBottom.translatesAutoresizingMaskIntoConstraints = false
        lblTermConditionBottom.text = "with our"
        lblTermConditionBottom.textColor = UIColor(named: "txtDescColor")
        lblTermConditionBottom.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblTermConditionBottom
    }()
    
    let btnTermsConditionBottom: UIButton = {
        let btnTermsConditionBottom = UIButton()
        btnTermsConditionBottom.translatesAutoresizingMaskIntoConstraints = false
        btnTermsConditionBottom.setTitle("Term and Condition", for: .normal)
        btnTermsConditionBottom.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnTermsConditionBottom.titleLabel?.font = UIFont(name: "Inter-Regular", size: 13)
        
        return btnTermsConditionBottom
    }()
    
    private lazy var btnLoginUngu: UIButton = {
        let btnLoginUngu = UIButton()
        btnLoginUngu.translatesAutoresizingMaskIntoConstraints = false
        btnLoginUngu.setTitle("Login", for: .normal)
        btnLoginUngu.backgroundColor = UIColor(named: "btnOnBoardingTapped")
        btnLoginUngu.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnLoginUngu.titleLabel?.font = UIFont(name: "Inter-Regular", size: 17)
        btnLoginUngu.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
        return btnLoginUngu
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        view.addSubview(btnBack)
        view.addSubview(lblWelcome)
        view.addSubview(lblDescWelcome)
        view.addSubview(lblUsername)
        view.addSubview(txtFUsername)
        view.addSubview(lblPassword)
        view.addSubview(txtFPassword)
        view.addSubview(btnForgotPassword)
        view.addSubview(lblRememberMe)
        view.addSubview(switchRememberMe)
        view.addSubview(lblTermConditionTop)
        view.addSubview(lblTermConditionBottom)
        view.addSubview(btnTermsConditionBottom)
        view.addSubview(btnLoginUngu
        )
        
        
        NSLayoutConstraint.activate([
            
            //Untuk Button Back
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBack.heightAnchor.constraint(equalToConstant: 50),
            btnBack.widthAnchor.constraint(equalToConstant: 50),
            
            //Untuk Label Welcome
            lblWelcome.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 15),
            lblWelcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 125),
            
            //Untuk Label Desc Welcome
            lblDescWelcome.topAnchor.constraint(equalTo: lblWelcome.bottomAnchor, constant: 5),
            lblDescWelcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            lblDescWelcome.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            
            //Untuk label Username
            lblUsername.topAnchor.constraint(equalTo: lblDescWelcome.bottomAnchor, constant: 164),
            lblUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk TextField Username
            txtFUsername.topAnchor.constraint(equalTo: lblUsername.bottomAnchor, constant: 15),
            txtFUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFUsername.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Password
            lblPassword.topAnchor.constraint(equalTo: txtFUsername.bottomAnchor, constant: 20),
            lblPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk TextField Password
            txtFPassword.topAnchor.constraint(equalTo: lblPassword.bottomAnchor, constant: 15),
            txtFPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFPassword.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Button Forgot Password
            btnForgotPassword.topAnchor.constraint(equalTo: txtFPassword.bottomAnchor, constant: 50),
            btnForgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Untuk Label Remember Me
            lblRememberMe.topAnchor.constraint(equalTo: btnForgotPassword.bottomAnchor, constant: 40),
            lblRememberMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk Switch Remember Me
            switchRememberMe.topAnchor.constraint(equalTo: btnForgotPassword.bottomAnchor, constant: 40),
            switchRememberMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Untuk Label Terms And Condition Top
            lblTermConditionTop.topAnchor.constraint(equalTo: switchRememberMe.bottomAnchor, constant: 107),
            lblTermConditionTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lblTermConditionTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            //Untuk Label Terms And Condition Bottom
            lblTermConditionBottom.topAnchor.constraint(equalTo: lblTermConditionTop.bottomAnchor, constant: 10),
            lblTermConditionBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            //Untuk Button Terms And Condition Bottom
            btnTermsConditionBottom.topAnchor.constraint(equalTo: lblTermConditionTop.bottomAnchor, constant: 5),
            btnTermsConditionBottom.leadingAnchor.constraint(equalTo: lblTermConditionBottom.trailingAnchor, constant: 5),
            
            //Untuk Button Login Ungu
            btnLoginUngu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            btnLoginUngu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            btnLoginUngu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            btnLoginUngu.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    @objc func btnBackTapped() {
        navigationController?.popViewController(animated: true)
        print("btnBack Tapped")
    }
    
    @objc func btnLoginTapped() {
        guard let username = txtFUsername.text, let password = txtFPassword.text else {
            print("Please enter username and password")
            return
        }
        
        userViewModel.fetchUsers { users in
            DispatchQueue.main.async {
                if users.contains(where: { $0.username == username && $0.password == password }) {
                    let homeVC = HomeViewController()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                } else {
                    print("Invalid username or password")
                }
            }
        }
    }
}
