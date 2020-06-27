//
//  Profil.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 10/01/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct Profil: View {
    @EnvironmentObject var session  : SessionStore
    var body: some View {
        VStack{
            Button(action: session.signOut){
                Text("SIGN_OUT")
            }
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
