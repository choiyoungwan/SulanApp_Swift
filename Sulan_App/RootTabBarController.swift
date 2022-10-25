////
////  RootTabBarController.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/08/23.
////
//
//import UIKit
//
//class RootTabBarController:  UITabBarController, UITabBarControllerDelegate ,CartDelegate
//{
//    func alarmCartIsFilled(itemCount: String) {
//        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 \(itemCount)개의 상품이 추가되었습니다.", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//        alertVC.addAction(okAction)
//
//        present(alertVC, animated: true, completion: nil)
//    }
//
//    var unityNC: UINavigationController?
//    var nativeNC: UINavigationController?
//
//
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { // in half a second...
//            print("Are we there yet?")
//            self.selectedIndex = 0
////            UnityEmbeddedSwift.unloadUnity()
////            UnityEmbeddedSwift.unregisterFrameworkListener(self)
////            UnityEmbeddedSwift = nil
////            UnityEmbeddedSwift.shared = nil
//            //UnityEmbeddedSwift.hideUnity()
//            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyProfileViewController") as? ModifyProfileViewController else { return }
//            vc.delegate = self
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        delegate = self
//
//        // start unity and immediatly set as rootViewController
//        // this loophole makes it possible to run unity in the same window
//        print("이거슨 루트 텝바")
//
//        // 여기서 유니티 통신
//
//        UnityEmbeddedSwift.showUnity()
////        let message = UnityMessage(gameObjectName: "Canvas",
////                                   functionName: "getID",
////                                   message: "바꺄라 얍")
//
//        UnityEmbeddedSwift.sendUnityMessage(objectName:"EventSystem",methodName: "SetText",message: "바꺄라 얍")
//
//        let unityViewController = UnityEmbeddedSwift.getUnityRootViewController()!
//        unityViewController.navigationItem.title = "Unity"
//
//
//
//
//        unityNC = UINavigationController.init(rootViewController: unityViewController)
//        unityNC?.tabBarItem.title = "Unity"
//
//        let nativeViewController = UIViewController.init()
//        nativeViewController.view.backgroundColor = UIColor.darkGray
//        nativeViewController.navigationItem.title = "Native"
//
//        nativeNC = UINavigationController.init(rootViewController: nativeViewController)
//        nativeNC?.tabBarItem.title = "Native"
//
//        viewControllers = [unityNC!, nativeNC!]
//        self.selectedIndex = 1
//        // select other tab and reselect first tab to unfreeze unity-loading
//        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
//        //            self.selectedIndex = 1
//        //
//        //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
//        //                self.selectedIndex = 0
//        //            })
//        //        })
//    }
//
//    // MARK: - UITabBarControllerDelegate
//
//    override func viewDidDisappear(_ animated: Bool) {
//        print("사라지임")
//    }
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        // pause unity if unity-tab is not selected
//        if viewController != unityNC {
//            UnityEmbeddedSwift.pauseUnity()
//        } else {
//            UnityEmbeddedSwift.unpauseUnity()
//        }
//    }
//}
