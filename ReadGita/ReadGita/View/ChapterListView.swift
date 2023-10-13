//
//  ChapterListView.swift
//  Categories
//
//  Created by Pallavi Sharma on 11/10/23.
//

import SwiftUI

struct ChapterListView: View {

    // MARK: Variable
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ChapterListViewModel
    @State var listTypeValue: ListType

    enum ListType : Equatable {
        case chapter
        case verse(chapterNo: String = "")
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                HStack {
                    BackButtonView(dismiss: dismiss)
                    Spacer()
                    Text(
                        listTypeValue == .chapter ?
                        Constant.chapters : Constant.verses)
                        .frame(alignment: .center)
                        .font(.custom(Font.bold, size: 20.0))
                    Spacer()
                }
                switch viewModel.loadingState {
                case .idle:
                    Spacer()
                case .error(_):
                    Spacer()
                case .loaded(let chapters):
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(0..<chapters.count,id:\.self) { index in
                                NavigationLink(destination: PageView(viewModel: PageViewModel(repository: viewModel.repository), pageIndex: index)) {
                                    getListView(chapter: chapters[index])
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                case .loading:
                    LoadingView()
                case .verseLoaded(let verse):
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(0..<verse.count,id:\.self) { index in
                                NavigationLink(destination: VerseContentView(verses: verse[index])) {
                                    getVerseListView(verse: verse[index])
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .padding(.top , 20)
            .padding(.horizontal , 20)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .onAppear{
            switch listTypeValue {
            case .chapter:
                viewModel.getChapterListContent()
            case .verse(let chapterNo):
                viewModel.getChapterVerseListContent(chapterNo: chapterNo)
            }
        }
    }

    /**
        Creates a view for displaying a single item within a list, typically a chapter.

        - Parameters:
            - chapter: A `Chapter` object representing the item to be displayed.

        - Returns: A SwiftUI View displaying the item, often a chapter.

        This method generates a SwiftUI view for displaying a single item, typically a chapter, within a list. It includes the item's number, name, and an arrow icon for navigation. The number is highlighted with an orange background, and the name is displayed in a bold font with custom styling. The method provides a consistent format for displaying list items, making it visually appealing and user-friendly.
     */
    @ViewBuilder private func getListView(chapter: Chapter) -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Text("\(chapter.chapter_number ?? 0)")
                        .font(.custom(Font.bold, size: 20.0))
                        .frame(width: 40 , height: 40)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    HStack(content: {
                        Text(Constant.name)
                            .font(.custom(Font.medium, size: 20.0))
                        Text("\(chapter.name ?? "")")
                            .font(.custom(Font.bold, size: 16.0))
                            .foregroundStyle(.orange)
                    })
                }
                Divider()
            }
            Spacer()
            Image(ImageConstant.rightArrow)
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .padding(10)
        }
        .frame(height: 80)
    }

    /**
        Creates a view for displaying a single verse within a list.

        - Parameters:
            - verse: A `Verses` object representing the verse to be displayed.

        - Returns: A SwiftUI View displaying the verse.

        This method generates a SwiftUI view for displaying a single verse within a list. It includes the verse number, the verse text, and an arrow icon. The verse number is highlighted with an orange background, and the text may be truncated to fit within the view. The method provides a consistent format for displaying verses in a list.
     */
    @ViewBuilder private func getVerseListView(verse: Verses) -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Text("\(verse.verse_number ?? 0)")
                        .font(.custom(Font.bold, size: 20.0))
                        .frame(width: 40 , height: 40)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    HStack(content: {
                        Text("\(verse.text ?? "")")
                            .lineLimit(2)
                            .font(.custom(Font.bold, size: 16.0))
                            .foregroundStyle(.orange)
                    })
                }
                Divider()
            }
            Spacer()
            Image(ImageConstant.rightArrow)
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .padding(10)
        }
        .frame(height: 80)
    }
}
