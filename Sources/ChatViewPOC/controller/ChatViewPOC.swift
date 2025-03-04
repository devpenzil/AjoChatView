// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public class ChatViewPOC:UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    public var messages : [Message] = []
    public var isTyping : Bool = false
    public var theme : chatUiTheme
    
    public init(frame: CGRect, theme:chatUiTheme) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: frame.width, height: 50)
        
        self.theme = theme
        
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.register(SingleMessage.self, forCellWithReuseIdentifier: "cell")
        self.register(TypingIndicatorCell.self, forCellWithReuseIdentifier: "TypingIndicatorCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count + (isTyping ? 1 : 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isTyping && indexPath.item == messages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypingIndicatorCell", for: indexPath) as! TypingIndicatorCell
            cell.configure(with: theme)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SingleMessage
            cell.configure(with: messages[indexPath.item], with: theme)
            return cell
        }
    }
    
    public func scrollToBottom() {
        let lastItem = self.messages.count - 1
        let indexPath = IndexPath(item: lastItem, section: 0)
        self.insertItems(at: [indexPath])
        self.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    public func addSenderMessage(content: String){
        messages.append(Message(text: content, incoming: false))
        scrollToBottom()
    }
    
    public func addRecieverMessage(content: String){
        messages.append(Message(text: content, incoming: true))
        scrollToBottom()
    }
}

