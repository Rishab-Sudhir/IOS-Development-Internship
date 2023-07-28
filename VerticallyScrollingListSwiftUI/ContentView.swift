//
//  ContentView.swift
//  VerticallyScrollingListSwiftUI
//
//  Created by Rishab Sudhir on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let data = CountriesDataViewModel()
        NavigationStack {
            List {
                ForEach(data.countriesData.indices) { i in
                //ForEach(data.countriesData, id: \.name){ item in
                    VStack{
                        
                            NavigationLink {
                                CountryDetailView(index: i,  name: data.countriesData[i].name, image: data.countriesData[i].imageName, flag: data.countriesData[i].flag)
                            } label: {
                                HStack {
                                    destinationImage(imageName: data.countriesData[i].imageName)
                                    nameDescription(name: data.countriesData[i].name, description: data.countriesData[i].description)
                                    Spacer()
                                    flagImage(flag: data.countriesData[i].flag)
                            }
                        }
                    }
                }
            }.navigationTitle("Destinations In Europe")
        }
    }
    
    func destinationImage(imageName: String) -> some View{
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 75, height: 75)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(10)
    }
    
    func flagImage(flag: String) -> some View{
        Image(flag).resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:35, height: 35)
            .background(Circle()
            ).clipShape(Circle())
            .padding(10)
    }
    
    func nameDescription(name: String,description: String) -> some View{
        VStack(alignment: .leading){
            Text(name)
                .font(.title2)
                .fontWeight(.bold)
            Text(description)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
