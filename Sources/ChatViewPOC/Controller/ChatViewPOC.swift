// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

/// `ChatViewPOC` is a `UIViewController` subclass that manages a chat interface using a `UICollectionView`. It supports displaying messages, typing indicators, and animated entries for the last received message.
/// - Parameters:
///   - chatViewModel: The view model that manages the chat messages.
///   - isTyping: A Boolean value indicating whether the user is typing.
///   - theme: The visual style of the chat.
///   - animatedEntry: A Boolean value indicating whether the last received message should be animated.
public class ChatViewPOC: UIViewController, UICollectionViewDataSource {
    public var chatViewModel: ChatViewModel
    public var isTyping: Bool = false
    public var theme: chatUITheme
    public var animatedEntry: Bool = false
    
    private var collectionView: UICollectionView!
    private var chatDelegate: ChatViewDelegate
    
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 50)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(SingleMessage.self, forCellWithReuseIdentifier: "RecieverCell")
        collectionView.register(SingleMessageSender.self, forCellWithReuseIdentifier: "SenderCell")
        collectionView.register(TypingIndicatorCell.self, forCellWithReuseIdentifier: "TypingIndicatorCell")
        collectionView.register(AnimatedLastRecieverMessage.self, forCellWithReuseIdentifier: "AnimatedCell")
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
    
    public init(theme: chatUITheme, viewModel: ChatViewModel, chatDelegate: ChatViewDelegate, animatedEntry: Bool) {
        self.theme = theme
        self.chatViewModel = viewModel
        self.chatDelegate = chatDelegate
        self.animatedEntry = animatedEntry
        super.init(nibName: nil, bundle: nil)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatViewModel.messages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if chatViewModel.messages[indexPath.row].text == "Typing" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypingIndicatorCell", for: indexPath) as! TypingIndicatorCell
            cell.configure(with: theme)
            return cell
        } else {
            let isLastItem = indexPath.row == chatViewModel.messages.count - 1
            
            if !isLastItem && chatViewModel.messages[indexPath.row].incoming == true && animatedEntry {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimatedCell", for: indexPath) as! AnimatedLastRecieverMessage
                cell.configure(with: chatViewModel.messages[indexPath.row], with: theme)
                return cell
            }else if chatViewModel.messages[indexPath.row].incoming == true{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecieverCell", for: indexPath) as! SingleMessage
                cell.configure(with: chatViewModel.messages[indexPath.row], with: theme)
                return cell}
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SenderCell", for: indexPath) as! SingleMessageSender
                cell.configure(with: chatViewModel.messages[indexPath.row], with: theme)
                return cell
                
            }
        }
    }
    
    public func scrollToBottom() {
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    /// Add a new sender message
    /// - Parameter content: Message string
    public func addSenderMessage(content: String) {
        chatViewModel.addMessage(Message(text: content, incoming: false))
        performBatchUpdates()
    }
    
    /// Add a new reciever message
    /// - Parameter content: Message string
    public func addReceiverMessage(content: String) {
        chatViewModel.addMessage(Message(text: content, incoming: true))
        performBatchUpdates()
    }
    
    /// Control typing indicator from sender side
    /// - Parameter isTyping: Boolean indicates the sender typing or not
    public func showTypingIndicator(_ isTyping: Bool) {
        self.isTyping = isTyping
        chatViewModel.addMessage(Message(text: "Typing", incoming: true))
        performBatchUpdates()
        chatDelegate.didShowTypingIndicator(isTyping)
    }
    
    fileprivate func getLastItemIndexPath() -> IndexPath? {
        let lastItem = self.chatViewModel.messages.count - 1
        guard lastItem >= 0 else { return nil }
        return IndexPath(item: lastItem, section: 0)
    }
    
    private func performBatchUpdates() {
        guard let indexPath = getLastItemIndexPath() else { return }
        collectionView.performBatchUpdates({
            collectionView.insertItems(at: [indexPath])
        }, completion: { _ in
            self.scrollToBottom()
        })
    }
    
    /// Update any message in ChatViewModel
    /// - Parameters:
    ///   - index: Position of updating message
    ///   - newText: Updating message string
    public func updateMessage(at index: Int, with newText: String) {
        chatViewModel.updateMessage(at: index, with: newText)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.reloadItems(at: [indexPath])
    }
    
    /// Update last message of ChatViewModel
    /// - Parameter newText: New message string
    public func updateLastMessage(with newText: String) {
        guard let indexPath = getLastItemIndexPath() else { return }
        chatViewModel.updateMessage(at: indexPath.item, with: newText)
        collectionView.reloadItems(at: [indexPath])
    }
}

