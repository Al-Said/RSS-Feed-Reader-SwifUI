//
//  Bundle+Extension.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Combine
import Foundation

extension Bundle {

    func readFile(file: String, _ fileExtension: String? = nil) -> AnyPublisher<Data, Error> {
        self.url(forResource: file, withExtension: fileExtension)
            .publisher
            .tryMap{ string in
                guard let data = try? Data(contentsOf: string) else {
                    fatalError("Failed to load \(file) from bundle.")
                }
                return data
            }
            .mapError { error in
                return error
            }.eraseToAnyPublisher()
    }

    func getRssList(fileName: String, fileExtension: String? = nil) -> AnyPublisher<[MainModel], Error> {
        readFile(file: fileName, fileExtension)
            .decode(type: [MainModel].self, decoder: JSONDecoder())
            .mapError { error in
                return error
            }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
