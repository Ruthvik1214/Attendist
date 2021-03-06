//
//  AppDelegate.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 12/12/19.
//  Copyright © 2019 Ruthvik Penubarthi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import GoogleSignIn
import FirebaseAuth

var signedInUser = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        signedInUser = ""
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      Auth.auth().signIn(with: credential) { (authResult, error) in
        if let error = error {
          signedInUser = ""
          return
        }
//        AppDelegate.userID = user.userID
        signedInUser = user.userID
        print(signedInUser)
         GIDSignIn.sharedInstance()?.presentingViewController.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }

    }

    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    


}

