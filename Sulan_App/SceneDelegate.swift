//
//  SceneDelegate.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/07/27.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        print("언제 켜져?")
        /// 유니티 윈도우 직접 생성
//        UnityManager.shared.setHostMainWindow(window)
////        print(self.view?.window)
        guard let _ = (scene as? UIWindowScene)
        else { return }
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.rootViewController = ViewController()
//        window?.makeKeyAndVisible()
//        if let windowScene = scene as? UIWindowScene {
                  // Creates the bridge between UIKit and SwiftUI.
                  // This is done automatically when not using an `App`.
//                  let vc = UIHostingController(rootView: Unity_Swift())
//
//                  // Sets the UIHostingView to transparent so we can see
//                  // the Unity window behind it.
//                  vc.view.isOpaque = false
//                  vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
//                  vc.view.tag = UIWindowCustom.PassthroughTag
//
//                  self.window = UIWindowCustom(windowScene: windowScene)
//                  self.window!.windowLevel = .normal + 100.0
//                  self.window!.rootViewController = vc
//
//                  self.window!.makeKeyAndVisible()
//        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("비컴엑티브")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("Scene백그라운드 진입중")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("Scene포그라운드 진입 중")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("Scene백그라운드 진입 완료")
    }

    
    

}

