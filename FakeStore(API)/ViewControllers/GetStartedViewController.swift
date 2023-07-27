//
//  LoginViewController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 26/07/23.
//

import UIKit
import FacebookLogin
import Swifter


class GetStartedViewController: UIViewController {
    
    var swifter: Swifter!
    var accToken: Credential.OAuthAccessToken?
    
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
        txtTitle.text = "Let’s Get Started"
        txtTitle.numberOfLines = 0
        txtTitle.textAlignment = .center
        txtTitle.textColor = UIColor(named: "textPrimaryColor")
        txtTitle.font = UIFont(name: "Inter-Bold", size: 28)
        
        return txtTitle
    }()
    
    private lazy var btnFacebook: UIButton = {
        let btnFacebook = UIButton()
        btnFacebook.translatesAutoresizingMaskIntoConstraints = false
        btnFacebook.backgroundColor = UIColor(named: "btnFacebook")
        btnFacebook.layer.cornerRadius = 10
        btnFacebook.setImage(UIImage(named: "facebook-logo"), for: .normal)
        btnFacebook.addTarget(self, action: #selector(loginButtonFacebookClicked), for: .touchUpInside)
        return btnFacebook
    }()
    
    private lazy var btnTwitter: UIButton = {
        let btnTwitter = UIButton()
        btnTwitter.translatesAutoresizingMaskIntoConstraints = false
        btnTwitter.backgroundColor = UIColor(named: "btnTwitter")
        btnTwitter.layer.cornerRadius = 10
        btnTwitter.setImage(UIImage(named: "twitter-logo"), for: .normal)
        btnTwitter.addTarget(self, action: #selector(loginButtonTwitterClicked), for: .touchUpInside)
        return btnTwitter
    }()
    
    private lazy var btnGoogle: UIButton = {
        let btnGoogle = UIButton()
        btnGoogle.translatesAutoresizingMaskIntoConstraints = false
        btnGoogle.backgroundColor = UIColor(named: "btnGoogle")
        btnGoogle.layer.cornerRadius = 10
        btnGoogle.setImage(UIImage(named: "google-logo"), for: .normal)
        //        btnBack.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btnGoogle
    }()
    
    let lblSignIn: UILabel = {
        let lblSignIn = UILabel()
        lblSignIn.translatesAutoresizingMaskIntoConstraints = false
        lblSignIn.text = "Already have an account?"
        lblSignIn.numberOfLines = 0
        lblSignIn.textAlignment = .center
        lblSignIn.textColor = UIColor(named: "textPrimaryColor")
        lblSignIn.font = UIFont(name: "Inter-Regular", size: 15)
        
        return lblSignIn
    }()
    
    private lazy var btnSignIn: UIButton = {
        let btnSignIn = UIButton()
        btnSignIn.translatesAutoresizingMaskIntoConstraints = false
        btnSignIn.setTitle("Sign In", for: .normal)
        btnSignIn.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnSignIn.titleLabel?.font = UIFont(name: "Inter-Bold", size: 15)
        btnSignIn.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        return btnSignIn
    }()
    
    private lazy var btnCreateAccount: UIButton = {
        let btnCreateAccount = UIButton()
        btnCreateAccount.translatesAutoresizingMaskIntoConstraints = false
        btnCreateAccount.setTitle("Create an Account", for: .normal)
        btnCreateAccount.backgroundColor = UIColor(named: "btnOnBoardingTapped")
        btnCreateAccount.setTitleColor(UIColor(named: "textPrimaryColor"), for: .normal)
        btnCreateAccount.titleLabel?.font = UIFont(name: "Inter-Regular", size: 17)
        btnCreateAccount.addTarget(self, action: #selector(btnCreateAccountTapped), for: .touchUpInside)
        return btnCreateAccount
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "appBackgroundColor")
        
        view.addSubview(btnBack)
        view.addSubview(txtTitle)
        view.addSubview(btnFacebook)
        view.addSubview(btnTwitter)
        view.addSubview(btnGoogle)
        view.addSubview(lblSignIn)
        view.addSubview(btnSignIn)
        view.addSubview(btnCreateAccount)
        
        
        NSLayoutConstraint.activate([
            
            //Untuk Button Back
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBack.heightAnchor.constraint(equalToConstant: 50),
            btnBack.widthAnchor.constraint(equalToConstant: 50),
            
            
            //Untuk Title Label Judul
            txtTitle.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 15),
            txtTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            
            //Untuk Button Facebook
            btnFacebook.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 175),
            btnFacebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnFacebook.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnFacebook.heightAnchor.constraint(equalToConstant: 50),
            
            //Untuk Button Twitter
            btnTwitter.topAnchor.constraint(equalTo: btnFacebook.bottomAnchor, constant: 10),
            btnTwitter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnTwitter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnTwitter.heightAnchor.constraint(equalToConstant: 50),
            
            //Untuk Button Google
            btnGoogle.topAnchor.constraint(equalTo: btnTwitter.bottomAnchor, constant: 10),
            btnGoogle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnGoogle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnGoogle.heightAnchor.constraint(equalToConstant: 50),
            
            //Untuk Label Signin
            lblSignIn.topAnchor.constraint(equalTo: btnGoogle.bottomAnchor, constant: 200),
            lblSignIn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            lblSignIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            lblSignIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lblSignIn.heightAnchor.constraint(equalToConstant: 50),
            
            //Untuk Button Signin
            btnSignIn.topAnchor.constraint(equalTo: btnGoogle.bottomAnchor, constant: 200),
            btnSignIn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            btnSignIn.leadingAnchor.constraint(equalTo: lblSignIn.trailingAnchor, constant: -100),
            
            //Untuk View Bottom Ungu
            btnCreateAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            btnCreateAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            btnCreateAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            btnCreateAccount.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    @objc func btnBackTapped() {
        navigationController?.popViewController(animated: true)
        print("btnBack Tapped")
    }
    
    
    //for facebook
    @objc func loginButtonFacebookClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self, handler: { result, error in
            if error != nil {
                print("ERROR: Trying to get login results")
            } else if result?.isCancelled != nil {
                print("The token is \(result?.token?.tokenString ?? "")")
                if result?.token?.tokenString != nil {
                    print("Logged in")
                    //                        self.getUserProfile(token: result?.token, userId: result?.token?.userID)
                } else {
                    print("Cancelled")
                }
            }
        })
    }
    
    //for twitter
    @objc func loginButtonTwitterClicked() {
        let swifter = Swifter(consumerKey: TwitterConstants.CONSUMER_KEY, consumerSecret: TwitterConstants.CONSUMER_SECRET_KEY)
        swifter.authorize(withCallback: URL(string: TwitterConstants.CALLBACK_URL)!, presentingFrom: self, success: { accessToken, _ in
            self.accToken = accessToken
            //            self.getUserProfile()
        }, failure: { error in
            print("ERROR: Trying to authorize - \(error)")
        })
    }
    
    //for google
    
    
    
    
    //btnCreate Account
    @objc func btnCreateAccountTapped() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let signupVC = SignupViewController()
        navigationController?.pushViewController(signupVC, animated: true)
        print("btnCreate Account Tapped")
    }
    
}
