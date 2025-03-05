//
//  File.swift
//  ChatViewPOC
//
//  Created by Ajo Alex on 05/03/25.
//

import Foundation

public protocol ChatViewModelProtocol {
    var messages: [Message] { get }
    func addMessage(_ message: Message)
}
 
