//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/26/23.
//
// manages everything related to messages: read data from Firestire in real-time and write to db as well

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    // we need to call getMessages in the initializer
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            // we want to make sure we have documents in our query snapshot first
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // similar to map but only returns non-nil values of the documents array
            // returns an optional message because if we run into an error we won't return a message
            self.messages = documents.compactMap { document -> Message? in
                // because function might throw an error
                do {
                    // take the document and get the data on this document and transform it into the Message model we created in the Message file
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp} // sorts messages by timestamp from oldest to newest
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
        // Firestore function might throw an error
        do {
            // create new Message instance
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            // save documents under collection messages
            // setData will convert newMessage into Firestore data
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
