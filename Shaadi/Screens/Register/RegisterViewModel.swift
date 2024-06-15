//
//  RegisterViewModel.swift
//  Shaadi
//
//  Created by ROHIT DAS on 12/06/24.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func didUpdateData()
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    
    var fullName: String = "" {
        didSet {
            validateForm()
        }
    }
    
    var email: String = "" {
        didSet {
            validateForm()
        }
    }
    
    var password: String = "" {
        didSet {
            validateForm()
        }
    }
    
    var phoneNumber: String = "" {
        didSet {
            validateForm()
        }
    }
    
    var isNameVisible: Bool = false {
        didSet {
            delegate?.didUpdateData()
        }
    }
    
    var selectedPrivacyOption: String? {
        didSet {
            delegate?.didUpdateData()
        }
    }
    
    var isFormValid: Bool = false {
        didSet {
            delegate?.didUpdateData()
        }
    }
    
    private func validateForm() {
        isFormValid = !fullName.isEmpty && !email.isEmpty && !password.isEmpty && !phoneNumber.isEmpty
    }
}
