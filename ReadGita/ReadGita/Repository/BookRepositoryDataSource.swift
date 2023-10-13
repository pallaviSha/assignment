//
//  BookRepositoryDataSource.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import Foundation

struct BookRepositoryDataSource {

    private func getHeaders() -> [String:String] {
        let headers = [
            "X-RapidAPI-Key": "9854f0a907mshef4fc85d3611578p13999cjsna24c082edc6b",
            "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com"
        ]
        return headers
    }

    private func getAllChapterNetworkRequest() -> NSMutableURLRequest? {
        var request: NSMutableURLRequest?
        if let url = URL.init(string: "\(Constant.baseURL)") {
            request = NSMutableURLRequest(url: url)
        }
        return request
    }

    private func getPerticularChapterNetworkRequest(_ chapterNo: String) -> NSMutableURLRequest? {
        var request: NSMutableURLRequest?
        if let url = URL.init(string: "\(Constant.baseURL)\(chapterNo)/") {
            request = NSMutableURLRequest(url: url)
        }
        return request
    }

    private func getAllVersesNetworkRequest(_ chapterNo: String) -> NSMutableURLRequest? {
        var request: NSMutableURLRequest?
        if let url = URL.init(string: "\(Constant.baseURL)\(chapterNo)\(Constant.versesURL)") {
            request = NSMutableURLRequest(url: url)
        }
        return request
    }

    private func getPerticularVersesNetworkRequest(_ chapterNo: String, _ versesNo: String) -> NSMutableURLRequest? {
        var request: NSMutableURLRequest?
        if let url = URL.init(string: "\(Constant.baseURL)\(chapterNo)\(Constant.versesURL)\(versesNo)/") {
            request = NSMutableURLRequest(url: url)
        }
        return request
    }

    private func getBookData(_ request: NSMutableURLRequest , completion: @escaping (Result<Data , Error>) -> Void) {
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = getHeaders()

        let session = URLSession.shared
        let dataTask = session.dataTask(with: ((request as? URLRequest)!)) { (data, response, error) in
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            guard response is HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
    }

    func getBookAllChapters(completion: @escaping (Result<[Chapter] , Error>) -> Void){
        guard let request = getAllChapterNetworkRequest() else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        getBookData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let chapter = try JSONDecoder().decode([Chapter].self, from: data)
                    completion(.success(chapter))
                } catch(let error) {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getBookAllVerses(chapterNo: String , completion: @escaping (Result<[Verses] , Error>) -> Void){
        guard let request = getAllVersesNetworkRequest(chapterNo) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        getBookData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let verses = try JSONDecoder().decode([Verses].self, from: data)
                    completion(.success(verses))
                } catch(let error) {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getBookPerticularVerses(chapterNo: String , versesNo: String , completion: @escaping (Result<Verses , Error>) -> Void){
        guard let request = getPerticularVersesNetworkRequest(chapterNo, versesNo) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        getBookData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let verses = try JSONDecoder().decode(Verses.self, from: data)
                    completion(.success(verses))
                } catch(let error) {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getPerticularBook(chapterNo: String , completion: @escaping (Result<Chapter , Error>) -> Void){
        guard let request = getPerticularChapterNetworkRequest(chapterNo) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        getBookData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let chapter = try JSONDecoder().decode(Chapter.self, from: data)
                    completion(.success(chapter))
                } catch(let error) {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum NetworkError: Error {
    case noDataFound
    case invalidURL
    case invalidData
    case invalidResponse
    case requestError(err: String?)
}
