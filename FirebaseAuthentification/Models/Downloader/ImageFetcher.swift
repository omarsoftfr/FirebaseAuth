//
//  ImageFetcher.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 26/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?

    init(url: URL) {
        self.url = url
    }
    deinit {
        cancellable?.cancel()
    }
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}
struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
     private var image: some View {
           Group {
               if loader.image != nil {
                   Image(uiImage: loader.image!)
                       .resizable()
               } else {
                   placeholder
               }
           }
       }
}
