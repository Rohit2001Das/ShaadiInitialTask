//
//  FirstLoginScreenViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 11/06/24.
//

import UIKit

class FirstLoginScreenViewController: UIViewController, FirstLoginScreenViewModelDelegate {
    private let loginScreenView = FirstLoginScreenView()
    private let viewModel = FirstLoginScreenViewModel()

    override func loadView() {
        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupBindings()
        setupButtons()
    }

    private func setupBindings() {
        loginScreenView.phoneNumberTextField.addTarget(self, action: #selector(phoneNumberChanged(_:)), for: .editingChanged)
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
