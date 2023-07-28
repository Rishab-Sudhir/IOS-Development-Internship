//
//  AKPSI_BU_AppApp.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//

import Foundation
import SwiftUI
import Firebase

@main
struct AKPSI_BU_AppApp: App {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    init() {
      setupAuthentication()
    }
    var body: some Scene {
        WindowGroup {
            UserStateView().environmentObject(viewModel)
        }
    }
}

extension AKPSI_BU_AppApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
