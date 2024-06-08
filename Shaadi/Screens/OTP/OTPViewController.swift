//
//  OTPViewController.swift
//  Shaadi
//
//  Created by ROHIT DAS on 08/06/24.

import UIKit

class OTPViewController: UIViewController, OTPDelegate {
    private let otpView = OTPView()
    
    override func loadView() {
        view = otpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpView.otpStackView.delegate = self
        otpView.setNextButtonAction { [weak self] in
           
            print("OTP Entered: \(self?.otpView.otpStackView.getOTP() ?? "")")
        }
    }
    
    func didChangeValidity(isValid: Bool) {
       
        print("OTP is valid: \(isValid)")
    }
}
