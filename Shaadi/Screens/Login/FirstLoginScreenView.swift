//
//  FirstLoginScreenView.swift
//  Shaadi
//
//  Created by ROHIT DAS on 11/06/24.
//

import UIKit

class FirstLoginScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let loginLabel = UILabel()
    private let descriptionLabel = UILabel()
    let phoneNumberTextField = UITextField()
    let sendButton = UIButton(type: .system)
    let loginUsingPasswordButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder has not been implemented)")
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        loginUsingPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Welcome Back 👻"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        setupTextField(phoneNumberTextField, placeholder: "Enter phone number")
        
        loginLabel.text = "Login to your Account"
        loginLabel.font = UIFont.systemFont(ofSize: 22)
        loginLabel.textColor = .black
        
        descriptionLabel.text = "+91 Enter Phone Number"
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .black
        
        sendButton.setTitle("Send One Time Password", for: .normal)
        sendButton.backgroundColor = UIColor(hex: "#EF4B4B")
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sendButton.layer.cornerRadius = 15
        sendButton.clipsToBounds = true
        
        loginUsingPasswordButton.setTitle("Login using Password", for: .normal)
        loginUsingPasswordButton.backgroundColor = UIColor(hex:"#F4F4F4")
        loginUsingPasswordButton.setTitleColor(UIColor(hex: "#EF4B4B"), for: .normal)
        loginUsingPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginUsingPasswordButton.layer.cornerRadius = 15
        loginUsingPasswordButton.clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(phoneNumberTextField)
        addSubview(sendButton)
        addSubview(loginUsingPasswordButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant:  20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 25),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            sendButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 40	),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginUsingPasswordButton.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 20),
            loginUsingPasswordButton.heightAnchor.constraint(equalToConstant: 60),
            loginUsingPasswordButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginUsingPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor(hex:"#000000"))
        textField.backgroundColor = UIColor(hex: "#F4F4F4")
        textField.textColor = .black
    }
}
