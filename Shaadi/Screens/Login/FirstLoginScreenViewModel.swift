//
//  FirstLoginScreenViewModel.swift
//  Shaadi
//
//  Created by ROHIT DAS on 12/06/24.
//

import Foundation

protocol FirstLoginScreenViewModelDelegate: AnyObject{
    func didUpdateFormValidity(isValid: Bool)
}

class FirstLoginScreenViewModel {
    weak var delegate: FirstLoginScreenViewModelDelegate?
    
    var phoneNumber: String = "" {
        didSet {
            validateForm()
        }
    }
    private func validateForm(){
        let isValid = !phoneNumber.isEmpty && phoneNumber.count == 10
        delegate?.didUpdateFormValidity(isValid: isValid)
    }
}
