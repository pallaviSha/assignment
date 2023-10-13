//
//  BookRepositoryProtocol.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import Foundation

protocol BookRepositoryProtocol {

    func getAllTheChapters(completion: @escaping (Result<[Chapter] , Error>) -> Void)

    func getPerticularChapter(_ chapterNo: String , completion: @escaping (Result<Chapter , Error>) -> Void)

    func getAllVersesOfChapter(_ chapterNo: String, completion: @escaping (Result<[Verses] , Error>) -> Void)

    func getPerticularVerseOfChapter(_ chapterNo: String , _ versesNo: String , completion: @escaping (Result<Verses , Error>) -> Void)
}
