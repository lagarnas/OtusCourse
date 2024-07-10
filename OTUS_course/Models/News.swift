//
//  News.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 25.06.2024.
//

import SwiftUI
import NewsApiNetwork

extension Article: Identifiable {
    public var id: String { url }
}

final class News: ObservableObject {
    // 3. Добавить инжектинг в переменные инстанса класса, чтобы в каждом классе можно было видеть зависимости, не скролля файл
    @Injected var service: NetworkService?
    
    @Published var appleArticles = [Article]()
    @Published var teslaArticles = [Article]()
    @Published var canLoad = true
    private var applePage = 1
    private var teslaPage = 1
    private var totalPage = 1000
    
    init() {
        Configurator.shared.setup()
        service = Configurator.shared.serviceLocator.getService(type: NetworkService.self)
    }

    func loadAppleNews() {
        guard applePage <= totalPage else { return }
        guard canLoad else { return }
        
        canLoad = false
        
        service?.loadAppleNews(page: applePage) { data, error in
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
        
        service?.loadTeslaNews(page: teslaPage) { data, error in
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
