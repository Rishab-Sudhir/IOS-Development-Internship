//
//  LoggedInView.swift
//  LoginDemoSwiftUI
//
//  Created by Rishab Sudhir on 06/06/23.
//
import SwiftUI
//
struct LoggedInView: View {
    @Binding var username: String
    
    var body: some View {
        VStack {
            Text("Hello " + username)
        }
        .background(Color.red)
    }
}
struct LoggedInView_Previews: PreviewProvider {
    @State static var username: String = ""

    static var previews: some View {
        LoggedInView(username: $username)
    }
}
