//
//  LoadableImageView.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 26/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct LoadableImageView: View {
//    @ObservedObject var imageFetcher: ImageLoader
//
//    var stateContent: AnyView{
//        if let image  = UIImage(data: imageFetcher.data){
//            return AnyView(Image(uiImage: image).resizable())
//
//        }else{
//            return AnyView(
//                ActivityIndicator(style: .medium)
//            )
//        }
//    }
//
//    init(with urlString: String) {
//        imageFetcher = ImageFetcher(urlString: urlString)
//    }
    let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
    
    
    var body: some View {
        AsyncImage(
            url: url,
            placeholder: Text("Loading ...")
        ).aspectRatio(contentMode: .fit)
    }
}


struct LoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageView()
    }
}
