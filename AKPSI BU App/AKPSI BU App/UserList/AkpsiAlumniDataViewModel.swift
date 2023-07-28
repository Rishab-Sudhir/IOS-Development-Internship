//
//  AkpsiDataViewModel.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 16/06/23.
//

import Foundation
import FirebaseDatabase

final class AkpsiAlumniDataViewModel: ObservableObject {
    
    enum FilterCategory: String, CaseIterable{
        case firstName = "Name"
        case field = "Field"
        case currentCompany = "Company"
        case position = "Position"
        case location = "Location"
        case pledgeClass = "PC"
    }
    
    //MARK: - Variables
    @Published var akpsiData: [AkpsiDataModel] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var searchScope = FilterCategory.firstName //setting the first filter
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
   
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("AKPSIDataAKPSIdata")
        return ref
    }()
    
    //MARK: - Initialiser method
    init() {
        listentoRealtimeDatabase()
    }
    
    //This returns the list of alumni based on the filter, if the searchText is empty then the whole list is returned, else the filter is applied and that is returned.
    var filteredResults: [AkpsiDataModel] {
        guard !searchText.isEmpty else {
            return akpsiData
        }
        return filterData(akpsiData: akpsiData)
    }
    
    private func filterData(akpsiData: [AkpsiDataModel]) -> [AkpsiDataModel] {
        akpsiData.filter { data in
            switch searchScope {
                case .firstName:
                    return data.firstName.lowercased().contains(searchText.lowercased())
                case .field:
                    return data.field.lowercased().contains(searchText.lowercased())
                case .currentCompany:
                    return data.currentCompany.lowercased().contains(searchText.lowercased())
                case .position:
                    return data.position.lowercased().contains(searchText.lowercased())
                case .location:
                    return data.location.lowercased().contains(searchText.lowercased())
                case .pledgeClass:
                    return data.pledgeClass.lowercased().contains(searchText.lowercased())
            }
        }
    }
 
    func listentoRealtimeDatabase() {
        isLoading = true  // Set loading to true before loading
        print("Starting to load data...")
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                print("Received data snapshot...\(snapshot)")
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    print("Unwrapped self and converted snapshot value to dictionary...")
                    return
                }
                json["id"] = snapshot.key
                do {
                    print("Trying to serialize JSON...")
                    let data = try JSONSerialization.data(withJSONObject: json)
                    print("Successfully serialized JSON, now trying to decode...")
                    let akpsi = try self.decoder.decode(AkpsiDataModel.self, from: data)
                    print("Successfully decoded data, now updating state...")
                    DispatchQueue.main.async {
                        self.akpsiData.append(akpsi)
                        print("akpsi = \(akpsi.id), name =\(akpsi.firstName)")
                        print("Finished loading data...")
                        self.isLoading = false
                    }
                    
                } catch {
                    print("an error occurred", error)
                    self.isLoading = false
                }
                
            }
        
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}

/*
 Class Definition:
 final class AkpsiDataViewModel: ObservableObject - This defines a final class AkpsiDataViewModel that conforms to the ObservableObject protocol, which allows SwiftUI to observe changes in this class.

 Property Definitions:

 @Published var akpsiData: [AkpsiDataModel] = [] - akpsiData is an array of AkpsiDataModel objects that will be observed by SwiftUI. When akpsiData changes, SwiftUI knows it needs to update the views that depend on this data.

 private lazy var databasePath: DatabaseReference? - This is a reference to the "AKPSIDataAKPSIdata" node in your Firebase Realtime Database. The lazy keyword means this reference isn't created until it's first used.

 private let encoder = JSONEncoder() and private let decoder = JSONDecoder() - These objects are used for encoding and decoding JSON data.

 Methods:

 func listentoRealtimeDatabase(): This function begins observing the "AKPSIDataAKPSIdata" node in your Firebase Realtime Database. When a new child is added, the function executes its closure, which:

 Grabs the snapshot data (as a JSON object) from the database,
 Adds the snapshot's key as the "id" field in the JSON,
 Converts the JSON into Data,
 Decodes the Data into an AkpsiDataModel object,
 And adds the new object to the akpsiData array.
 func stopListening(): This function removes all observers from the "AKPSIDataAKPSIdata" node in your Firebase Realtime Database, freeing up memory and resources.
 */
