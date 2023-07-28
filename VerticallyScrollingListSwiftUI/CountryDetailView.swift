//
//  CountryDetailView.swift
//  VerticallyScrollingListSwiftUI
//
//  Created by Rishab Sudhir on 12/06/23.
//

import SwiftUI

struct CountryDetailView: View {
    var index: Int
    var name: String
    var image: String
    var flag: String
    init(index:Int,name: String, image: String, flag: String) {
        self.index = index
        self.name = name
        self.image = image
        self.flag = flag
    }
    let descriptions = CountriesDetailViewModel()
    var body: some View {
        VStack{
            HStack{
                
                name(name: name)
                flagImage(flag: flag)
            }
                destinationImage(imageName: image)
                descriptionFunc(des: descriptions.countryDetailsArray[index].description)
        }
    }
    func destinationImage(imageName: String) -> some View{
        Image(imageName).resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).background(RoundedRectangle(cornerRadius: 15, style: .continuous)).clipShape(RoundedRectangle(cornerRadius: 15)).padding(10)
    }
    func name(name: String) -> some View{
        VStack(alignment: .leading){
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
    func flagImage(flag: String) -> some View{
        Image(flag).resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:50, height: 50)
            .background(Circle()
            ).clipShape(Circle())
            .padding(10)
    }
    func descriptionFunc(des: String) -> some View{
        VStack(alignment: .center){
            Text(des)
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(10)
        }.frame(width: 375,height: 375).background(RoundedRectangle(cornerRadius: 15, style: .continuous)).foregroundColor(.blue)
    }

}

