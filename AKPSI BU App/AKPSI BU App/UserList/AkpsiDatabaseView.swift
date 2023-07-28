//
//  AkpsiDatabaseView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 16/06/23.
//

import SwiftUI

struct AkpsiDatabaseView: View {
    @StateObject private var viewModel = AkpsiAlumniDataViewModel()
    var body: some View {
        NavigationStack{
            List(viewModel.filteredResults, id: \.id) { data in
                NavigationLink {
                    MoreInformationView(data: data)
                } label: {
                    VStack(alignment: .leading) {
                        
                        if data.pledgeClass == ""{
                            namesAndPc(fName: data.firstName, lName: data.lastName, pc:"Unknown")
                        }else{
                            namesAndPc(fName: data.firstName, lName: data.lastName, pc: data.pledgeClass)
                        }
                        Text(data.currentCompany)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        fieldLocation(field: data.field, location: data.location, position: data.position)
                    }
                }
                
            }
            .listStyle(.inset)
            .refreshable {
                viewModel.listentoRealtimeDatabase() // If you pull down the list it should refresh to the newest version of the database.
            }
            .navigationTitle("NU Alumni Database")
            .toolbar{
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("Profile")
                }
            }
            .id(UUID())
            .overlay(loadingOverlay)
            .onDisappear {
                viewModel.stopListening()
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .searchScopes($viewModel.searchScope) { 
            ForEach(AkpsiAlumniDataViewModel.FilterCategory.allCases, id: \.self) { scope in
                Text(scope.rawValue.capitalized)
            }
        }.onChange(of: viewModel.searchScope) { _ in
            viewModel.searchText = ""
        }
        
    }
    @ViewBuilder private var loadingOverlay: some View {
        if viewModel.isLoading {
            Color.black.opacity(0.1).ignoresSafeArea()
            VStack{
                Spacer()
                ProgressView("Loading Data...")
                Spacer()
            }
        }
    }
    
    func namesAndPc(fName: String, lName: String, pc: String) -> some View{
        HStack{
            Text(fName)
                .font(.headline)
                .bold()
            Text(lName)
                .font(.headline)
                .bold()
            Spacer()
            Text(pc)
                .font(.subheadline)
        }
    }
    
    func fieldLocation(field: String, location: String, position: String) -> some View{
        VStack(alignment: .leading){
            Text(field)
                .font(.subheadline)
            HStack{
                Text(position)
                    .font(.subheadline)
                Spacer()
                Text(location)
                    .font(.subheadline)
            }

        }
    }

}


