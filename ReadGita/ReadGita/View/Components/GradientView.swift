//
//  GradientView.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.orange, .white, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    GradientView()
}
