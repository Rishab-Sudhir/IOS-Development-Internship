//
//  AuthenticationViewModel.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//
import Foundation
import Firebase
import GoogleSignIn
import FirebaseDatabase

class AuthenticationViewModel: ObservableObject {
    // 1
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var lastSignInUnauthorized: Bool = false
    // 2
    @Published var userState: SignInState = .signedOut
    var errorMessage: String? = nil
    
    func signIn() {
        // 1
        if !lastSignInUnauthorized && GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = configuration
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
                self.authenticateUser(for: result?.user, with: error)
            }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        // 1
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // 2
        guard let user = user,
              let email = user.profile?.email, //new line
              let idToken = user.idToken?.tokenString else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        
        let authenticatedEmailsRef = Database.database().reference().child("AuthenticatedEmails") //new line
        // TODO: - Change it to authorisedEmails
        // change it so that you sign in first and then pull
        // push the email to firebase, and then use a trigger to check if the email exists there instead of checking here, requires less data pull
        //call function directly from the app. (on Call)
        
        let emailKey = email.replacingOccurrences(of: "@", with: "").replacingOccurrences(of: ".", with: "") //new line
        // 3
        authenticatedEmailsRef.child(emailKey).observeSingleEvent(of: .value) { snapshot in
            if snapshot.exists() {
                Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        self.lastSignInUnauthorized = false
                        self.userState = .signedIn
                    }
                }
            } else {
                print("User's email not in authenticated Emails list")
                self.errorMessage = "Your account does not have the necessary access. Please contact the system administrator for further details."
                self.lastSignInUnauthorized = true
                self.signOut()
            }
        }
    }
    
    func signOut() {
        // 1
        GIDSignIn.sharedInstance.signOut()
        do {
            // 2
            try Auth.auth().signOut()
            
            userState = .signedOut
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImage(imageUrl: URL?, completion: @escaping (UIImage?) -> Void){
        DispatchQueue.global(qos: .userInitiated).async{
            if let imageUrl = imageUrl,
               let data = try? Data(contentsOf: imageUrl),
               let profileImage = UIImage(data: data){
                DispatchQueue.main.async {
                    completion(profileImage)
                }
            }else{
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        // The loadImage function is designed to fetch an image from a URL, which is an asynchronous operation because it involves network data retrieval that might take some time. So instead of blocking the rest of your app's operation while waiting for this image data, it's common to set it to run in the background, and then inform your app when it's done.
        
        // The closure passed into this function serves as a "callback" that will be run after the image data has been fetched from the URL. This closure has @escaping attribute because it will not be executed immediately within the function's body, but will be executed later (i.e., it "escapes" the immediate execution scope). In this case, the closure is called when the image data is fetched, which may happen some time after the loadImage function is called.
        
        //the completion closure is the code remaining in homeview Networkimage -
        
    }
    // doing this so i can move this process to the background, to avoid "should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession."
}
