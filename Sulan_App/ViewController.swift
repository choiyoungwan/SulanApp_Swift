//
//  ViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/07/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    
    //앱 델리게이트에서 가져온다.
    let AD = UIApplication.shared.delegate as? AppDelegate
    //변수 선언
    var nextButton = UIButton()   ///다음으로 넘어가는 버튼
    var labet_Title = UILabel()   ///타이틀 라벨
    var stackView = UIStackView()
    var label_explen = UILabel()
    var text_Nick = UITextField()  //닉네임 6글자로 제한
    var nick: String?  //닉네임
    var emailT : String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //버튼 선언
        self.view.addSubview(nextButton)
        self.view.addSubview(labet_Title)
        self.view.addSubview(stackView)
        self.view.addSubview(label_explen)
        self.view.addSubview(text_Nick)
        //라벨 정의
        labet_Title.text = "당신의 닉네임은?"
        labet_Title.translatesAutoresizingMaskIntoConstraints = false
        labet_Title.font = .boldSystemFont(ofSize: 30)
//        labet_Title.adjustsFontSizeToFitWidth = true//width에 맞게 크기 조절 가능
        
        
        
        //라벨 정의
        label_explen.text = "사진을 제외한 닉네임 나이, 성별은 추후" +
        "변경이 불가하오니 정확한 정보 입력 부탁드립니다."
        label_explen.lineBreakMode = .byWordWrapping
        
        label_explen.numberOfLines = 0
        label_explen.translatesAutoresizingMaskIntoConstraints = false
        label_explen.font = .italicSystemFont(ofSize: 15)
        
        //텍스트 뷰
        text_Nick.placeholder = "닉네임을 입력해주세요"
//        text_Nick.borderStyle = .none
        



        //버튼 정의
        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        print(view.frame.height)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .orange
        nextButton.layer.cornerRadius = 25
        nextButton.addTarget(self, action: #selector(moveActive), for: .touchUpInside)
        
        
        
    }
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.text_Nick.resignFirstResponder()
        nick = text_Nick.text
        if(nick == "ㅇㅇ"){
            //알러트 띄우는 구문
            let alert = UIAlertController(title: "중복된 닉네임입니다.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    //시작하자 마자 키보드 보여주기
    override func viewWillAppear(_ animated: Bool) {
        self.text_Nick.becomeFirstResponder() 
        
    }
    
    
    
    //화면 보여주는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labet_Title.frame = CGRect(x: 20, y: view.safeAreaLayoutGuide.layoutFrame.minY + 50 , width: self.view.width - 40, height: 70)
        label_explen.frame = CGRect(x: 20, y: text_Nick.frame.midY + 25, width: self.view.frame.width - 20, height: 70)
        text_Nick.frame = CGRect(x: 20, y:view.safeAreaLayoutGuide.layoutFrame.minY + 120, width: self.view.frame.width - 20, height: 70)
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.black.cgColor
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: text_Nick.frame.size.height - width - 5, width: self.view.width - 40, height: 1)
        
       
        text_Nick.layer.addSublayer(border)
//        text_Nick.layer.masksToBounds = true
    }
    
    //화면 전환 메서드
    @objc func moveActive(_ sender: Any){
        nick = text_Nick.text
        print("값 확인 중" + nick!)
        if(nick==""){
            //알러트 띄우는 구문 (닉네임이 없을 경우)
            let alert = UIAlertController(title: "닉네임을 입력해주세요", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
    
        nick = text_Nick.text
        print("회원정보 확인 : : : \(emailT!)")
        print("회원정보 확인 : : : \(nick!)")
        let param: [String: [String]] = [
            "user_nickname": [nick!]
        ]
        
        ///여기서 부터 서버랑 통신 알라모파이어
        let url = "https://www.sulan.site/app/v1/user/nicknamecheck"
        
        AF.request(url, method: .get, parameters: param
        ).responseData { [self] response in
                  debugPrint(response)
            switch response.result {
            case .success(let value):
                print("통신 성공")
                do{
                    print("응답 데이터 :: ", String(data: value, encoding: .utf8) ?? "")
                }
                if(String(data: value, encoding: .utf8) == "사용가능한 닉네임입니다"){
                    let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SignAgeViewController") as! SignAgeViewController
                        movedVC.nickT = nick
                        movedVC.emailT = emailT
                        self.navigationController?.pushViewController(movedVC, animated: false)
                }else{
                    let alert = UIAlertController(title: "이미 사용중인 닉네임입니다", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
                    self.present(alert, animated: true)
                }
            

            
        case .failure(let error):
            print("통신 실패")
            print(error)
              }
        }
        //회원가입으로 가는 로직
//        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SignAgeViewController") as! SignAgeViewController
//        // 이미지 연습
////        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "ExamImgViewController") as! ExamImgViewController
//        //로그인
////        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        movedVC.nickT = nick
//        movedVC.emailT = emailT
//        self.navigationController?.pushViewController(movedVC, animated: false)
        
    }
  
    
    
    
}

