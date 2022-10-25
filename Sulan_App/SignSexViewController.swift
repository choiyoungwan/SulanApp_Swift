//
//  SignSexViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/01.
//

import UIKit

class SignSexViewController: UIViewController
{

    let AD = UIApplication.shared.delegate as? AppDelegate
    var nextButton = UIButton()   ///다음으로 넘어가는 버튼
    var labet_Title = UILabel()   ///타이틀 라벨
    var stackView = UIStackView()
    var btnSexM = UIButton() //남성 버튼
    var btnSexW = UIButton() //여성 버튼
//    var ttet = UITextField()
    var emailT : String?
    var sexText: String?
    
    
    //인텐트로 받는값
    var ageT: String?
    var yearT: String?
    var nickT: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(nextButton)
        self.view.addSubview(labet_Title)
        self.view.addSubview(stackView)
        self.view.addSubview(btnSexM)
        self.view.addSubview(btnSexW)
//        self.view.addSubview(ttet)
        
        print("===넘어온값=== \n 닉네임 확인 \(nickT),나이확인\(ageT),연생확인\(yearT)")
        labet_Title.text = "당신의 성별은?"
        labet_Title.translatesAutoresizingMaskIntoConstraints = false
        labet_Title.font = .boldSystemFont(ofSize: 30)
        
        
       
        
        //버튼 정의
        btnSexW.setTitle("여성", for: .normal)
        btnSexW.setTitleColor(.black, for: .normal)
        btnSexW.backgroundColor = .orange
        btnSexW.layer.cornerRadius = 22
        btnSexW.layer.borderColor = UIColor.black.cgColor
        btnSexW.layer.borderWidth = 1.0
        btnSexW.backgroundColor = .white
        btnSexW.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)

        
        
        btnSexM.setTitle("남성", for: .normal)
        btnSexM.setTitleColor(.black, for: .normal)
        btnSexM.layer.borderColor = UIColor.black.cgColor
        btnSexM.layer.borderWidth = 1.0
        btnSexM.backgroundColor = .white
        btnSexM.layer.cornerRadius = 22
        btnSexM.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)

        
        
        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        print(view.frame.height)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
       
        
        nextButton.layer.cornerRadius = 25
        nextButton.addTarget(self, action: #selector(moveActive), for: .touchUpInside)
        
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical //가로 모드
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.distribution = .fillEqually
//        stackView.backgroundColor = UIColor.blue
       
        stackView.addArrangedSubview(btnSexM)
        stackView.addArrangedSubview(btnSexW)
        
        
        //엥커 레이아웃 가이드
//        NSLayoutConstraint.activate([
//                    stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150),
//                    stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
//                    stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
//                    stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -500)
//                ])
//
        
        
    }
    //화면 보여주는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labet_Title.frame = CGRect(x: 20, y: view.safeAreaLayoutGuide.layoutFrame.minY + 50 , width: self.view.width - 40, height: 70)
        stackView.frame = CGRect(x: 20, y: labet_Title.frame.minY + 100 , width: 120, height: 100)

        nextButton.backgroundColor = .orange
//        if(sexText != nil){
//
//        }else{
//            nextButton.backgroundColor = .gray
//        }
        
        print("value1: \(String(describing: ageT))")
        print(yearT as Any)
    }
    
    
    //화면 전환 메서드
    @objc func moveActive(_ sender: Any){
        
        
        if(sexText==nil){
            //알러트 띄우는 구문
            let alert = UIAlertController(title: "성별을 체크해주세요", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
       
        
        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SignMbtiViewController") as! SignMbtiViewController
        movedVC.nickT = nickT
        movedVC.ageT = ageT
        movedVC.yearT = yearT
        movedVC.sexT = sexText
        self.navigationController?.pushViewController(movedVC, animated: false)
        
    }
    
    
    
    
    @objc func choice_btn(_ sender: Any){
        sexText = (sender as AnyObject).currentTitle!
        if(sexText == "남성"){
        btnSexM.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btnSexM.setTitleColor(.white, for: .normal)
        btnSexW.backgroundColor = .white
        btnSexW.setTitleColor(.black, for: .normal)
        }else if(sexText == "여성"){
        btnSexW.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btnSexW.setTitleColor(.white, for: .normal)
        btnSexM.backgroundColor = .white
        btnSexM.setTitleColor(.black, for: .normal)
        }
    }
}


