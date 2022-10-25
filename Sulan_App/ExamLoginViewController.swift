////
////  ExamLoginViewController.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/08/14.
////
//
//import UIKit
//import GoogleSignIn
//
//
//class ExamLoginViewController: UIViewController, GIDSignInDelegate,CartDelegate{
//    func alarmCartIsFilled(itemCount: String) {
//        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 \(itemCount)개의 상품이 추가되었습니다.", preferredStyle: .alert)
//        
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//        alertVC.addAction(okAction)
//        
//        present(alertVC, animated: true, completion: nil)
//    }
//    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//                if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//                    print("The user has not signed in before or they have since signed out.")
//                } else {
//                    print("\(error.localizedDescription)")
//                }
//                return
//            }
//                print("여기서 나는 받고 있다 시이팔")
//            // 사용자 정보 가져오기
//            if let userId = user.userID,                  // For client-side use only!
//                let idToken = user.authentication.idToken, // Safe to send to the server
//                
//                let email = user.profile.email {
//                    
//                print("Token : \(idToken)")
//                print("User ID : \(userId)")
//                print("User Email : \(email)")
//                
//         
//            } else {
//                print("Error : User Data Not Found")
//            }
//        }
//            
//        // 구글 로그인 연동 해제했을때 불러오는 메소드
//        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//            print("Disconnect")
//        }
//    var googleSignInButton = GIDSignInButton()
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 20) { // in half a second...
//                            print("Are we there yet?")
//                            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyProfileViewController") as? ModifyProfileViewController else { return }
//                                vc.delegate = self
//                                self.present(vc, animated: true, completion: nil)
//                        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(googleSignInButton)
//        print("이거 시작 되나?")
//        UnityEmbeddedSwift.showUnity()
//        
//        let uView = UnityEmbeddedSwift.getUnityView()
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
//            self.view.addSubview(uView!)
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
//                self.view.sendSubviewToBack(uView!)
//            })
//        })
//        
//        
//        
//        
//        // Do any additional setup after loading the view.
//        googleSignInButton.style = .wide
//        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
//        googleSignInButton.addTarget(self, action: #selector(setGoogleSignInButton), for: .touchUpInside)
//    
//    
//            NSLayoutConstraint.activate([
//                googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                googleSignInButton.centerYAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//    
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//   @objc func setGoogleSignInButton() {
//
//        GIDSignIn.sharedInstance()?.presentingViewController = self
////       GIDSignIn.sharedInstance()?.signIn()
//        GIDSignIn.sharedInstance().delegate = self
//  
//        //googleSignInButton.style = .standard // .wide .iconOnly
//
//    }
//}
