//
//  MainCell.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import SwiftUI
import Kingfisher

struct MainCell: View {
    
    var model: MainCellViewModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: model.image)).renderingMode(.original).resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(12)
                .padding()
            Spacer()
            VStack {
                Text(model.title)
                    .bold()
                    .padding(.top, 8)
                VStack(alignment: .leading, spacing: 0) {
                    Text(model.description)
                        .padding(.bottom, 8)
                        .padding(.top, 4)
                        .font(.italic(.subheadline)())
                        .foregroundColor(.secondary)
                        .lineLimit(4)
                        .minimumScaleFactor(0.8)
                }
            }
            Spacer()
        }.ignoresSafeArea()
    }
    
}

struct MainCell_Previews: PreviewProvider {
    static var previews: some View {
        MainCell(model: MainCellViewModel(MainModel(title: "Example", description: "Example Example Example", image: "https://cdn.iconscout.com/icon/free/png-256/lifehacker-1-461813.png", link: "")))
    }
}
