//
//  ChapterContentView.swift
//  Categories
//
//  Created by Pallavi Sharma on 11/10/23.
//

import SwiftUI

struct ChapterContentView: View {

    // MARK: Variable
    var chapter: Chapter

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("\(Constant.chapter) \(chapter.chapter_number ?? 0)")
                    .font(.custom(Font.medium, size: 20.0))
                    .foregroundStyle(.orange)
                    .multilineTextAlignment(.center)
                Text("\(Constant.chapterName) \(chapter.name ?? "")")
                    .multilineTextAlignment(.center)
                    .font(.custom(Font.bold, size: 25.0))
                Text("\(Constant.chapterMeaning) \(chapter.name_meaning ?? "")")
                    .multilineTextAlignment(.center)
                Text("\(chapter.chapter_summary ?? "")")
                    .font(.custom(Font.medium, size: 18.0))
                    .padding(20)
                    .multilineTextAlignment(.center)
            }
        }
        .accessibilityIdentifier("chapterContent")
    }
}
