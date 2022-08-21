//
//  FeedDetailView.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import SwiftUI

struct FeedDetailView: View {
    
    @ObservedObject var vm = FeedDetailViewModel()
    @State private var isloading = true
    
    var body: some View {
        ZStack {
            if isloading {
                LoadingView()
            }
            List(vm.items, id: \.id) { model in
                if let url = model.link {
                    Link(destination: url) {
                        FeedDetailCell(model: model)
                    }
                }
            }.onAppear {
                bind()
            }.refreshable {
                bind()
            }.listStyle(.plain)
                .navigationTitle(vm.title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func bind() {
        vm.fetchData { success in
            isloading = !success
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.gray)
            .scaleEffect(2)
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView()
    }
}
