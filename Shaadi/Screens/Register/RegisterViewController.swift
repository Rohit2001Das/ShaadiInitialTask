//
//  RegisterViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 06/06/24.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewModelDelegate {
    private let registerView = RegisterView()
    private let viewModel = RegisterViewModel()
    
    private let privacyOptions = [
        "Show to all",
        "Hide to all",
        "Show to the members I express interest in"
    ]

    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupBindings()
        setupCollectionView()
        setupNextButton()
    }
    
    private func setupNextButton() {
        registerView.nextButton.addTarget(self, action: #selector(navigateToOTPScreen), for: .touchUpInside)
    }

    @objc private func navigateToOTPScreen() {
        let otpVC = OTPViewController()
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    private func setupBindings() {
        registerView.fullNameTextField.addTarget(self, action: #selector(fullNameChanged(_:)), for: .editingChanged)
        registerView.emailTextField.addTarget(self, action: #selector(emailChanged(_:)), for: .editingChanged)
        registerView.passwordTextField.addTarget(self, action: #selector(passwordChanged(_:)), for: .editingChanged)
        registerView.phoneNumberTextField.addTarget(self, action: #selector(phoneNumberChanged(_:)), for: .editingChanged)
    }
    
    @objc private func fullNameChanged(_ textField: UITextField) {
        viewModel.fullName = textField.text ?? ""
    }
    
    @objc private func emailChanged(_ textField: UITextField) {
        viewModel.email = textField.text ?? ""
    }
    
    @objc private func passwordChanged(_ textField: UITextField) {
        viewModel.password = textField.text ?? ""
    }
    
    @objc private func phoneNumberChanged(_ textField: UITextField) {
        viewModel.phoneNumber = textField.text ?? ""
    }

    private func setupCollectionView() {
        registerView.privacyOptionsCollectionView.dataSource = self
        registerView.privacyOptionsCollectionView.delegate = self
        registerView.privacyOptionsCollectionView.register(PrivacyOptionCell.self, forCellWithReuseIdentifier: "PrivacyOptionCell")
    }
    // MARK: - RegisterViewModelDelegate
      
      func didUpdateData() {
          // Update the view based on the ViewModel's state
          registerView.nextButton.isEnabled = viewModel.isFormValid
          
          // Update the show name button state
          let showNameImage = viewModel.isNameVisible ? UIImage(named: "checked") : UIImage(named: "unchecked")
          registerView.showNameButton.setImage(showNameImage, for: .normal)
      }
  
}

extension RegisterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return privacyOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrivacyOptionCell", for: indexPath) as? PrivacyOptionCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: privacyOptions[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = privacyOptions[indexPath.item]
        let font = UIFont.systemFont(ofSize: 16)
        let textWidth = text.width(withConstrainedHeight: 40, font: font)
        
        return CGSize(width: min(textWidth + 20, collectionView.bounds.width - 40), height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          viewModel.selectedPrivacyOption = privacyOptions[indexPath.item]
      }
}
