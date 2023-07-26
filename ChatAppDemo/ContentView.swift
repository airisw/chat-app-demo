//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    // test the getMessage() from MessagesManager and see if can fetch messages from Firestore
    // to do this we need to instantiate MessagesManager as a StateObject
    @StateObject var messagesManager = MessagesManager()
    
    // temporary harcoded data while we don't use Firestore
//    var messageArray = ["Hello you", "How are you doing", "I'm doing great"]
    
    var body: some View {
        // renders TitleRow component
        VStack {
            VStack {
                TitleRow()
                
                // scroll screen to last sent message
                ScrollViewReader { proxy in
                    ScrollView {
    //                    ForEach(messages, id: \.self) { text in
    //                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
    //                    }
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight]) // modified in Extensions
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            // renders MessageField component
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
