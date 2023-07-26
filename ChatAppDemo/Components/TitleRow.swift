//
//  TitleRow.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//
// header component with picture, name, online status, phone icon

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://ih1.redbubble.net/image.2594387867.3293/st,small,845x845-pad,1000x1000,f8f8f8.jpg")
    var name = "Hu Tao"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            // component fills the whole screen
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach")) // visualize size of TitleRow
    }
}
