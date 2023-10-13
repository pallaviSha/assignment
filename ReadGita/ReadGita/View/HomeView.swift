//
//  HomeView.swift
//  Categories
//
//  Created by Pallavi Sharma on 10/10/23.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView(content: {
            ZStack {
                GradientView()
                VStack(spacing: 20) {
                    Spacer()
                    Text(Constant.title)
                        .font(.custom(Font.bold, size: 22.0))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Spacer()
                    NavigationLink(destination: PageView(viewModel: PageViewModel(repository: BookRepository(dataSource: BookRepositoryDataSource())), pageIndex: 0)) {
                        Text(Constant.startNew)
                            .font(.custom(Font.medium, size: 16.0))
                            .frame(width: 200 , height: 60)
                            .tint(Color.black)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                            .shadow(radius: 2)
                    }
                    NavigationLink(destination: ChapterListView(viewModel: ChapterListViewModel(repository: BookRepository(dataSource: BookRepositoryDataSource())), listTypeValue: .chapter), label: {
                        Text(Constant.chooseChapter)
                            .font(.custom(Font.bold, size: 16.0))
                            .foregroundStyle(.black)
                    })
                    .buttonStyle(.plain)
                    .frame(alignment: .bottom)
                }
            }
        })
    }
}

#Preview {
    HomeView()
}
