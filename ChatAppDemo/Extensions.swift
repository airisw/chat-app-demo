//
//  Extensions.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//
// Extension for adding rounded corners to specific corners (top of ScrollView in ContentView)

import Foundation
import SwiftUI

extension View {
    // we are changing the cornerRadius from SwiftUI to add radius and select specific corners to add cornerRadius
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
