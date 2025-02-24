//
//  SingleMessage.swift
//  ChatBubble
//
//  Created by Ajo Alex on 20/02/25.
//

import UIKit

class SingleMessage: UICollectionViewCell{
    let messageLabel = UILabel()
    let bubbleView = UIView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        bubbleView.layer.cornerRadius = 15
        bubbleView.clipsToBounds = true
        addSubview(bubbleView)
        
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        bubbleView.addSubview(messageLabel)
        
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                   
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with message: Message) {
           messageLabel.text = message.text
           bubbleView.backgroundColor = message.incoming ? .lightGray : .blue
           messageLabel.textColor = message.incoming ? .black : .white
           
           if message.incoming {
               bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
               bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -60).isActive = true
           } else {
               bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
               bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 60).isActive = true
           }
       }
}
