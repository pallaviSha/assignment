//
//  BookRepositoryDataSourceProtocol.swift
//  ReadGita
//
//  Created by Pallavi Sharma on 16/10/23.
//

import Foundation

protocol BookRepositoryDataSourceProtocol {

    func getBookAllChapters(completion: @escaping (Result<[Chapter] , Error>) -> Void)

    func getBookAllVerses(chapterNo: String , completion: @escaping (Result<[Verses] , Error>) -> Void)

    func getBookPerticularVerses(chapterNo: String , versesNo: String , completion: @escaping (Result<Verses , Error>) -> Void)

    func getPerticularBook(chapterNo: String , completion: @escaping (Result<Chapter , Error>) -> Void)
}
