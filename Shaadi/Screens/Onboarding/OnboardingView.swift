//
//  OnboardingView.swift
//  Shaadi
//
//  Created by ROHIT DAS on 04/06/24.

import UIKit

class OnboardingView: UIView {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let getStartedButton = UIButton(type: .system)
    private let googleButton = UIButton(type: .system)
    private let appleButton = UIButton(type: .system)
    private let alreadyHaveAccountLabel = UILabel()
    private let loginButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        print("setupViews called")
        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews

        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(getStartedButton)
        addSubview(googleButton)
        addSubview(appleButton)
        addSubview(alreadyHaveAccountLabel)
        addSubview(loginButton)
        
        // Configuring UI elements
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        
        getStartedButton.setTitle("Get Started  ↗", for: .normal)
        getStartedButton.backgroundColor = UIColor(hex: "#EF4B4B")
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.layer.cornerRadius = 15
        getStartedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        getStartedButton.clipsToBounds = true
        
       
        // Setting  google and apple buttons with original rendering mode
               if let googleImage = UIImage(named: "google_icon")?.withRenderingMode(.alwaysOriginal) {
                   googleButton.setImage(googleImage, for: .normal)
               } else {
                   print("Google icon not found")
               }
               googleButton.contentMode = .scaleAspectFit
               googleButton.imageView?.contentMode = .scaleAspectFit
               googleButton.tintColor = .clear
               googleButton.backgroundColor = UIColor(hex: "#F4F4F4")
               googleButton.layer.cornerRadius = 15
        
               if let appleImage = UIImage(named: "apple_icon")?.withRenderingMode(.alwaysOriginal) {
                   appleButton.setImage(appleImage, for: .normal)
               } else {
                   print("Apple icon not found")
               }
               appleButton.contentMode = .scaleAspectFit
               appleButton.imageView?.contentMode = .scaleAspectFit
               appleButton.tintColor = .clear
               appleButton.backgroundColor = UIColor(hex: "#F4F4F4")
               appleButton.layer.cornerRadius = 15
        
        
              alreadyHaveAccountLabel.text = "Already have an account?"
              alreadyHaveAccountLabel.font = UIFont.systemFont(ofSize: 16)
              alreadyHaveAccountLabel.textColor = .black
              
              loginButton.setTitle("Login", for: .normal)
              loginButton.setTitleColor(.systemBlue, for: .normal)
              loginButton.setTitleColor(UIColor(hex: "#EF4B4B"), for: .normal)
              loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            getStartedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60),
            getStartedButton.widthAnchor.constraint(equalToConstant: 170),
            
            googleButton.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor),
            googleButton.leadingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: 20),
            googleButton.heightAnchor.constraint(equalToConstant: 35),
            googleButton.widthAnchor.constraint(equalToConstant: 35),
            
            appleButton.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor),
            appleButton.leadingAnchor.constraint(equalTo: googleButton.trailingAnchor, constant: 10),
            appleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            appleButton.heightAnchor.constraint(equalToConstant: 50),
            appleButton.widthAnchor.constraint(equalToConstant: 50),
            
            alreadyHaveAccountLabel.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 20),
            alreadyHaveAccountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            alreadyHaveAccountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
                       
            loginButton.leadingAnchor.constraint(equalTo: alreadyHaveAccountLabel.trailingAnchor, constant: 10),
            
                       
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
                   ])
    }
    
    func configure(with item: OnboardingItem) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
    
    var getStartedButtonAction: (() -> Void)? {
        didSet {
            getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        }
    }
    
    var googleButtonAction: (() -> Void)? {
        didSet {
            googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        }
    }
    
    var appleButtonAction: (() -> Void)? {
        didSet {
            appleButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
        }
    }
    
    var loginButtonAction: (() -> Void)? {
        didSet {
            loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc private func getStartedButtonTapped() {
        getStartedButtonAction?()
    }
    
    @objc private func googleButtonTapped() {
        googleButtonAction?()
    }
    
    @objc private func appleButtonTapped() {
        appleButtonAction?()
    }
    
    @objc private func loginButtonTapped() {
        loginButtonAction?()
    }
}


