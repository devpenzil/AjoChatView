//
//  ChatViewModal.swift
//  ChatViewPOC
//
//  Created by Ajo Alex on 05/03/25.
//

import Foundation

public final class ChatViewModel: ChatViewModelProtocol {
    public private(set) var messages: [Message] = []
    //Todo:- Add bulkmessages using [ChatMessage]
    public func addBulkMessages(_ bulkMessages: [Message]) {
        messages += bulkMessages
    }
    
    public init() {}
    
    public func addMessage(_ message: Message) {
        messages.append(message)
    }
    
    public func updateMessage(at index: Int, with newText: String) {
        guard index < messages.count else { return }
        messages[index].text = newText
    }
}
