//
//  VerseContentView.swift
//  Categories
//
//  Created by Pallavi Sharma on 13/10/23.
//

import SwiftUI

struct VerseContentView: View {

    //MARK: Variable
    var verses: Verses
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                BackButtonView(dismiss: dismiss)
                Spacer()
            }
            ScrollView {
                VStack(alignment: .center) {
                    VStack(spacing: 5) {
                        Text("\(Constant.BG) \(verses.chapter_number ?? 0).\(verses.verse_number ?? 0)")
                            .font(.custom(Font.medium, size: 20.0))
                            .multilineTextAlignment(.center)
                        Text("\(verses.text ?? "")")
                            .multilineTextAlignment(.center)
                            .font(.custom(Font.medium, size: 20.0))
                            .foregroundStyle(.orange)
                        Divider()
                        Text("\(verses.transliteration ?? "")")
                            .multilineTextAlignment(.center)
                    }
                    .padding(30)
                    Text("\(verses.word_meanings ?? "")")
                        .multilineTextAlignment(.center)
                }
            }
            .accessibilityIdentifier("verseContentScrollView")
        }
        .padding(20)
        .navigationBarBackButtonHidden(true)
    }
}
