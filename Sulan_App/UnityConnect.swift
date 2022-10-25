//
//  UnitViewController.swift
//  Exampp
//
//  Created by 최영완 on 2022/08/18.
//

import UIKit
import UnityFramework
import Foundation

struct UnityMessage {
    let gameObjectName: String
    let functionName: String
    let message: String
}
//protocol CartDelegate: AnyObject {
//    func alarmCartIsFilled(itemCount: String)
//  
//}
class UnityManager : NSObject, ObservableObject, NativeCallsProtocol{
    
    static let shared = UnityManager()
    private static var instance : UnityManager!
    private var hostMainWindow : UIWindow?
//    let AD = UIApplication.shared.delegate as? AppDelegate
    
    @Published var messageT = "-"
    private let dataBundleId: String = "com.unity3d.framework"
    private let frameworkPath: String = "/Frameworks/UnityFramework.framework"
    
    private var ufw: UnityFramework?
    
    func setHostMainWindow(_ hostMainWindow: UIWindow?) {
        self.hostMainWindow = hostMainWindow
    }
    
   
    private override init() {}

    func launchUnity() {
        let isInitialized = self.ufw?.appController() != nil
        if isInitialized {
            print("ssss")
            self.ufw?.showUnityWindow()
        } else {
            print("ssss2222")
            guard let ufw = self.loadUnityFramework() else { return }
            self.ufw = ufw
            ufw.setDataBundleId(dataBundleId)
                        ufw.register(self)
              NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
                        ufw.runEmbedded(
                            withArgc: CommandLine.argc,
                            argv: CommandLine.unsafeArgv,
                            appLaunchOpts: nil
                        )
        }
    }
    
    func closeUnity() {
            self.ufw?.unloadApplication()
        }
    
    func pauseUnity() {
        self.ufw?.pause(true)
        
        }
    func unpauseUnity() {
        self.ufw?.pause(false)
        
        }
     func hideUnity() {
         hideUnityWindow()
    }
    private func hideUnityWindow() {
        if(self.hostMainWindow == nil) {
            print("WARNING: hostMainWindow is nil! Cannot switch from Unity window to previous window")
            
            self.hostMainWindow?.makeKeyAndVisible()
        }
        else {
            print("이게 유니티가 나올때 출력될거 같은데,,,")
            self.ufw?.unregisterFrameworkListener(self)
            self.ufw = nil
            self.hostMainWindow!.makeKeyAndVisible()
            
        }
    }
    
    func sendMessageToUnity(_ message: UnityMessage) {
            self.ufw?.sendMessageToGO(withName: message.gameObjectName,
                                      functionName: message.functionName,
                                      message: message.message)
        }
    
    func sendMessage(toMobileApp message: String!) {
        print(message!)
       
        self.messageT = message
    }
    private func loadUnityFramework() -> UnityFramework? {
        let bundlePath: String = Bundle.main.bundlePath + frameworkPath

        let bundle = Bundle(path: bundlePath)
        if bundle?.isLoaded == false {
            bundle?.load()
        }

        let ufw = bundle?.principalClass?.getInstance()
        if ufw?.appController() == nil {
            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
            machineHeader.pointee = _mh_execute_header

            ufw?.setExecuteHeader(machineHeader)
        }
        return ufw
    }
}

//func getUnityView() -> UIView! {
//    return instance.ufw.appController()?.rootViewController?.view
//}


extension UnityManager: UnityFrameworkListener {
    
    func unityDidUnload(_ notification: Notification!) {
        print("여기가 유니티가 나올때 윈도우 유아이")
        self.ufw?.unregisterFrameworkListener(self)
        self.ufw = nil
        self.hostMainWindow?.makeKeyAndVisible()
    }
}
//extension UnityManager: NativeCallsProtocol {
//
//    func sendMessage(toMobileApp message: String!) {
//        print(message!)
//
//
//    }
//}

