//
//  File.swift
//  AjoChatView
//
//  Created by Ajo Alex on 03/03/25.
//

import Foundation
import UIKit

public class TypingIndicatorCell: UICollectionViewCell {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Typing..."
        label.textAlignment = .left
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with theme: chatUiTheme) {
        label.textColor = theme.RecieveMessageTextColor
        contentView.backgroundColor = theme.RecieveMessageTextColor.withAlphaComponent(0.5)
    }
}
