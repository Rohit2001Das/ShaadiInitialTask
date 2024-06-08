//
//  OnboardingViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 04/06/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView()
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        print("loadView called")
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
        
        onboardingView.getStartedButtonAction = { [weak self] in
            self?.viewModel.handleGetStarted()
        }
        
        onboardingView.googleButtonAction = { [weak self] in
            self?.viewModel.handleGoogleSignIn()
        }
        
        onboardingView.appleButtonAction = { [weak self] in
            self?.viewModel.handleAppleSignIn()
        }
        
        onboardingView.loginButtonAction = { [weak self] in
            self?.viewModel.handleLogin()
        }
        
        bindViewModel()
        updateView()
    }
    
    private func bindViewModel() {
        viewModel.navigateToRegister = { [weak self] in
            let registerViewController = RegisterViewController()
            self?.navigationController?.pushViewController(registerViewController, animated: true)
        }
    }
    
    private func updateView() {
        print("updateView called")
        let currentItem = viewModel.currentItem
        onboardingView.configure(with: currentItem)
    }
}
