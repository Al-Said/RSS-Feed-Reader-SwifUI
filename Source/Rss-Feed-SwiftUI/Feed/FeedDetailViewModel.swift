//
//  FeedDetailViewModel.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Foundation
import FeedKit
import Combine

class FeedDetailViewModel: ObservableObject {
    
    @Published var items: [FeedDetailCellViewModel] = [FeedDetailCellViewModel]()
    var title: String!
    var feedUrl: URL!

    private var parser: FeedParser!
    private var rssFeed: RSSFeed?
    private var cancellable: AnyCancellable?

    required init(feedUrl: URL, title: String) {
        self.feedUrl = feedUrl
        self.title = title
        parser = FeedParser(URL: feedUrl)
    }
    
    //Default constructor
    init() {
        self.feedUrl = URL(string: "google.com")!
        self.title = ""
    }
    
    func fetchData(_ success: @escaping (Bool) -> ()) {
        cancellable = parser.parse().publisher.sink { status in
            switch status {
            case .finished:
                break
            case .failure(let error):
                print("Error ==> \(error)")
                success(false)
            }
        } receiveValue: { feed in
            if let itms = feed.rssFeed?.items {
                self.items = itms.map { FeedDetailCellViewModel(model: $0) }
                success(true)
            } else {
                success(false)
            }
        }
    }
    
}
