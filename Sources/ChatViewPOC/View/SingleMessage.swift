//
//  SingleMessage.swift
//  ChatBubble
//
//  Created by Ajo Alex on 20/02/25.
//

import UIKit

public class SingleMessage: UICollectionViewCell{
    public let messageLabel = UILabel()
    public let bubbleView = UIView()
    
    public override init(frame: CGRect){
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
        bubbleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.8),
            
            
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -60),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with message: Message, with theme: chatUITheme) {
        messageLabel.text = message.text
        bubbleView.backgroundColor = message.incoming ? theme.recieveMessageCellColor : theme.sentMessageCellColor
        messageLabel.textColor = message.incoming ? theme.recieveMessageTextColor  : theme.sentMessageTextColor
    }
}
public class SingleMessageSender: UICollectionViewCell{
    public let messageLabel = UILabel()
    public let bubbleView = UIView()
    
    public override init(frame: CGRect){
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
        bubbleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner]
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.8),
            
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with message: Message, with theme: chatUITheme) {
        messageLabel.text = message.text
        bubbleView.backgroundColor = message.incoming ? theme.recieveMessageCellColor : theme.sentMessageCellColor
        messageLabel.textColor = message.incoming ? theme.recieveMessageTextColor  : theme.sentMessageTextColor
    }
}

public class AnimatedLastRecieverMessage: UICollectionViewCell{
    public let messageLabel = UILabel()
    public let bubbleView = UIView()
    
    public override init(frame: CGRect){
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
        bubbleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.8),
            
            
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -60),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with message: Message, with theme: chatUITheme) {
        animateMessageLabel(message: message.text, messageLabel: messageLabel)
        bubbleView.backgroundColor = message.incoming ? theme.recieveMessageCellColor : theme.sentMessageCellColor
        messageLabel.textColor = message.incoming ? theme.recieveMessageTextColor  : theme.sentMessageTextColor
    }
    
    func animateMessageLabel(message: String, messageLabel: UILabel) {
        var words = ""
        Task {
            for letter in message {
                words = words + String(letter)
                messageLabel.text = words
                try await Task.sleep(nanoseconds: 100_000_000)  
            }
        }
    }
}
