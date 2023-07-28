//
//  ContentView.swift
//  SeachBar IOS 14 Demo Code
//
//  Created by Rishab Sudhir on 17/07/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    @State private var cancelText = "Cancel"

    var body: some View {
        HStack {
//            Image(systemName: "chevron.left")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 20, height: 20)
//                .background(
//                    Circle()
//                    .foregroundColor(.gray)
//                ).padding(.leading,24)
            TextField("Search for Bank", text: $text)
                .padding(.vertical, 13)
                .padding(.leading, 35)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .overlay(
                    magnifyingGlassAndXButton
                )
                .padding(.leading, 16)
                .padding(.trailing, 24)
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
    
    var magnifyingGlassAndXButton: some View{
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
     
            if isEditing {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
