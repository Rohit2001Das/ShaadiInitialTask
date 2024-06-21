//
//  FirstLoginScreenViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 11/06/24.
//

import UIKit

class FirstLoginScreenViewController: UIViewController, FirstLoginScreenViewModelDelegate {
    private let loginScreenView = LoginScreenView()
    private let viewModel = FirstLoginScreenViewModel()

    override func loadView() {
        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupBindings()
        setupButtons()
        
        let firstLoginScreenItem = LoginScreenItem(
                   title: "Welcome Back 👻",
                   description: "Login to your Account",
                   placeholder: " +91   Enter phone number",
                   sendButtonText: "Send One Time Password",
                   loginButtonText: "Login using Password"
               )
               
               loginScreenView.configure(with: firstLoginScreenItem)
    }

    private func setupBindings() {
        loginScreenView.textField.addTarget(self, action: #selector(phoneNumberChanged(_:)), for: .editingChanged)
    }

    private func setupButtons() {
        loginScreenView.sendButton.addTarget(self, action: #selector(sendOTP), for: .touchUpInside)
        loginScreenView.loginUsingPasswordButton.addTarget(self, action: #selector(loginUsingPassword), for: .touchUpInside)
    }

    @objc private func phoneNumberChanged(_ textField: UITextField) {
        viewModel.phoneNumber = textField.text ?? ""
    }

    @objc private func sendOTP() {
       
    }

    @objc private func loginUsingPassword() {
        
    }

    // MARK: - FirstLoginScreenViewModelDelegate

    func didUpdateFormValidity(isValid: Bool) {
        loginScreenView.sendButton.isEnabled = isValid
        loginScreenView.sendButton.alpha = isValid ? 1.0 : 0.5
    }
}
