//
//  PageView.swift
//  Categories
//
//  Created by Pallavi Sharma on 11/10/23.
//

import SwiftUI

struct PageView: View {

    // MARK: Enviroment Variable for navigating to previous screen
    @Environment(\.dismiss) private var dismiss

    // MARK: Variables
    @ObservedObject var viewModel: PageViewModel
    @State var pageIndex: Int

    var body: some View {
        NavigationView(content: {
            VStack{
                switch viewModel.loadingState {
                case .idle:
                    Spacer()
                case .loaded(let chapterData):
                    pageHeaderView(chpterNo: "\(chapterData[$pageIndex.wrappedValue].chapter_number ?? 0)")
                        .frame(height: 60)
                    getChapterView(chapters: chapterData)
                case .error(_):
                    Spacer()
                case .loading:
                    LoadingView()
                }
            }
            .frame(alignment: .top)
        })
        .navigationBarBackButtonHidden(true)
        .onAppear{
            viewModel.getChapterAll()
        }
    }

    /**
        Creates a view that displays a TabView with ChapterContentView pages and a pagination indicator.

        - Parameters:
            - chapters: An array of Chapter objects to be displayed in the TabView.

        - Returns: A SwiftUI View containing a TabView with chapter content, pagination, and spacing.

        This method creates a SwiftUI view that displays a TabView containing chapters' content. The TabView allows the user to swipe through different chapters. It also displays a pagination indicator showing the current chapter and the total number of chapters.
     */
    @ViewBuilder private func getChapterView(chapters: [Chapter]) -> some View {
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
    /**
        Creates a page header view with back button and top menu options based on a chapter number.

        - Parameters:
            - chpterNo: A string representing the chapter number.

        - Returns: A SwiftUI View displaying the page header with menu options.

        This method generates a SwiftUI view for the header of a page, specific to a given chapter. It includes a back button, a menu with icons and text, and a divider. The back button allows the user to navigate back or dismiss the current view. The menu options provide navigation to different parts of the application based on the selected view and the provided chapter number.
     */
    @ViewBuilder private func pageHeaderView(chpterNo: String) -> some View {
        VStack(spacing: 2) {
            HStack(spacing: 20) {
                BackButtonView(dismiss: dismiss)
                Spacer()
                topMenuContentView(image: ImageConstant.book, text: Constant.verses, view: ChapterListView(viewModel: ChapterListViewModel(repository: viewModel.repository), listTypeValue: .verse(chapterNo: chpterNo)))
            }
            Divider()
                .background(.orange)
        }
        .frame(alignment: .trailing)
        .padding(10)
    }

    /**
        Creates a top menu content view with an icon and text.

        - Parameters:
            - image: A string representing the system image name.
            - text: A string for the menu item's text.
            - view: A SwiftUI view to navigate to upon selection.

        - Returns: A SwiftUI View displaying the menu item with an icon and text.

        This method generates a SwiftUI view for a menu item that includes an icon and text. It is intended to be used within a page header for navigation to different parts of the application.
     */
    @ViewBuilder private func topMenuContentView(image: String , text: String, view: some View) -> some View {
        NavigationLink(destination: view) {
            VStack(spacing:5) {
                Image(systemName: image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30 , height: 30)
                Text(text)
                    .font(.custom(Font.medium, size: 16.0))
                    .foregroundStyle(.orange)
            }
        }
        .buttonStyle(.plain)
    }
}
