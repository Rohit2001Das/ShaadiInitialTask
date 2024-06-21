//
//  LoginScreenView.swift
//  Shaadi
//
//  Created by ROHIT DAS on 15/06/24.
//

import UIKit

class LoginScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let loginLabel = UILabel()
    private let descriptionLabel = UILabel()
    let textField = UITextField()
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        loginUsingPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        
        loginLabel.font = UIFont.systemFont(ofSize: 22)
        loginLabel.textColor = .black
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .black
        
        setupTextField(textField, placeholder: "")
        
        sendButton.backgroundColor = UIColor(hex: "#EF4B4B")
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sendButton.layer.cornerRadius = 15
        sendButton.clipsToBounds = true
        
        loginUsingPasswordButton.backgroundColor = UIColor(hex:"#F4F4F4")
        loginUsingPasswordButton.setTitleColor(UIColor(hex: "#EF4B4B"), for: .normal)
        loginUsingPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginUsingPasswordButton.layer.cornerRadius = 15
        loginUsingPasswordButton.clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(textField)
        addSubview(sendButton)
        addSubview(loginUsingPasswordButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant:  20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            
            textField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 25),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            sendButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40    ),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginUsingPasswordButton.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 20),
            loginUsingPasswordButton.heightAnchor.constraint(equalToConstant: 60),
            loginUsingPasswordButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginUsingPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    func configure(with item: LoginScreenItem){
        titleLabel.text = item.title
        loginLabel.text = item.description
        setupTextField(textField, placeholder: item.placeholder)
        sendButton.setTitle(item.sendButtonText, for: .normal)
        loginUsingPasswordButton.setTitle(item.loginButtonText, for: .normal)
    }

    
    private func setupTextField(_ textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor(hex:"#000000"))
        textField.backgroundColor = UIColor(hex: "#F4F4F4")
        textField.textColor = .black
    }
}
