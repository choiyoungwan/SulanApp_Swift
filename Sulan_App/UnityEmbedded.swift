////
////  UnityEnbeded.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/08/23.
////
//
//import Foundation
//import UnityFramework
//protocol CartDelegate: AnyObject {
//    func alarmCartIsFilled(itemCount: String)
//  
//}
//class UnityEmbeddedSwift: UIResponder, UIApplicationDelegate, UnityFrameworkListener {
//
//    private struct UnityMessage {
//        let objectName : String?
//        let methodName : String?
//        let messageBody : String?
//    }
//
//    private static var instance : UnityEmbeddedSwift!
//    private var ufw : UnityFramework!
//    private static var hostMainWindow : UIWindow! // Window to return to when exiting Unity window
//    private static var launchOpts : [UIApplication.LaunchOptionsKey: Any]?
//
//    private static var cachedMessages = [UnityMessage]()
//
//    // MARK: - Static functions (that can be called from other scripts)
//
//    static func getUnityRootViewController() -> UIViewController! {
//        return instance.ufw.appController()?.rootViewController
//    }
//
//    static func getUnityView() -> UIView! {
//        return instance.ufw.appController()?.rootView
//        
//    }
//
//    static func setHostMainWindow(_ hostMainWindow : UIWindow?) {
//        UnityEmbeddedSwift.hostMainWindow = hostMainWindow
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//    }
//
//    static func setLaunchinOptions(_ launchingOptions :  [UIApplication.LaunchOptionsKey: Any]?) {
//        UnityEmbeddedSwift.launchOpts = launchingOptions
//    }
//
//    static func showUnity() {
//        if(UnityEmbeddedSwift.instance == nil || UnityEmbeddedSwift.instance.unityIsInitialized() == false) {
//            print("이거?")
//            UnityEmbeddedSwift().initUnityWindow()
//        }
//        else {
//            print("이거???")
//            UnityEmbeddedSwift.instance.showUnityWindow()
//        }
//    }
//
//    static func hideUnity() {
//        UnityEmbeddedSwift.instance?.hideUnityWindow()
//    }
//
//    static func pauseUnity() {
//        UnityEmbeddedSwift.instance?.pauseUnityWindow()
//    }
//
//    static func unpauseUnity() {
//        UnityEmbeddedSwift.instance?.unpauseUnityWindow()
//    }
//
//    static func unloadUnity() {
//        UnityEmbeddedSwift.instance?.unloadUnityWindow()
//    }
//
//    static func sendUnityMessage( objectName : String, methodName : String, message : String) {
//        let msg : UnityMessage = UnityMessage(objectName: objectName, methodName: methodName, messageBody: message)
//        print("메서드 실행되나  출력")
//        // Send the message right away if Unity is initialized, else cache it
//        if(UnityEmbeddedSwift.instance != nil && UnityEmbeddedSwift.instance.unityIsInitialized()) {
//            print("밎다 출력")
//            UnityEmbeddedSwift.instance.ufw.sendMessageToGO(withName: msg.objectName, functionName: msg.methodName, message: msg.messageBody)
//        }
//        else {
//            print("아니다 출력")
//            UnityEmbeddedSwift.cachedMessages.append(msg)
//        }
//    }
//
//    // MARK - Callback from UnityFrameworkListener
//
//    func unityDidUnload(_ notification: Notification!) {
//        print("노티피케이션 출력 확인")
//        ufw.unregisterFrameworkListener(self)
//        ufw = nil
//        UnityEmbeddedSwift.hostMainWindow?.makeKeyAndVisible()
//    }
//
//    // MARK: - Private functions (called within the class)
//
//    private func unityIsInitialized() -> Bool {
//        return ufw != nil && (ufw.appController() != nil)
//    }
//
//    private func initUnityWindow() {
//        if unityIsInitialized() {
//            showUnityWindow()
//            return
//        }
//
//        ufw = UnityFrameworkLoad()!
//        ufw.setDataBundleId("com.unity3d.framework")
//        ufw.register(self)
////        NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
//
//        ufw.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: UnityEmbeddedSwift.launchOpts)
//
//        sendUnityMessageToGameObject()
//
//        UnityEmbeddedSwift.instance = self
//    }
//
//    private func showUnityWindow() {
//        if unityIsInitialized() {
//            ufw.showUnityWindow()
//            sendUnityMessageToGameObject()
//        }
//    }
//
//    private func hideUnityWindow() {
//        if(UnityEmbeddedSwift.hostMainWindow == nil) {
//            print("WARNING: hostMainWindow is nil! Cannot switch from Unity window to previous window")
//        }
//        else {
//            UnityEmbeddedSwift.hostMainWindow?.makeKeyAndVisible()
//        }
//    }
//
//    private func pauseUnityWindow() {
//        ufw.pause(true)
//    }
//
//    private func unpauseUnityWindow() {
//        ufw.pause(false)
//    }
//
//    private func unloadUnityWindow() {
//        if unityIsInitialized() {
//            UnityEmbeddedSwift.cachedMessages.removeAll()
//            ufw.unloadApplication()
//        }
//    }
//
//    private func sendUnityMessageToGameObject() {
//        if (UnityEmbeddedSwift.cachedMessages.count >= 0 && unityIsInitialized())
//        {
//            for msg in UnityEmbeddedSwift.cachedMessages {
//                ufw.sendMessageToGO(withName: msg.objectName, functionName: msg.methodName, message: msg.messageBody)
//            }
//
//            UnityEmbeddedSwift.cachedMessages.removeAll()
//        }
//    }
//
//    private func UnityFrameworkLoad() -> UnityFramework? {
//        let bundlePath: String = Bundle.main.bundlePath + "/Frameworks/UnityFramework.framework"
//
//        let bundle = Bundle(path: bundlePath )
//        if bundle?.isLoaded == false {
//            bundle?.load()
//        }
//
//        let ufw = bundle?.principalClass?.getInstance()
//        if ufw?.appController() == nil {
//            // unity is not initialized
//            //            ufw?.executeHeader = &mh_execute_header
//
//            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
//            machineHeader.pointee = _mh_execute_header
//
//            ufw!.setExecuteHeader(machineHeader)
//        }
//        return ufw
//    }
//}
//extension UnityEmbeddedSwift: NativeCallsProtocol {
//
//    func sendMessage(toMobileApp message: String!) {
//        print(message!)
//       
//       
//    }
//}
