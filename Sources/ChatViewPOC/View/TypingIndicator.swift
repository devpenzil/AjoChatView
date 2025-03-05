//
//  TypingIndicator.swift
//  AjoChatView
//
//  Created by Ajo Alex on 03/03/25.
//

import Foundation
import UIKit

public class TypingIndicatorCell: UICollectionViewCell {
    
    private let typingImageView: UIImageView
    public let typingBubbleView = UIView()
    
    
    
    let jeremyGif = UIImage.gifImageWithName("TypingAnimation")
       
    
 

    override init(frame: CGRect) {
        self.typingImageView = UIImageView()
        super.init(frame: frame)
        
        // Bubble view config for the typing indicator
        typingBubbleView.layer.cornerRadius = 15
        typingBubbleView.clipsToBounds = true
        
    
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: contentView.frame.size.width - 40, height: 150.0)
       // contentView.addSubview(imageView)
        
        
//        contentView.addSubview(typingBubbleView)
        
        
        
        typingImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        typingImageView.image = jeremyGif
        typingBubbleView.addSubview(typingImageView)
        typingBubbleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typingBubbleView)
        
        
        
        
        NSLayoutConstraint.activate([
            // Bubble
            typingBubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            typingBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            typingBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            typingBubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
//
            // Typing Image
            
            //            typingImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            //                       typingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            typingImageView.widthAnchor.constraint(equalToConstant: 50),
//            typingImageView.heightAnchor.constraint(equalToConstant: 50),
            //                       typingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with theme: chatUITheme) {
        
        typingBubbleView.backgroundColor = theme.recieveMessageCellColor
        
        // Border radius for the bubble
        typingBubbleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
//        // To make the bubble stick to the left side of the screen
//        typingBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        typingBubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -60).isActive = true
    }
}
