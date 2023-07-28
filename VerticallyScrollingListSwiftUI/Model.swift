//
//  Model.swift
//  VerticallyScrollingListSwiftUI
//
//  Created by Rishab Sudhir on 07/06/23.
//

import Foundation

struct CountriesInformation {
    var name: String
    var imageName: String
    var description: String
    var flag: String
    

    init(name: String, imageName: String, description: String, flag:String) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.flag = flag
    }
}
