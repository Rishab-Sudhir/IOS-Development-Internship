//
//  AkpsiDataModel.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//

import Foundation

struct AkpsiDataModel: Identifiable, Codable, Hashable{
    let id: String
    var firstName: String
    var lastName: String
    var currentCompany: String
    var position: String
    var field: String
    var location: String
    var buEmail: String?
    var personalEmail: String?
    var Linkedin: String?
    var OriginalPhoneStr: String
    var pledgeClass: String
    
    
    //Doing this because the key loading in from the database has a space after it, which was causing an error.
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case currentCompany
        case position
        case field
        case location
        case buEmail
        case personalEmail
        case Linkedin = "Linkedin "
        case OriginalPhoneStr
        case pledgeClass
    }
}
