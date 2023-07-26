//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//
// message bubble component
// it acceps one argument: message of Message type

import SwiftUI

struct MessageBubble: View {
    var message: Message
    
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            // if user taps MessageBubble, it will display time
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "Hello, it's me, Hu Tao! I'm messaging from Liyue but I'm going to visit Mondstadt in a couple weeks", received: false, timestamp: Date()))
        // Date() gives the timestamp right now
    }
}
