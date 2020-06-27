//
//  AuthView.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 10/01/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct SignInView : View {
    @State var email : String = ""
    @State var password : String = ""
    @State var error : String = ""
    @EnvironmentObject var session : SessionStore
    
    func signIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body : some View{
        VStack{
            Text("WELCOM_BACK")
                .font(.system(size : 32, weight: .heavy))
            
            Text("SIGN_IN_CONTINUE")
                .font(.system(size : 18, weight: .medium))
                .foregroundColor(.gray)
            
            VStack(spacing : 18){
                TextField("EMAIL", text: $email)
                    .font(.system(size : 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
                
                SecureField("PASSWORD", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
            }
            .padding(.vertical, 64)
            
            Button(action: signIn){
                Text("SIGNIN")
                    .frame(minWidth : 0, maxWidth: .infinity)
                    .frame(height : 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.red)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
            
            if(error != ""){
                Text(error)
                    .font(.system(size : 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
            
            NavigationLink(destination: SignUpView()){
                HStack{
                    Text("NEW_USER")
                        .font(.system(size : 14, weight : .light))
                        .foregroundColor(.primary)
                    Text("NEW_ACCOUNT")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(.blue))
                    
                }
            }
        }
        .padding(.horizontal, 32)
    }
    
}

struct SignUpView: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var error : String = ""
    @EnvironmentObject var session : SessionStore
    
    func signUp(){
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View{
        VStack{
            Text("CREATE_ACCOUNT")
                .font(.system(size: 32, weight: .heavy))

            Text("SIGN_UP_START")
                .font(.system(size: 18, weight : .medium))
                .foregroundColor(Color(.gray))
            VStack(spacing: 18){
                TextField("EMAIL", text: $email)
                    .font(.system(size: 14))
                .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
                SecureField("PASSWORD", text: $password)
                                   .font(.system(size: 14))
                                   .padding(12)
                                   .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))

            }
            .padding(.vertical, 64)

            Button(action: signUp){
                Text("CREATE_ACCOUNT")
                    .frame(minWidth : 0, maxWidth: .infinity)
                    .frame(height : 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.red)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }

            if(error != ""){
                    Text(error)
                        .font(.system(size : 14, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }

            Spacer()
        }
        .padding(.horizontal, 32)
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView {
                SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
