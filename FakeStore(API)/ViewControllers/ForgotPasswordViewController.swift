//
//  ForgotPasswordViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 29/07/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private lazy var btnBack: UIButton = {
        let btnBack = UIButton()
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.backgroundColor = UIColor(named: "btnBack")
        btnBack.layer.cornerRadius = 8
        btnBack.tintColor = UIColor(named: "textPrimaryColor")
        btnBack.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        
        return btnBack
    }()
    
    let lblTitle: UILabel = {
        let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "New Password"
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        lblTitle.textColor = UIColor(named: "textPrimaryColor")
        lblTitle.font = UIFont(name: "Inter-Bold", size: 28)
        
        return lblTitle
    }()
    
    let lblPassword: UILabel = {
        let lblPassword = UILabel()
        lblPassword.translatesAutoresizingMaskIntoConstraints = false
        lblPassword.text = "Password"
        lblPassword.numberOfLines = 0
        lblPassword.textAlignment = .center
        lblPassword.textColor = UIColor(named: "txtDescColor")
        lblPassword.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblPassword
    }()
    
    let txtFPassword: UITextField = {
        let txtFPassword = UITextField()
        txtFPassword.translatesAutoresizingMaskIntoConstraints = false
        txtFPassword.placeholder = "Password"
        txtFPassword.borderStyle = .none
        txtFPassword.isSecureTextEntry = true
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFPassword.frame.height + 35, width: 335, height: 1)
        txtFPassword.layer.addSublayer(underlineLayer)
        
        return txtFPassword
    }()
    
    let lblConfirmPassword: UILabel = {
        let lblConfirmPassword = UILabel()
        lblConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        lblConfirmPassword.text = "Confirm Password"
        lblConfirmPassword.numberOfLines = 0
        lblConfirmPassword.textAlignment = .center
        lblConfirmPassword.textColor = UIColor(named: "txtDescColor")
        lblConfirmPassword.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblConfirmPassword
    }()
    
    let txtFConfirmPassword: UITextField = {
        let txtFConfirmPassword = UITextField()
        txtFConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        txtFConfirmPassword.placeholder = "Confirm Password"
        txtFConfirmPassword.borderStyle = .none
        txtFConfirmPassword.isSecureTextEntry = true
        
        let underlineLayer = CALayer()
        underlineLayer.backgroundColor = UIColor(named: "underlineTxtF")?.cgColor
        underlineLayer.frame = CGRect(x: 0, y: txtFConfirmPassword.frame.height + 35, width: 335, height: 1)
        txtFConfirmPassword.layer.addSublayer(underlineLayer)
        
        return txtFConfirmPassword
    }()
    
    let lblInfoDesc: UILabel = {
        let lblInfoDesc = UILabel()
        lblInfoDesc.translatesAutoresizingMaskIntoConstraints = false
        lblInfoDesc.text = "Please write your new password."
        lblInfoDesc.numberOfLines = 0
        lblInfoDesc.textAlignment = .center
        lblInfoDesc.textColor = UIColor(named: "txtDescColor")
        lblInfoDesc.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblInfoDesc
    }()
    
    private lazy var btnResetPass: UIButton = {
        let btnResetPass = UIButton()
        btnResetPass.translatesAutoresizingMaskIntoConstraints = false
        btnResetPass.setTitle("Reset Password", for: .normal)
        btnResetPass.backgroundColor = UIColor(named: "btnOnBoardingTapped")
        btnResetPass.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnResetPass.titleLabel?.font = UIFont(name: "Inter-Regular", size: 17)
        btnResetPass.addTarget(self, action: #selector(btnResetPassTapped), for: .touchUpInside)
        return btnResetPass
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        view.addSubview(btnBack)
        view.addSubview(lblTitle)
        view.addSubview(lblPassword)
        view.addSubview(txtFPassword)
        view.addSubview(lblConfirmPassword)
        view.addSubview(txtFConfirmPassword)
        
        view.addSubview(lblInfoDesc)
        view.addSubview(btnResetPass)
        
        
        NSLayoutConstraint.activate([
            
            //Untuk Button Back
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBack.heightAnchor.constraint(equalToConstant: 50),
            btnBack.widthAnchor.constraint(equalToConstant: 50),
            
            //Untuk Label Title
            lblTitle.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 15),
            lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            
            //Untuk Label Password
            lblPassword.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 186),
            lblPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Untuk TextField Password
            txtFPassword.topAnchor.constraint(equalTo: lblPassword.bottomAnchor, constant: 15),
            txtFPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFPassword.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Confirm Password
            lblConfirmPassword.topAnchor.constraint(equalTo: txtFPassword.bottomAnchor, constant: 20),
            lblConfirmPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //UNtuk TextField ConfirmPassword
            txtFConfirmPassword.topAnchor.constraint(equalTo: lblConfirmPassword.bottomAnchor, constant: 15),
            txtFConfirmPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtFConfirmPassword.widthAnchor.constraint(equalToConstant: 335),
            
            //Untuk Label Info dibawah.
            lblInfoDesc.topAnchor.constraint(equalTo: txtFConfirmPassword.bottomAnchor, constant: 230),
            lblInfoDesc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 87),
            
            //Untuk Button Bottom Ungu
            btnResetPass.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            btnResetPass.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            btnResetPass.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            btnResetPass.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    @objc func btnBackTapped() {
        dismiss(animated: true, completion: nil)
        print("btnBack Tapped")
    }
    
    @objc func btnResetPassTapped() {
        guard let newPassword = txtFPassword.text, !newPassword.isEmpty,
              let confirmPassword = txtFConfirmPassword.text, !confirmPassword.isEmpty else {
            print("Please enter both new password and confirm password.")
            return
        }
        
        guard newPassword == confirmPassword else {
            print("Passwords do not match.")
            return
        }
        
        // Update password dengan forkeynya password
        UserDefaults.standard.set(newPassword, forKey: "password")
        
        if let updatedPassword = UserDefaults.standard.string(forKey: "password") {
            print("New Password is : " + updatedPassword)
        }
    }
    
}
