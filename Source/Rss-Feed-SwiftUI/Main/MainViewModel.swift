//
//  MainViewModel.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Combine
import Foundation


class MainViewModel: ObservableObject {
    
    var title = "Rss List"
    private let fileName = "rssList"
    private let fileType = "json"
    @Published var mainModels = [MainCellViewModel]()
    private var cancellable: AnyCancellable?
    
    func fetchData() {
        cancellable = Bundle.main.getRssList(fileName: fileName, fileExtension: fileType).sink { status in
            switch status {
            case .finished:
                break
            case .failure(let error):
                print("Error occured: ==> \(error.localizedDescription)")
                break
            }
        } receiveValue: { myList in
            self.mainModels = myList.map({ MainCellViewModel($0)})
            print(self.mainModels)
        }
    }
    
    func getViewModel(from model: MainCellViewModel) -> FeedDetailViewModel {
        FeedDetailViewModel(feedUrl: URL(string: model.link)!, title: model.title)
    }
    
}
