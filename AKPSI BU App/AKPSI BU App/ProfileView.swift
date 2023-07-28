//
//  HomeView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//

import SwiftUI
import GoogleSignIn

// TODO: - Change name to ProfileView
struct ProfileView: View {
    // 1
    @EnvironmentObject var viewModel: AuthenticationViewModel
    // 2
    private let currentUser = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // 3

                    userProfileImage
                    
                    VStack(alignment: .leading) {
                        
                        userName
                        
                        userEmail
                        
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding()
                
                Spacer()

                signOutButtion
                
            }
            .navigationTitle("Profile")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var userProfileImage: some View{
        NetworkImage(url: currentUser?.profile?.imageURL(withDimension: 200))
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(8)
    }
    
    var userName: some View{
        Text(currentUser?.profile?.name ?? "")
            .font(.headline)
        
    }
    
    var userEmail: some View{
        Text(currentUser?.profile?.email ?? "")
            .font(.subheadline)
    }
    
    var signOutButtion: some View{
        Button(action: viewModel.signOut) {
            Text("Sign out")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.blue))
                .cornerRadius(12)
                .padding()
        }
    }
}

/// A generic view that shows images from the network.
///
/*You use a struct rather than a var because var only declares a variable, not a type. A variable holds a value of a certain type, and cannot describe the behavior of a UI component or group together multiple pieces of related data in the way that a struct can.*/
                
/*You cannot change a struct to a variable because they serve fundamentally different purposes. A struct is a blueprint for a type, while a variable is a storage for a value. A struct can contain properties (variables), methods and initializers, whereas a variable is used to store a value and has no such capabilities.
 */

struct NetworkImage: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    let url: URL?
    @State var userProfileImage: UIImage? = nil
    var body: some View {
        Group{
            if let image = userProfileImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                
                defaultImage
                
            }
        }.onAppear{
            viewModel.loadImage(imageUrl: url){loadedImage in
                userProfileImage = loadedImage
            }
        }
        
    }
    
    var defaultImage : some View{
        Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
/*
 In NetworkImage, the onAppear modifier calls the loadImage function as soon as the NetworkImage view appears on the screen. This is done asynchronously, meaning it doesn't block the rest of the application while loading the image.

 Inside loadImage, a new thread is started with DispatchQueue.global(qos: .userInitiated).async { ... }. This allows the potentially time-consuming process of loading the image from the URL to be done in the background, without blocking the main thread, which is responsible for updating the user interface.

 Once the image data is loaded (or if there is an error), the completion handler (completion) is called. This closure is passed as a parameter when calling loadImage.

 The completion closure is defined in NetworkImage as { loadedImage in ... }. It takes one argument, loadedImage, which is the UIImage that was loaded (or nil if there was an error).

 Inside the completion closure, the uiImage state variable is updated to the loaded image. The @State property wrapper means that whenever uiImage is updated, SwiftUI will automatically re-compute the body of the NetworkImage view.

 In the body of NetworkImage, if uiImage is nil (which it is initially, or if there was an error loading the image), a default image is displayed with Image(systemName: "person.circle.fill"). If uiImage is not nil (i.e., the image was successfully loaded), then the loaded image is displayed with Image(uiImage: uiImage!).
 */
