//
//  PrivacyOptionCellCollectionViewCell.swift
//  Shaadi
//
//  Created by ROHIT DAS on 06/06/24.
//

import UIKit

class PrivacyOptionCell: UICollectionViewCell {
    private let button = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.numberOfLines = 0
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(hex: "#F4F4F4")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -20),
        ])
    }

    func configure(with title: String) {
        button.setTitle(title, for: .normal)
        button.sizeToFit()
    }
}
