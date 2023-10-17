//
//  BookRepository.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import Foundation

struct BookRepository {
    let dataSource : BookRepositoryDataSourceProtocol
}

extension BookRepository : BookRepositoryProtocol {
    func getAllTheChapters(completion: @escaping (Result<[Chapter], Error>) -> Void) {
        dataSource.getBookAllChapters { result in
            completion(result)
        }
    }
    
    func getPerticularChapter(_ chapterNo: String, completion: @escaping (Result<Chapter, Error>) -> Void) {
        dataSource.getPerticularBook(chapterNo: chapterNo) { result in
            completion(result)
        }
    }
    
    func getAllVersesOfChapter(_ chapterNo: String, completion: @escaping (Result<[Verses], Error>) -> Void) {
        dataSource.getBookAllVerses(chapterNo: chapterNo) { result in
            completion(result)
        }
    }
    
    func getPerticularVerseOfChapter(_ chapterNo: String, _ versesNo: String, completion: @escaping (Result<Verses, Error>) -> Void) {
        dataSource.getBookPerticularVerses(chapterNo: chapterNo, versesNo: versesNo) { result in
            completion(result)
        }
    }
}
