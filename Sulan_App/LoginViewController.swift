//
//  LoginViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/01.
//

import UIKit
import GoogleSignIn
import Alamofire
import SwiftyJSON
import WebKit


//로그인 클래스
class LoginViewController: UIViewController , GIDSignInDelegate, SendDataDelegate, UIViewControllerTransitioningDelegate{
    func sendMessage(toMobileApp message: String!) {
        print("여기는 로그인 메세지 +++\(message!)")
        
    }
    
   
  
    //구글 로그인
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        print("구글 로그인 후 정보 가져오는 부분")
        // 사용자 정보 가져오기
        if let userId = user.userID,                  // For client-side use only!
           let idToken = user.authentication.idToken, // Safe to send to the server
           
            let email = user.profile.email {
            
            print("Token : \(idToken)")
            print("User ID : \(userId)")
            print("User Email : \(email)")
            //Url주소 바꿔야됌
            AF.request("http://49.247.196.22/my_php/testing.php", method: .post,parameters: ["test":email,"status" : ""])
                .response { [self]  response in
                    debugPrint(response)
                    
                    print("===================================\(response)")
                    switch response.result {
                        //
                    case .success(let value):
                        let jsonValue = JSON(value as Any)
                        print("통신 성공")
                        print(jsonValue)
                        for (index, subJson): (String, JSON) in jsonValue {
                            //value 값이 비어있는지모르기때문에 guard문법 사용 (예외처리)
                            guard let name = jsonValue["test"].string,
                                  let code = jsonValue["message"].string else {
                                continue
                            }
                            if(index == "message"){
                                if(code == "false"){
                                    print("출력됌")
                                    print("[\(index)] code: \(code) / name: \(name)")
                                    let movedVC = self.AD?.StoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                    
                                    movedVC.emailT = userId
                                    self.navigationController?.pushViewController(movedVC, animated: false)
                                    
                                    
                                    
                                }
                                else{
                                    
                                    print("========유니티 시작 =======")
                                    print("[\(index)] code: \(code) / name: \(name)")
                                    UnityManager.shared.launchUnity()
                                    let message = UnityMessage(gameObjectName: "EventSystem",
                                                               functionName: "SetText",
                                                               message: "닉네임!")
                                    UnityManager.shared.sendMessageToUnity(message)
                                    
                                    //                                let movedVC = self.AD?.StoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                    //                                        self.navigationController?.pushViewController(movedVC, animated: false)
                                    print("========유니티 끝=======")
                                }
                            }else{
//                                print("========유니티 시작 =======")
//                                print("[\(index)] code: \(code) / name: \(name)")
//                                UnityManager.shared.launchUnity()
//                                let message = UnityMessage(gameObjectName: "EventSystem",
//                                                           functionName: "SetText",
//                                                           message: "닉네임!")
//                                UnityManager.shared.sendMessageToUnity(message)
//                                //                                let movedVC = self.AD?.StoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                                //                                        self.navigationController?.pushViewController(movedVC, animated: false)
//                                print("========유니티 끝=======")
                            }
                            
                        }
                        
                    case .failure(let error):
                        print("통신 실패")
                        print(error)
                        
                    }
                }
            
        } else {
            print("Error : User Data Not Found")
        }
    }
    
    // 구글 로그인 연동 해제했을때 불러오는 메소드
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Disconnect")
    }
    
    /*
     웹뷰
     */
    var myURL: URL?
    var webView: WKWebView!
    
    
    let AD = UIApplication.shared.delegate as? AppDelegate
    
    ///구글로그인 연습 버튼
    var bbbb = UIButton()
    
    var email : String?
    let textView = UITextView()
    var googleLoginButton = GIDSignInButton()
    let aImageView = UIImageView()
    let explain_label = UILabel()
    var signT : String?
    var nickT : String?
    

    //var delegate: CartDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
        ///구글로그인 연습 예제
        view.addSubview(bbbb)
        print("ViewDidLoad")
        bbbb.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)

        bbbb.setTitle("다음", for: .normal)
        bbbb.setTitleColor(.black, for: .normal)

        bbbb.backgroundColor = .orange
        bbbb.layer.cornerRadius = 25
        bbbb.addTarget(self, action: #selector(moveActive(_:))
                       , for: .touchUpInside)
        
        //뷰 정의 메서드
        configureUI()
        
    }
    
    func receiveData(data: String) {
        print("들어오나::::::?")
    }
    
    
    //생명주기확인
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        let temp = navigationArray.last
        navigationArray.removeAll()
        navigationArray.append(temp!) //To remove all previous UIViewController except the last one
        self.navigationController?.viewControllers = navigationArray
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        print("viewDidAppear:::")
        //회원가입이 이루어진 후 회원 데이터가 있다면 유니티로 이동
        if(signT != nil){
            print("여기는 로그인 회원 데이터가 있나용??\(signT!)")
            UnityManager.shared.launchUnity()
            //유니티 오브젝트명/유니티 메서드명/유니티로 보낼 변수 값
            let message = UnityMessage(gameObjectName: "Canvas",
                                       functionName: "getID",
                                       message: nickT!)
            UnityManager.shared.sendMessageToUnity(message)
        }
        
