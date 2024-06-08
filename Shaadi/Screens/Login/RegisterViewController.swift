//
//  RegisterViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 06/06/24.
//

import UIKit

class RegisterViewController: UIViewController {
    private let registerView = RegisterView()
    
    
    private func setupNextButton() {
        registerView.nextButton.addTarget(self, action: #selector(navigateToOTPScreen), for: .touchUpInside)
    }

    @objc private func navigateToOTPScreen() {
        let otpVC = OTPViewController()
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
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
        setupCollectionView()
        setupNextButton()
    }

    private func setupCollectionView() {
        registerView.privacyOptionsCollectionView.dataSource = self
        registerView.privacyOptionsCollectionView.delegate = self
        registerView.privacyOptionsCollectionView.register(PrivacyOptionCell.self, forCellWithReuseIdentifier: "PrivacyOptionCell")
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
}
