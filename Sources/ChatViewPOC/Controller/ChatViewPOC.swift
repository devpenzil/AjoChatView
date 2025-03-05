// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public class ChatViewPOC:UIViewController, UICollectionViewDataSource{
    //    public var messages : [Message] = []
    public var chatViewModel: ChatViewModel
    public var isTyping : Bool = false
    public var theme : chatUITheme
    private var collectionView: UICollectionView!
    private var chatDelegate: ChatViewDelegate
    
    fileprivate func setupColectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 50)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(SingleMessage.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TypingIndicatorCell.self, forCellWithReuseIdentifier: "TypingIndicatorCell")
        collectionView.backgroundColor = theme.chatViewBackgroundColor
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    public init(theme:chatUITheme, viewModel: ChatViewModel, chatDelegate: ChatViewDelegate) {
        self.theme = theme
        self.chatViewModel = viewModel
        self.chatDelegate = chatDelegate
        super.init(nibName: nil, bundle: nil)
        setupColectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatViewModel.messages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if chatViewModel.messages[indexPath.row].text == "Typing"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypingIndicatorCell", for: indexPath) as! TypingIndicatorCell
            cell.configure(with: theme)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SingleMessage
            cell.configure(with: chatViewModel.messages[indexPath.row], with: theme)
            return cell
        }
    }

        
    public func scrollToBottom() {
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    public func addSenderMessage(content: String){
        chatViewModel.addMessage(Message(text: content, incoming: false))
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.insertItems(at: [indexPath])
      scrollToBottom()
    }
    
    public func addRecieverMessage(content: String){
        chatViewModel.addMessage(Message(text: content, incoming: true))
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.insertItems(at: [indexPath])
      scrollToBottom()
        
    }
    
    public func showTypingIndicator(_ isTyping: Bool) {
        self.isTyping = isTyping
        chatViewModel.addMessage(Message(text: "Typing", incoming: true))
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.insertItems(at: [indexPath])
        scrollToBottom()
        chatDelegate.didShowTypingIndicator(isTyping)
    }
    
    fileprivate func getLastItemIndexPath() -> IndexPath? {
        let lastItem = self.chatViewModel.messages.count - 1
        guard lastItem >= 0 else { return nil }
        return IndexPath(item: lastItem, section: 0)
    }

}

