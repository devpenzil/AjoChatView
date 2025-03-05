//
//  File.swift
//  AjoChatView
//
//  Created by Ajo Alex on 03/03/25.
//

import Foundation
import UIKit

public struct Message {
    public let text: String
    public let incoming: Bool
    
    public init(text: String, incoming: Bool) {
        self.text = text
        self.incoming = incoming
    }
}

public struct chatUITheme  {
    public var sentMessageCellColor: UIColor
    public var sentMessageTextColor: UIColor
    public var recieveMessageCellColor: UIColor
    public var recieveMessageTextColor: UIColor
    public var chatViewBackgroundColor: UIColor
    
    public init(sentMessageCellColor: UIColor = .white,
                sentMessageTextColor: UIColor = .white,
                receiveMessageCellColor: UIColor = .white,
                receiveMessageTextColor: UIColor = .white,
                chatViewBackgroundColor:UIColor = .white) {
        self.sentMessageCellColor = sentMessageCellColor
        self.sentMessageTextColor = sentMessageTextColor
        self.recieveMessageCellColor = receiveMessageCellColor
        self.recieveMessageTextColor = receiveMessageTextColor
        self.chatViewBackgroundColor = chatViewBackgroundColor
    }
}
