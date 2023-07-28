//
//  ViewModel.swift
//  VerticallyScrollingListSwiftUI
//
//  Created by Rishab Sudhir on 07/06/23.
//

import Foundation

class CountriesDataViewModel {
    
    //MARK: - Variables
    var countriesData = [CountriesInformation]() // Array which will contain the data for all the countries
    private let countryNames = ["Switzerland","France","Belgium","Germany","Netherlands","Finland","Spain"]
    private let flagsList = ["Switzerland Flag","France Flag", "Belgium Flag","German Flag","Netherlands Flag","Finnish Flag","Spanish Flag"]
    private let descriptionsList = ["Europes Most Scenic Destination.","For a great croissant.","For a great waffle.","Greatest car makers.", "For some beautiful flowers.", "For the gorgeous aurora borealis.", "For incredible Roman history."]
    private let imageNameList = ["Alps-Switzerland","Eiffel Tower France","Grand Place Belgium","Germany","Netherlands Amsterdam","Finland","Spain"]
    
    // MARK: - Initializer
    init() {
        setupCountriesData()
    }
    
    private func setupCountriesData(){
        for i in 0...(countryNames.count-1){
            let countryData = CountriesInformation(name: countryNames[i], imageName: imageNameList[i], description: descriptionsList[i], flag: flagsList[i])
            countriesData.append(countryData)
        }
    }
}

