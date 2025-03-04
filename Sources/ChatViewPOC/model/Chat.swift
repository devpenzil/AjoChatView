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

public struct chatUiTheme  {
    public var sentMessageCellColor: UIColor
    public var sentMessageTextColor: UIColor
    public var RecieveMessageCellColor: UIColor
    public var RecieveMessageTextColor: UIColor
    
    public init(sentMessageCellColor: UIColor = .white,
                  sentMessageTextColor: UIColor = .red,
                  receiveMessageCellColor: UIColor = .white,
                  receiveMessageTextColor: UIColor = .white) {
          self.sentMessageCellColor = sentMessageCellColor
          self.sentMessageTextColor = sentMessageTextColor
          self.RecieveMessageCellColor = receiveMessageCellColor
          self.RecieveMessageTextColor = receiveMessageTextColor
      }
}
