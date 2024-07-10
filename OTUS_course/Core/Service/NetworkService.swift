//
//  NetworkService.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 05.07.2024.
//

import Foundation
import NewsApiNetwork

private enum Constants {
    static let date: String = "2024-07-06"
    static let sortBy: String = "publishedAt"
    static let language: String = "en"
    static let apiKey: String = "7a32de7bac2440fbab4c57ab90f10875"
}

final class NetworkService {
    
    func loadAppleNews(page: Int, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)) {
        ArticlesAPI.everythingGet(q: "WWDC",
                                  from: Constants.date,
                                  sortBy: Constants.sortBy,
                                  language: Constants.language,
                                  apiKey: Constants.apiKey,
                                  page: page,
                                  completion: completion)
    }
    
    func loadTeslaNews(page: Int, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)) {
        ArticlesAPI.everythingGet(q: "tesla",
                                  from: Constants.date,
                                  sortBy: Constants.sortBy,
                                  language: Constants.language,
                                  apiKey: Constants.apiKey,
                                  page: page,
                                  completion: completion)
    }
}
