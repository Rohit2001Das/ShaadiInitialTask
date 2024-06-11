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

    let showNameButton = UIButton(type: .system)
    let showNameLabel = UILabel()
    let showNameDescriptionLabel = UILabel()

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
        showNameButton.translatesAutoresizingMaskIntoConstraints = false
        showNameLabel.translatesAutoresizingMaskIntoConstraints = false
        showNameDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "Let's get to know each other 👋"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        setupTextField(fullNameTextField, placeholder: "Enter Full Name")
        setupTextField(emailTextField, placeholder: "Enter Email")
        setPasswordTextField(passwordTextField, placeholder: "Enter Password")
        setupTextField(phoneNumberTextField, placeholder: "+91   Phone Number")
        
        contactPrivacyLabel.text = "Contact Privacy Settings"
        contactPrivacyLabel.font = UIFont.systemFont(ofSize: 16)
        contactPrivacyLabel.textColor = .black
        
        privacyOptionsCollectionView.backgroundColor = .white
        privacyOptionsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PrivacyOptionCell")
        
        showNameButton.setImage(UIImage(named: "unchecked"), for: .normal)
        showNameButton.tintColor = UIColor(hex: "#EF4B4B")
        showNameButton.addTarget(self, action: #selector(toggleShowName), for: .touchUpInside)
        
        showNameLabel.text = "Show my name to all"
        showNameLabel.font = UIFont.systemFont(ofSize: 14)
        showNameLabel.textColor = .black
        
        showNameDescriptionLabel.text = "If you turn off, you won't be able to see the name of other members"
        showNameDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        showNameDescriptionLabel.textColor = .gray
        showNameDescriptionLabel.numberOfLines = 0
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(hex: "#EF4B4B")
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true

        addSubview(titleLabel)
        addSubview(fullNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(phoneNumberTextField)
        addSubview(contactPrivacyLabel)
        addSubview(privacyOptionsCollectionView)
        addSubview(showNameButton)
        addSubview(showNameLabel)
        addSubview(showNameDescriptionLabel)
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            fullNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            fullNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            fullNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),

            showNameButton.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 10),
            showNameButton.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
            showNameButton.widthAnchor.constraint(equalToConstant: 24),
            showNameButton.heightAnchor.constraint(equalToConstant: 24),

            showNameLabel.centerYAnchor.constraint(equalTo: showNameButton.centerYAnchor),
            showNameLabel.leadingAnchor.constraint(equalTo: showNameButton.trailingAnchor, constant: 5),
            
            showNameDescriptionLabel.topAnchor.constraint(equalTo: showNameLabel.bottomAnchor, constant: 5),
            showNameDescriptionLabel.leadingAnchor.constraint(equalTo: showNameLabel.leadingAnchor),
            showNameDescriptionLabel.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: showNameDescriptionLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
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
    private func setPasswordTextField(_ textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor(hex:"#000000"))
        textField.backgroundColor = UIColor(hex: "#F4F4F4")
        textField.textColor = .black
        textField.isSecureTextEntry = true
        
        let showPasswordButton = UIButton(type: .system)
                showPasswordButton.setTitle("Show", for: .normal)
                showPasswordButton.setTitleColor(UIColor(hex: "#EF4B4B"), for: .normal)
                showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
                
                textField.rightView = showPasswordButton
                textField.rightViewMode = .always
    }
    

    
    @objc private func toggleShowName() {
        if showNameButton.image(for: .normal) == UIImage(named: "unchecked") {
            showNameButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            showNameButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    
    @objc private func togglePasswordVisibility() {
            passwordTextField.isSecureTextEntry.toggle()
            if let showPasswordButton = passwordTextField.rightView as? UIButton {
                showPasswordButton.setTitle(passwordTextField.isSecureTextEntry ? "Show" : "Hide", for: .normal)
            }
        }
}
