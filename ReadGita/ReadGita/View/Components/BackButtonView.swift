//
//  BackButtonView.swift
//  Categories
//
//  Created by Pallavi Sharma on 11/10/23.
//

import SwiftUI

struct BackButtonView: View {

    var dismiss: DismissAction

    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(ImageConstant.arrow)
                .frame(width: 25 , height: 25)
        })
    }
}
