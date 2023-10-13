//
//  ChapterView.swift
//  Categories
//
//  Created by Pallavi Sharma on 11/10/23.
//

import SwiftUI

struct ChapterView: View {

    //@Environment(\.dismiss) private var dismiss

    var chapters: [Chapter]
    @State var pageIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            TabView(selection: $pageIndex) {
                ForEach(0..<chapters.count , id: \.self) { index in
                    ChapterContentView(chapter: chapters[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            HStack(spacing: 5) {
                Text("Chapter")
                    .font(.custom(Font.regular, size: 16.0))
                Text("\(pageIndex+1)")
                    .font(.custom(Font.medium, size: 16.0))
                    .foregroundStyle(.orange)
                Text("of")
                    .font(.custom(Font.regular, size: 16.0))
                Text("\(chapters.count)")
                    .font(.custom(Font.medium, size: 16.0))
                    .foregroundStyle(.orange)
            }
        }
        .padding(20)
        .ignoresSafeArea()
    }

    func getPageContents(data: [Chapter]) -> [ChapterContentView] {
        var pageContents: [ChapterContentView] = []
        for index in 0..<data.count {
            let pageCon = ChapterContentView(chapter: data[index])
            pageContents.append(pageCon)
        }
        return pageContents
    }

    // MARK: Loading View
    @ViewBuilder private func loadingView() -> some View {
        ZStack {
            Color.white
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(x: 1.4, y: 1.4, anchor: .center)
                .offset(x: .zero, y: -25.0)
        }
    }
}
