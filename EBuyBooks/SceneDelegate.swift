//
//  SceneDelegate.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 03/12/20.
//

import UIKit
import SwiftUI
import AWSMobileClient
import Amplify
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var cancellables = Set<AnyCancellable>()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            (UIApplication.shared.delegate as! AppDelegate).window = window
            window.rootViewController = UIHostingController(rootView: SignIn())
//            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        AWSMobileClient.default().addUserStateListener(self) { (userState, additionInfo) in
            print("user state changed")
            
           switch userState
           {
           case .signedIn :
            jwtToken = additionInfo["token"]!
            additionInfo.forEach { (key, value) in
                print("Key : \(key)")
                print("value : \(value)")
            }
            print("Signe in \(AWSMobileClient.default().userSub)")
            self.window?.rootViewController = UIHostingController(rootView: ContentView())
            self.window?.makeKeyAndVisible()
           // self.listFilesInS3Storage()
            let storageOperation = Amplify.Storage.downloadData(key: "books/B1001_Image.jpeg")
            let progressSink = storageOperation.progressPublisher.sink { progress in print("Progress: \(progress)") }.store(in: &self.cancellables)
            let resultSink = storageOperation.resultPublisher.receive(on: DispatchQueue.main).sink {
                if case let .failure(storageError) = $0 {
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                }
            }
            receiveValue: { data in
                print("Ramesh file dowlaoded")
                ( UIApplication.shared.delegate as? AppDelegate)?.uiImage =   UIImage(data: data)
                print("Completed: \(data)")
                self.window?.rootViewController = UIHostingController(rootView: ContentView())
                
            }.store(in: &self.cancellables)
            //self.uploadData()
           case .signedOut:
            print("signout")
           case .signedOutFederatedTokensInvalid:
                            print("signedOutFederatedTokensInvalid")
           case .signedOutUserPoolsTokenInvalid:
            print("signedOutFederatedTokensInvalid")

           case .guest:
            print("guest")
           case .unknown:
            print("unknow")
           }
            
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        Amplify.Auth.signOut()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
    var progressSink: AnyCancellable?
    var resultSink: AnyCancellable?

    func downloadData(key: String, userId: String) {
        let options = StorageDownloadDataRequest.Options(accessLevel: .private)
        let storageOperation = Amplify.Storage.downloadData(key: key, options: options)
        progressSink = storageOperation.progressPublisher.sink { progress in print("Progress: \(progress)") }
        resultSink = storageOperation.resultPublisher.sink {
            if case let .failure(storageError) = $0 {
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        }
        receiveValue: { data in
            print("Completed: \(data)")
        }
    }
  
    func listFilesInS3Storage()
        {
        let sink = Amplify.Storage.list()
            .resultPublisher
            .sink {
                if case let .failure(storageError) = $0 {
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                }
            }
            receiveValue: { listResult in
                print("Completed")
                listResult.items.forEach { item in
                    print("Key: \(item.key)")
                }
            }.store(in: &self.cancellables)
    }
    
    func uploadData()
    {
        let dataString = "My Data"
        let data = dataString.data(using: .utf8)!
        let storageOperation = Amplify.Storage.uploadData(key: "ExampleKey", data: data)
        let progressSink = storageOperation.progressPublisher.sink { progress in print("Progress: \(progress)") }
        let resultSink = storageOperation.resultPublisher.sink {
            if case let .failure(storageError) = $0 {
                print("Failed upload storage error: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        }
        receiveValue: { data in
            print("Completed: \(data)")
        }.store(in: &cancellables)
    }
}


