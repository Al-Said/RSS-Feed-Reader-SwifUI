//
//  FeedDetailCellModel.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Foundation
import FeedKit

struct FeedDetailCellViewModel: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var link: URL? = nil
    var image: URL? = nil
    
    init(model: RSSFeedItem) {
        self.title = (model.title ?? "No title").removeHTMLTag().trimingLeadingSpaces()
        self.description = (model.description ?? "No description").removeHTMLTag().trimingLeadingSpaces()
        self.image = URL(string: (model.description ?? "").getImageUrlStr())
        self.link = URL(string: model.link ?? "")
    }
    
    init(title: String,
         description: String,
         link: URL?,
         image: URL?) {
        self.title = title
        self.description = description
        self.link = link
        self.image = image
    }
}
