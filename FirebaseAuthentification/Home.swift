//
//  Home.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 10/01/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            HomePage().navigationBarTitle("WELCOM_TITLE", displayMode: .automatic)
        }
        
    }
}

struct HomePage : View {
    var body: some View {
        VStack{
            NavigationLink(destination: Demo()){
                Text("PAGE_DEMO_GO")
            }
            List(0..<10) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("TEXT_DEMO_LIST")
                    }
                }
            }
        }
    }
}

struct Demo : View {
    var body: some View {
        Text("DEMO_PAGE").navigationBarTitle("DEMO", displayMode: .inline)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
