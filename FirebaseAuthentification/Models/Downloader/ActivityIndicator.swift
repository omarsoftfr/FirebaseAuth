//
//  ActivityIndicator.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 26/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>)
        -> UIActivityIndicatorView{
            return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
#if DEBUG
struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .medium)
    }
}
#endif
