//
//  PageViewModelTests.swift
//  ReadGitaTests
//
//  Created by Pallavi Sharma on 16/10/23.
//

import XCTest
@testable import ReadGita

final class PageViewModelTests: XCTestCase {

    var viewModel: PageViewModel!
    let mockRepository = MockBookRepository()

    override func setUp() {
       super.setUp()
        viewModel = PageViewModel(repository: mockRepository)
    }

    override func tearDown() {
       viewModel = nil
       super.tearDown()
    }

    func testInitialState() {
        // Check that the initial loadingState is idle
        XCTAssertEqual(viewModel.loadingState, PageViewModel.LoadingState.idle)
    }

    func testGetChapterAllLoading() {
        viewModel.getChapterAll()

        // After calling getChapterAll(), loadingState should be set to loading
        XCTAssertEqual(viewModel.loadingState, PageViewModel.LoadingState.loading)
    }

    func testGetChapterAllSuccess() {
        // Create a mock data array for success case
       let mockData = [Chapter]()

        // Replace the repository in the viewModel with a mock repository that returns success
        mockRepository.getAllTheChapters = .success(mockData)
        viewModel.getChapterAll()
        // After calling getChapterAll() with a mock success response, loadingState should be loaded with the mock data
        XCTAssertEqual(viewModel.loadingState, PageViewModel.LoadingState.loaded(mockData))
    }

    func testGetChapterAllFailure() {
        // Create a mock error for failure case
        let mockError = NSError(domain: "TestError", code: 0, userInfo: nil)

        // Replace the repository in the viewModel with a mock repository that returns failure
        mockRepository.getAllTheChapters = .failure(mockError)

        viewModel.getChapterAll()

        // After calling getChapterAll() with a mock failure response, loadingState should be error with the mock error description
        XCTAssertEqual(viewModel.loadingState, PageViewModel.LoadingState.error(mockError.localizedDescription))
    }
}

extension PageViewModel.LoadingState: Equatable {
    public static func == (lhs: ReadGita.PageViewModel.LoadingState, rhs: ReadGita.PageViewModel.LoadingState) -> Bool {
        return true
    }
}
