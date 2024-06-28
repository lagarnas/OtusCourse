//
//  NewsScreen.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI
import NewsApiNetwork

// 2. Сделайте несколько рубрик по разным запросам новостей или городов по погоде (переключение через горизонтальный ScrollView либо SegmentedControl)

struct NewsScreen: View {
    
    @StateObject var news = News()
    @State var layoutVarient = 0
    var varients = ["Apple news", "Tesla news"]
    
    var body: some View {
        VStack {
            Picker("", selection: $layoutVarient) {
                ForEach(0..<varients.count, id: \.self) { index in
                    Text(self.varients[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
            switch layoutVarient {
            case 0: list
            case 1: grid
            default: EmptyView()
            }
        }
    }
    
    var list: some View {
        List {
            ForEach(news.appleArticles) { article in
                ListArticleCell(title: article.title ?? "",
                                description: article.description ?? "")
                .onAppear {
                    if news.appleArticles.needToLoad(article) {
                        news.loadAppleNews()
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .onAppear {
            news.loadAppleNews()
        }
    }
    
    var grid: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(), count: 2)) {
                ForEach(news.teslaArticles) { article in
                    ListArticleCell(title: article.title ?? "",
                                    description: article.description ?? "")
                    .onAppear {
                        if news.teslaArticles.needToLoad(article) {
                            news.loadTeslaNews()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .onAppear {
                news.loadTeslaNews()
            }
        }
    }
}

#Preview {
    NewsScreen()
}
