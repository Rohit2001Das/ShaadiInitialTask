//
//  OnboardingViewModel.swift
//  Shaadi
//
//  Created by ROHIT DAS on 04/06/24.
//

import Foundation

class OnboardingViewModel {
    private var items: [OnboardingItem]
    private var currentIndex: Int = 0
    
    var navigateToRegister: (() -> Void)?
    var navigateToFirstLogin: (() -> Void)?
    
    
    var currentItem: OnboardingItem {
        return items[currentIndex]
    }
    
    init(items: [OnboardingItem]) {
        self.items = items
    }
    
    func handleGetStarted() {
        
        navigateToRegister?()
        print("Get Started button action triggered in ViewModel")
    }
    
    func handleGoogleSignIn() {
        print("Google sign-in action triggered in ViewModel")
    }
    
    func handleAppleSignIn() {
        print("Apple sign-in action triggered in ViewModel")
    }
    
    func handleLogin() {
        print("Login button action triggered in ViewModel")
        
        navigateToFirstLogin?()
    
    }
}
