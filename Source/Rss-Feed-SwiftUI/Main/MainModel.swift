//
//  MainModel.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Foundation

struct MainCellViewModel: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var image: String
    var link: String
    
    init(_ model: MainModel) {
        self.title = model.title
        self.description = model.description
        self.image = model.image
        self.link = model.link
    }
}


struct MainModel: Decodable {
    var title: String
    var description: String
    var image: String
    var link: String
}
