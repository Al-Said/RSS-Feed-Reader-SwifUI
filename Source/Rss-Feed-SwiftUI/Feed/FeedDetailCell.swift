//
//  FeedDetailCell.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import SwiftUI
import Kingfisher

struct FeedDetailCell: View {

    var model: FeedDetailCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(model.title)
                .font(.system(size: 19, weight: .bold))
                .padding(.vertical, 5)
            Text(model.description)
                .font(.subheadline).italic()
                .padding(.vertical, 5)
                .foregroundColor(.secondary)
                .lineLimit(6)
                .minimumScaleFactor(0.8)
            if model.image != nil {
                KFImage(model.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 5)
            }
        }.ignoresSafeArea()
    }
}

struct FeedDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailCell(model: FeedDetailCellViewModel(title: "Hello World", description: "example description", link: nil, image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png")))
    }
}
