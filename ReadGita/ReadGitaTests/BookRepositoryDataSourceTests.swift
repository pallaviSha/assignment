//
//  BookRepositoryDataSourceTests.swift
//  CategoriesTests
//
//  Created by Pallavi Sharma on 13/10/23.
//

import XCTest
@testable import ReadGita

final class BookRepositoryDataSourceTests: XCTestCase {

    let dataSource = BookRepositoryDataSource()

       // You can create a mock URLSession here to simulate network requests for testing.

       func testGetBookAllChapters() {
           let expectation = XCTestExpectation(description: "Fetch all chapters")

           dataSource.getBookAllChapters { result in
               switch result {
               case .success(let chapters):
                   XCTAssertFalse(chapters.isEmpty)
               case .failure:
                   XCTFail("Fetching chapters should be successful.")
               }
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 6.0)
       }

       func testGetBookAllVerses() {
           let chapterNo = "1"
           let expectation = XCTestExpectation(description: "Fetch all verses for a chapter")

           dataSource.getBookAllVerses(chapterNo: chapterNo) { result in
               switch result {
               case .success(let verses):
                   XCTAssertFalse(verses.isEmpty)
               case .failure:
                   XCTFail("Fetching verses should be successful.")
               }
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 6.0)
       }

       func testGetBookPerticularVerses() {
           let chapterNo = "1"
           let versesNo = "1"
           let expectation = XCTestExpectation(description: "Fetch a particular verse")

           dataSource.getBookPerticularVerses(chapterNo: chapterNo, versesNo: versesNo) { result in
               switch result {
               case .success(let verse):
                   // Perform assertions on the returned verse
                   XCTAssertEqual(verse.verse_number, 1)
               case .failure:
                   XCTFail("Fetching a particular verse should be successful.")
               }
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 6.0)
       }

       func testGetPerticularBook() {
           let chapterNo = "1"
           let expectation = XCTestExpectation(description: "Fetch a particular chapter")

           dataSource.getParticularBook(chapterNo: chapterNo) { result in
               switch result {
               case .success(let chapter):
                   // Perform assertions on the returned chapter
                   XCTAssertEqual(chapter.chapter_number, 1)
               case .failure:
                   XCTFail("Fetching a particular chapter should be successful.")
               }
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 6.0)
       }
}
