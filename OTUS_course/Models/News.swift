//
//  News.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 25.06.2024.
//

import SwiftUI
import NewsApiNetwork

// 1. Используйте открытое API https://github.com/public-apis/public-apis
// 3. При переключении рубрик должен изменять содержимое List, пейджинг должен работать

private enum Constants {
    static let date: String = "2024-06-01"
    static let sortBy: String = "publishedAt"
    static let language: String = "en"
    static let apiKey: String = "8e7caac0fb8c4c2ba9f3324db7ed392d"
}

extension Article: Identifiable {
    public var id: String { url }
}

class News: ObservableObject {
    
    @Published var appleArticles = [Article]()
    @Published var teslaArticles = [Article]()
    @Published var canLoad = true
    private var applePage = 1
    private var teslaPage = 1
    private var totalPage = 1000

    func loadAppleNews() {
        guard applePage <= totalPage else { return }
        guard canLoad else { return }
        
        canLoad = false
        ArticlesAPI.everythingGet(q: "WWDC",
                                  from: Constants.date,
                                  sortBy: Constants.sortBy,
                                  language: Constants.language,
                                  apiKey: Constants.apiKey,
                                  page: applePage) { data, error in
            self.totalPage = data?.totalResults ?? 1000
            self.appleArticles.append(contentsOf: data?.articles ?? [])
        }
        applePage += 1
        canLoad = true
    }
    
    func loadTeslaNews() {
        guard teslaPage <= totalPage else { return }
        guard canLoad else { return }
        canLoad = false
        ArticlesAPI.everythingGet(q: "tesla",
                                  from: Constants.date,
                                  sortBy: Constants.sortBy,
                                  language: Constants.language,
                                  apiKey: Constants.apiKey,
                                  page: teslaPage) { data, error in
            self.totalPage = data?.totalResults ?? 1000
            self.teslaArticles.append(contentsOf: data?.articles ?? [])
        }
        teslaPage += 1
        canLoad = true
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    func needToLoad<Item: Identifiable>(_ element: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemindex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(element.id) }) else { return false }
        let distance = self.distance(from: itemindex, to: endIndex)
        return distance == 3
    }
}
