//
//  LoadingView.swift
//  Categories
//
//  Created by Pallavi Sharma on 13/10/23.
//

import SwiftUI

struct LoadingView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            colorScheme == .dark ? Color.black : Color.white
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(x: 1.4, y: 1.4, anchor: .center)
                .offset(x: .zero, y: -25.0)
                .tint(.orange)
        }
    }
}

#Preview {
    LoadingView()
}
