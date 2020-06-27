//
//  ContentView.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 10/01/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session  : SessionStore

    func getUser() {
        session.listen()
    }
    var body: some View {
        Group{
            if(session.session != nil){
                TabCtrl()
            } else {
                AuthView()
            }
        }
        .onAppear(perform: getUser)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
