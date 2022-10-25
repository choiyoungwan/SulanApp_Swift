//
//  AppDelegate.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/07/27.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    public static var user: GIDGoogleUser!
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

            print("appDelegate")

        AppDelegate.user = user
        return
    }
    
    
    

    let StoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var window: UIWindow?
//   
    //애플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance().clientID = "941958466597-hqvthl88s92nilqnvk2p3aedjkm2u27f.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        UnityEmbeddedSwift.setHostMainWindow(window)
        UnityEmbeddedSwift.setLaunchinOptions(launchOptions)
        
        //sleep(5)
        print("언제 나오나 확인")
        return true
    }

   
    // MARK: UISceneSession Lifecycle
    //애플리케이션이 최초 실행될 때 호출되는 메소드
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
                sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
        
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    /* 구글로그인때문에 추가한 부분 */
//    func application(_ app: UIApplication, open url: URL, options:
//                     [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        let result = GIDSignIn.sharedInstance().handle(url)
//           return result
//    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return (GIDSignIn.sharedInstance()?.handle(url))! }
    //애플리케이션이 백그라운드 상태로 전환된 직후 호출
    func applicationDidEnterBackground(_ application: UIApplication){
    print("백그라운드 상태로 전환된 직후 호출")
    }

    //애플리케이션이 Active 상태가 되기 직전, 화면에 보여지기 직전에 호출
    func applicationWillEnterForeground(_ application: UIApplication){
        print("화면에 보여지기 직전에 호출")
    }
    
}
extension UIView{
    
    public var width: CGFloat {
        return frame.size.width
    }
    public var height: CGFloat {
        return frame.size.height
    }
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    public var left: CGFloat {
        return frame.origin.x
    }
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
}
