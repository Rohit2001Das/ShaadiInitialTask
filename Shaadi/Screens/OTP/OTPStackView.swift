//
//  OTPStackView.swift
//  Shaadi
//
//  Created by ROHIT DAS on 08/06/24.
//

import UIKit

protocol OTPDelegate: AnyObject {
    func didChangeValidity(isValid: Bool)
}

class OTPStackView: UIStackView {
    let numberOfFields = 4
    var textFieldsCollection: [OTPTextField] = []
    weak var delegate: OTPDelegate?
    var showsWarningColor = false

    let inactiveFieldBorderColor = UIColor.black.cgColor
    let textBackgroundColor = UIColor.white
    let activeFieldBorderColor = UIColor.black.cgColor
    var remainingStrStack: [String] = []

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        addOTPFields()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        addOTPFields()
    }

    private func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 15
    }

    private func addOTPFields() {
        for index in 0..<numberOfFields {
            let field = OTPTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        textFieldsCollection[0].becomeFirstResponder()
    }

    private func setupTextField(_ textField: OTPTextField) {
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.widthAnchor.constraint(equalTo: textField.heightAnchor).isActive = true 
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.textColor = .black
        textField.layer.cornerRadius = 20 
        textField.layer.borderWidth = 2
        textField.layer.borderColor = inactiveFieldBorderColor
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .no
        textField.textContentType = .oneTimeCode
    }

    private func checkForValidity() {
        for fields in textFieldsCollection {
            if fields.text == "" {
                delegate?.didChangeValidity(isValid: false)
                return
            }
        }
        delegate?.didChangeValidity(isValid: true)
    }

    final func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection {
            OTP += textField.text ?? ""
        }
        return OTP
    }

    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor) {
        for textField in textFieldsCollection {
            textField.layer.borderColor = color.cgColor
        }
        showsWarningColor = isWarningColor
    }

    private func autoFillTextField(with string: String) {
        remainingStrStack = string.reversed().compactMap { String($0) }
        for textField in textFieldsCollection {
            if let charToAdd = remainingStrStack.popLast() {
                textField.text = String(charToAdd)
            } else {
                break
            }
        }
        checkForValidity()
        remainingStrStack = []
    }
}

extension OTPStackView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
            setAllFieldColor(color: .black)
            showsWarningColor = false
        }
        textField.layer.borderColor = activeFieldBorderColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
        textField.layer.borderColor = inactiveFieldBorderColor
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        } else {
            if range.length == 0 {
                textField.text = string
                if let nextField = textField.nextTextField {
                    nextField.becomeFirstResponder()
                } else {
                    textField.resignFirstResponder()
                }
                return false
            }
            return true
        }
    }
}
