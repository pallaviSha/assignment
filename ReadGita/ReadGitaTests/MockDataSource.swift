//
//  MockDataSource.swift
//  ReadGitaTests
//
//  Created by Pallavi Sharma on 16/10/23.
//

import Foundation
@testable import ReadGita

class MockDataSource: BookRepositoryDataSourceProtocol {

    var getAllChaptersResult: Result<[Chapter], Error>?
    var getPerticularChapterResult: Result<Chapter, Error>?
    var getAllVersesResult: Result<[Verses], Error>?
    var getPerticularVerseResult: Result<Verses, Error>?

    func getBookAllChapters(completion: @escaping (Result<[Chapter], Error>) -> Void) {
        if let getAllChaptersResult = getAllChaptersResult {
            completion(getAllChaptersResult)
        }
    }

    func getPerticularBook(chapterNo: String, completion: @escaping (Result<Chapter, Error>) -> Void) {
        if let getPerticularChapterResult = getPerticularChapterResult {
            completion(getPerticularChapterResult)
        }
    }

    func getBookAllVerses(chapterNo: String, completion: @escaping (Result<[Verses], Error>) -> Void) {
        if let getAllVersesResult = getAllVersesResult {
            completion(getAllVersesResult)
        }
    }

    func getBookPerticularVerses(chapterNo: String, versesNo: String, completion: @escaping (Result<Verses, Error>) -> Void) {
        if let getPerticularVerseResult = getPerticularVerseResult {
            completion(getPerticularVerseResult)
        }
    }
}
