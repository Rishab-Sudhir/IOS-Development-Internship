//
//  ContentView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//

import SwiftUI
struct UserStateView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
    switch viewModel.userState {
      case .signedIn:
        AkpsiDatabaseView()
      case .signedOut:
        LoginView()
    }
  }
}
