//
//  MessageField.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/26/23.
//
// component for where user types the message and sends it

import SwiftUI

struct MessageField: View {
    // adds environment object
    @EnvironmentObject var messagesManager: MessagesManager
    
    // state that will change when the user inputs something in the message field
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message) // $message binds to state message
            Button {
//                print("Message sent") // prints once button is pressed
                messagesManager.sendMessage(text: message)
                message = "" // sets message state to empty string after is sent
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            // adds MessageManager instance to preview
            .environmentObject(MessagesManager())
    }
}

// creates custom text field that is a View to customize it later
struct CustomTextField: View {
    var placeholder: Text
    // Binding means we can pass a variable from one View to another and modify that variable outside that View
    // text is the user input in the text field
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            // $text has $ since it's a Binding value
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
