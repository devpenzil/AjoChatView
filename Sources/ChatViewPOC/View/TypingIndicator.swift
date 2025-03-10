//
//  TypingIndicator.swift
//  AjoChatView
//
//  Created by Ajo Alex on 03/03/25.
//

import Foundation
import UIKit

public class TypingIndicatorCell: UICollectionViewCell {
    public let typingBubbleView = UIView()
    
    
    
    let jeremyGif = UIImage(named: "67946056.jpg")
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        typingBubbleView.layer.cornerRadius = 15
        typingBubbleView.clipsToBounds = true
        
        
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: contentView.frame.size.width - 40, height: 150.0)
        
        typingBubbleView.addSubview(imageView)
        typingBubbleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typingBubbleView)

        NSLayoutConstraint.activate([
            typingBubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            typingBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            typingBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            typingBubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with theme: chatUITheme) {
        
        typingBubbleView.backgroundColor = theme.recieveMessageCellColor
        typingBubbleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
