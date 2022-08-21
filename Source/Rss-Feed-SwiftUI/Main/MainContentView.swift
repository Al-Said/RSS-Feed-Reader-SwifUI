//
//  ContentView.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import SwiftUI
import Combine

struct MainContentView: View {
    
    @ObservedObject var vm = MainViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.mainModels, id: \.id) { model in
                NavigationLink {
                    FeedDetailView(vm: vm.getViewModel(from: model))
                } label: {
                    MainCell(model: model).listRowInsets(EdgeInsets())
                }

            }.onAppear {
                vm.fetchData()
            }.listStyle(.plain)
                .navigationTitle(vm.title)
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
