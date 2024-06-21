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
           isFormValid = validateFullName() && validateEmail() && validatePassword() && validatePhoneNumber()
       }
       
       private func validateFullName() -> Bool {
           return !fullName.isEmpty
       }
       
       private func validateEmail() -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: email)
       }
       
       private func validatePassword() -> Bool {
           return password.count >= 8
       }
       
       private func validatePhoneNumber() -> Bool {
           let phoneNumberRegEx = "^[0-9]{10,15}$"
           let phoneNumberPred = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegEx)
           return phoneNumberPred.evaluate(with: phoneNumber)
       }
}
