//
//  Message.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//
// creates Message struct that all messages must follow

import Foundation

// Identifiable protocol: each message can be uniquely identified with its ID
// Codable protocol: we can convert the data fetched from Firestore into this model, and can convert back again into Firestore model
struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
