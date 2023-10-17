//
//  MockBookRepository.swift
//  ReadGitaTests
//
//  Created by Pallavi Sharma on 16/10/23.
//

import Foundation
@testable import ReadGita


// Create a mock repository conforming to `BookRepositoryProtocol` for testing purposes.
class MockBookRepository: BookRepositoryProtocol {

    var getAllTheChapters: Result<[Chapter], Error>?
    var getAllVersesOfChapter: Result<[Verses], Error>?
    var getTheChapters: Result<Chapter, Error>?
    var getVersesOfChapter: Result<Verses, Error>?

    func getAllTheChapters(completion: @escaping (Result<[ReadGita.Chapter], Error>) -> Void) {
        if let result = getAllTheChapters {
            completion(result)
        }
    }

    func getPerticularChapter(_ chapterNo: String, completion: @escaping (Result<ReadGita.Chapter, Error>) -> Void) {
        if let result = getTheChapters {
            completion(result)
        }
    }

    func getAllVersesOfChapter(_ chapterNo: String, completion: @escaping (Result<[ReadGita.Verses], Error>) -> Void) {
        if let result = getAllVersesOfChapter {
            completion(result)
        }
    }

    func getPerticularVerseOfChapter(_ chapterNo: String, _ versesNo: String, completion: @escaping (Result<ReadGita.Verses, Error>) -> Void) {
        if let result = getVersesOfChapter {
            completion(result)
        }
    }
}
