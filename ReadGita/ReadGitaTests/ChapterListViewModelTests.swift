//
//  ChapterListViewModelTests.swift
//  ReadGitaTests
//
//  Created by Pallavi Sharma on 16/10/23.
//

import XCTest
@testable import ReadGita

final class ChapterListViewModelTests: XCTestCase {

        var viewModel: ChapterListViewModel!
        var mockRepository: MockBookRepository!

        override func setUp() {
            super.setUp()
            mockRepository = MockBookRepository()
            viewModel = ChapterListViewModel(repository: mockRepository)
        }

        override func tearDown() {
            viewModel = nil
            mockRepository = nil
            super.tearDown()
        }

        func testInitialState() {
            // Check that the initial loading state is set to .idle.
            XCTAssertEqual(viewModel.loadingState, .idle)
        }

        func testGetChapterListContentSuccess() {
            // Simulate a successful data fetch from the repository.
            let chapters = [Chapter]() // Your test data
            mockRepository.getAllTheChapters = .success(chapters)

            viewModel.getChapterListContent()

            // Check that the loading state is updated to .loaded with the correct data.
            XCTAssertEqual(viewModel.loadingState, .loaded(chapters))
        }

        func testGetChapterListContentFailure() {
            // Simulate a failure when fetching data from the repository.
            let error = NSError(domain: "TestError", code: 42, userInfo: nil)
            mockRepository.getAllTheChapters = .failure(error)

            viewModel.getChapterListContent()

            // Check that the loading state is updated to .error with the correct error message.
            XCTAssertEqual(viewModel.loadingState, .error(error.localizedDescription))
        }

        func testGetChapterVerseListContentSuccess() {
            // Simulate a successful data fetch from the repository.
            let verses = [Verses]() // Your test data
            mockRepository.getAllVersesOfChapter = .success(verses)

            viewModel.getChapterVerseListContent(chapterNo: "1")

            // Check that the loading state is updated to .verseLoaded with the correct data.
            XCTAssertEqual(viewModel.loadingState, .verseLoaded(verses))
        }

        func testGetChapterVerseListContentFailure() {
            // Simulate a failure when fetching data from the repository.
            let error = NSError(domain: "TestError", code: 42, userInfo: nil)
            mockRepository.getAllVersesOfChapter = .failure(error)

            viewModel.getChapterVerseListContent(chapterNo: "1")

            // Check that the loading state is updated to .error with the correct error message.
            XCTAssertEqual(viewModel.loadingState, .error(error.localizedDescription))
        }
}

extension ChapterListViewModel.LoadingState: Equatable {
    public static func == (lhs: ChapterListViewModel.LoadingState, rhs: ChapterListViewModel.LoadingState) -> Bool {
        return true
    }
}

