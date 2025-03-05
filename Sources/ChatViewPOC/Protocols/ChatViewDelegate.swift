//
//  File.swift
//  ChatViewPOC
//
//  Created by Ajo Alex on 05/03/25.
//

import Foundation

public protocol ChatViewDelegate: AnyObject {
    func didShowMessage(_ message: String)
    func didShowTypingIndicator(_ isTyping: Bool)
}