//        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear : 종료 됌")
    }
    
    
    
    //구글 로그인 시 처리 로직
    @IBAction func clickgoogle(_ sender: Any){
        print("구글로그인 클릭 됌")
        
    }
    //구글로그인
    private func configureUI() {
     
        view.addSubview(googleLoginButton)
        view.addSubview(aImageView)
        view.addSubview(explain_label)
        view.addSubview(textView)
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        googleLoginButton.style = .wide
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        googleLoginButton.addTarget(self, action: #selector(clickgoogle), for: .touchUpInside)
        
        
        //            NSLayoutConstraint.activate([
        //                googleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //                googleLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //            ])
        //이미지 뷰
        aImageView.backgroundColor = .white
        //표시될 UIImage 객체 부여
        aImageView.image = UIImage(named: "logo")
        //둥근 원 모양 추가 하기
        aImageView.contentMode = .scaleToFill
        
        //넘치는 영역 잘라내기
        aImageView.clipsToBounds = true
        
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //라벨링
        //        let generalText = String(
        //            format: "로그인 함으로써 설랜의 %@ ,\n%@에 동의한것으로 간주하겠습니다"
        //            ,"개인정보 취급방침","서비스 이용약관"
        //        )
        //        explain_label.text = generalText
        //        explain_label.lineBreakMode = .byWordWrapping
        //
        //        explain_label.numberOfLines = 0
        //        explain_label.translatesAutoresizingMaskIntoConstraints = false
        //        explain_label.font = .boldSystemFont(ofSize: 15)
        //        explain_label.textAlignment = .center
        //
        textView.isEditable = false
        textView.font = .boldSystemFont(ofSize: 15)
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.text = "로그인 함으로써 설랜의 개인정보 취급방침 ,\n 서비스 이용약관에 동의한것으로 간주하겠습니다"
        textView.textAlignment = .center
        
        let linkedText = NSMutableAttributedString(attributedString: textView.attributedText)
        let hyperlinked = linkedText.setAsLink(textToFind: "개인정보 취급방침", linkURL: "https://polarized-salary-805.notion.site/5c1bcc4c735b4d37b48aa86b4ddf0b9f")
        let hyperlinkeded = linkedText.setAsLink(textToFind: "서비스 이용약관", linkURL: "https://polarized-salary-805.notion.site/85b6103420eb450f8b6958969f8c25f1")
        if hyperlinked {
            textView.attributedText = NSAttributedString(attributedString: linkedText)
        }
        if hyperlinkeded {
            textView.attributedText = NSAttributedString(attributedString: linkedText)
        }
        
        
    }
    
    
    ///뷰 정의
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("이거 언제 나오나요?")
        
        aImageView.frame = CGRect(x: (self.view.frame.size.width - 300) / 2,y:  150
                                  ,width: 300, height: 300)
        googleLoginButton.frame = CGRect(x: (self.view.frame.size.width - 300) / 2, y: aImageView.frame.maxY + 100
                                         ,width: 300, height: 200)
        textView.frame = CGRect(x: 10, y: googleLoginButton.frame.minY + 50
                                ,width: self.view.frame.size.width , height: 100)
        //explain_label.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //화면 이동 연습용
    @objc func moveActive(_ sender: Any){
        print("클릭되었나요?")
        
        
        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "ModifyProfileViewController") as! ModifyProfileViewController
//        movedVC.nickT = "nickT"
//        movedVC.ageT = "ageT"
//        movedVC.yearT = "yearT"
//        movedVC.sexT = "sexText"
        self.navigationController?.pushViewController(movedVC, animated: false)
        //
        //
        //              // delegate를 위임받음
        //               self.navigationController?.pushViewController(viewController, animated: true)
        
        //회원가입으로 가는 로직
        //        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //        // 이미지 연습
        ////        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "ExamImgViewController") as! ExamImgViewController
        //        //로그인
        ////        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        //        self.navigationController?.pushViewController(movedVC, animated: false)
        //
        //        guard let welcomeVC =  self.storyboard?.instantiateViewController(withIdentifier: "Unity_GameViewController") as? Unity_GameViewController else {return}
        //
        //          welcomeVC.modalPresentationStyle = .fullScreen
        //          self.present(welcomeVC, animated: true, completion: nil)
//                let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SettiongViewController") as! SettiongViewController
//                        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "RootTabBarController") as! RootTabBarController
//                self.navigationController?.pushViewController(movedVC, animated: false)
//
        
//        let uView = UnityEmbeddedSwift.getUnityView()
       
//        UnityEmbeddedSwift.showUnity()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
//
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
//                self.view.sendSubviewToBack(uView!)
//            })
//        })
    }
    
    
    
    

}
extension NSMutableAttributedString {
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        // 하이퍼링크를 추가하고자 하는 text의 위치, 글자 수 를 찾는다.
        let foundRange = self.mutableString.range(of: textToFind)
        
        // text의 위치 존재 여부 확인
        if foundRange.location != NSNotFound {
            
            // 지정된 범위에 문자(링크)를 추가해준다.
            self.addAttribute(.link, value: linkURL, range: foundRange)
            
            // 위치가 맞다면 true 반환
            return true
        }
        
        // 위치가 틀리면 false 반환
        return false
    }
    
}

