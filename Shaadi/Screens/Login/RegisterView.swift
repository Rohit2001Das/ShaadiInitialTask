//
//  RegisterScreen.swift
//  Shaadi
//
//  Created by ROHIT DAS on 06/06/24.
//

import UIKit

class RegisterView: UIView {
    let titleLabel = UILabel()
    let fullNameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let phoneNumberTextField = UITextField()
    let contactPrivacyLabel = UILabel()
    let privacyOptionsCollectionView: UICollectionView
    let nextButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        let layout = WrappingFlowLayout()
              layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
              layout.minimumLineSpacing = 10
              layout.minimumInteritemSpacing = 20
              layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        privacyOptionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        contactPrivacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyOptionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Let's get to know each other 👋"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        setupTextField(fullNameTextField, placeholder: " Full Name")
        setupTextField(emailTextField, placeholder: " Email")
        setupTextField(passwordTextField, placeholder: " Password")
        setupTextField(phoneNumberTextField, placeholder: "+91   Phone Number")
 
        
        contactPrivacyLabel.text = "Contact Privacy Settings"
        contactPrivacyLabel.font = UIFont.systemFont(ofSize: 16)
        contactPrivacyLabel.textColor = .black
        
        privacyOptionsCollectionView.backgroundColor = .white
        privacyOptionsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PrivacyOptionCell")
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(hex: "#EF4B4B")
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        
        addSubview(titleLabel)
        addSubview(fullNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(phoneNumberTextField)
        addSubview(contactPrivacyLabel)
        addSubview(privacyOptionsCollectionView)
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            
            fullNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            fullNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            fullNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            contactPrivacyLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 40),
            contactPrivacyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            privacyOptionsCollectionView.topAnchor.constraint(equalTo: contactPrivacyLabel.bottomAnchor, constant: 20),
            privacyOptionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            privacyOptionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            privacyOptionsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            nextButton.topAnchor.constraint(equalTo: privacyOptionsCollectionView.bottomAnchor, constant: 30),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 170),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor(hex:"#000000"))
        textField.backgroundColor = UIColor(hex: "#F4F4F4")
        textField.textColor = .black 
    }
}
