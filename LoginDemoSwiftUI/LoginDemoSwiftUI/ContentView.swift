//
//  ContentView.swift
//  LoginDemoSwiftUI
//
//  Created by Rishab Sudhir on 06/06/23.
//
// Simple login page that checks your details againsts a set pair and then presents a sheet that welcomes the logged in user

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var ShowAlert = false // for showing the alert
    @State var showLoginView: Bool = false // for showing the sheet to welcome the user
    var body: some View {
        VStack {
            Spacer()
            userImage
            userName
            passWord
            Button {
                if username == "Rishab"{
                    if password == "Hello123"{
                        ShowAlert = false
                        showLoginView = true
                    }else{
                        ShowAlert = true
                    }
                }else{
                    ShowAlert = true
                }
            } label: {
                Text("Login").foregroundColor(.white)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 25))
            }.padding()
                .alert(Text("Wrong Details"), isPresented: $ShowAlert) { //For displaying an alert if login fails
                    Button {
                        
                    } label: {
                        Text("Ok")
                    }

                }
                .sheet(isPresented: $showLoginView, content: {
                    LoggedInView(username: $username)
                })

            Spacer()

            
        }
        .padding()
    }
    
    var userName: some View {
        HStack{
            Text("Username: ").bold().foregroundColor(.blue)
            TextField("Type Here", text: $username ).textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    var passWord: some View {
        HStack{
            Text("Password: ").bold().foregroundColor(.blue)
            TextField("Type Here", text: $password ).textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    var userImage: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 70, height: 70)
            .foregroundColor(.accentColor)
            .padding()
            .background(
                Circle().stroke(Color.gray, lineWidth: 2)
            ).clipShape(Circle()).padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
