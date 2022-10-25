//
//  SignAgeViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/01.
//

import UIKit

class SignAgeViewController: UIViewController
{

    let AD = UIApplication.shared.delegate as? AppDelegate
    var nextButton = UIButton()   ///다음으로 넘어가는 버튼
    var labet_Title = UILabel()   ///타이틀 라벨
    var stackView = UIStackView()
    var stackView_year = UIStackView()
    var btnAge20 = UIButton()
    var btnAge30 = UIButton()
    var btnAge40 = UIButton()
    var btnYearF = UIButton()   //초반
    var btnYearM = UIButton()   //중반
    var btnYearL = UIButton()   //후반
    var emailT : String?
    
    
    
    var ageText: String?
    var yearText: String?
    var nickT: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("=== 넘어온값 === \n 닉네임 확인 \(nickT)")
        
        self.view.addSubview(nextButton)
        self.view.addSubview(labet_Title)
        self.view.addSubview(stackView)
        self.view.addSubview(stackView_year)
        self.view.addSubview(btnAge20)
        self.view.addSubview(btnAge30)
        self.view.addSubview(btnAge40)
        self.view.addSubview(btnYearF)
        self.view.addSubview(btnYearM)
        self.view.addSubview(btnYearL)
        
        
        labet_Title.text = "당신의 연령은?"
        labet_Title.translatesAutoresizingMaskIntoConstraints = false
        labet_Title.font = .boldSystemFont(ofSize: 30)
        
        
       
        
        //버튼 정의
        btnAge20.setTitle("20대", for: .normal)
        btnAge20.setTitleColor(.black, for: .normal)
        btnAge20.backgroundColor = .orange
        btnAge20.layer.cornerRadius = 25
        btnAge20.layer.borderColor = UIColor.black.cgColor
        btnAge20.layer.borderWidth = 1.0
        btnAge20.backgroundColor = .white
        btnAge20.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)

        
        
        btnAge30.setTitle("30대", for: .normal)
        btnAge30.setTitleColor(.black, for: .normal)
        btnAge30.layer.borderColor = UIColor.black.cgColor
        btnAge30.layer.borderWidth = 1.0
        btnAge30.backgroundColor = .white
        btnAge30.layer.cornerRadius = 25
        btnAge30.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)

        btnAge40.setTitle("40대", for: .normal)
        btnAge40.setTitleColor(.black, for: .normal)
        btnAge40.layer.borderColor = UIColor.black.cgColor
        btnAge40.layer.borderWidth = 1.0
        btnAge40.backgroundColor = .white
        btnAge40.layer.cornerRadius = 25
        btnAge40.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)
        
        btnYearF.setTitle("초반", for: .normal)
        btnYearF.setTitleColor(.black, for: .normal)
        btnYearF.layer.borderColor = UIColor.black.cgColor
        btnYearF.layer.borderWidth = 1.0
        btnYearF.backgroundColor = .white
        btnYearF.layer.cornerRadius = 25
        btnYearF.addTarget(self, action: #selector(choice_btn_year), for: .touchUpInside)
        
        btnYearM.setTitle("중반", for: .normal)
        btnYearM.setTitleColor(.black, for: .normal)
        btnYearM.layer.borderColor = UIColor.black.cgColor
        btnYearM.layer.borderWidth = 1.0
        btnYearM.backgroundColor = .white
        btnYearM.layer.cornerRadius = 25
        btnYearM.addTarget(self, action: #selector(choice_btn_year), for: .touchUpInside)
        
        btnYearL.setTitle("후반", for: .normal)
        btnYearL.setTitleColor(.black, for: .normal)
        btnYearL.layer.borderColor = UIColor.black.cgColor
        btnYearL.layer.borderWidth = 1.0
        btnYearL.backgroundColor = .white
        btnYearL.layer.cornerRadius = 25
        btnYearL.addTarget(self, action: #selector(choice_btn_year), for: .touchUpInside)
        
        
        
        
        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        print(view.frame.height)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)


        nextButton.layer.cornerRadius = 25
        nextButton.addTarget(self, action: #selector(moveActive), for: .touchUpInside)
        
        
       
        stackView.axis = .horizontal //가로 모드
        stackView.alignment = .fill
        //stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
//        stackView.backgroundColor = UIColor.blue
        stackView.addArrangedSubview(btnAge20)
        stackView.addArrangedSubview(btnAge30)
        stackView.addArrangedSubview(btnAge40)
        
        
        stackView_year.axis = .horizontal //가로 모드
        stackView_year.alignment = .fill
        //stackView.distribution = .equalSpacing
        stackView_year.spacing = 10
        stackView_year.distribution = .fillEqually
//        stackView_year.backgroundColor = UIColor.blue
        stackView_year.addArrangedSubview(btnYearF)
        stackView_year.addArrangedSubview(btnYearM)
        stackView_year.addArrangedSubview(btnYearL)
        
        
        
        //엥커 레이아웃 가이드
//        NSLayoutConstraint.activate([
//                    stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150),
//                    stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
//                    stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
//                    stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -480)
//                ])
        
        
        
    }
    //화면 보여주는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labet_Title.frame = CGRect(x: 20, y: view.safeAreaLayoutGuide.layoutFrame.minY + 50 , width: self.view.width - 40, height: 70)
        stackView.frame = CGRect(x: 20, y: labet_Title.frame.minY + 100 , width: self.view.width - 40, height: 50)
        stackView_year.frame = CGRect(x: 20, y: stackView.frame.minY + 70 , width: self.view.width - 40, height: 50)
        
        
        
        nextButton.backgroundColor = .orange
//        if(ageText != nil && yearText != nil){
//            nextButton.backgroundColor = .orange
//        }else{
//            nextButton.backgroundColor = .gray
//        }
       
        
    }
    
    
    //화면 전환 메서드
    @objc func moveActive(_ sender: Any){
        
        //nick = text_Nick.text
//        print("값 확인 중" + nick!)
        if(ageText == nil){
            //알러트 띄우는 구문
            let alert = UIAlertController(title: "나이를 선택해주세요", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
        
        
        if(yearText == nil){
            //알러트 띄우는 구문
            let alert = UIAlertController(title: "당신의 연령정보를 선택해주세요", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
      
        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SignSexViewController") as! SignSexViewController
        movedVC.nickT = nickT
        movedVC.ageT = ageText
        movedVC.yearT = yearText
        self.navigationController?.pushViewController(movedVC, animated: false)
        
    }
    
    
    @objc func choice_btn(_ sender: Any){
        
        ageText = (sender as AnyObject).currentTitle!
        print(ageText as Any )
        if(ageText == "20대"){
            btnAge20.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnAge20.setTitleColor(.white, for: .normal)
            btnAge30.backgroundColor = .white
            btnAge30.setTitleColor(.black, for: .normal)
            btnAge40.backgroundColor = .white
            btnAge40.setTitleColor(.black, for: .normal)
        }
        else if(ageText == "30대"){
            btnAge20.backgroundColor = .white
            btnAge20.setTitleColor(.black, for: .normal)
            btnAge30.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnAge30.setTitleColor(.white, for: .normal)
            btnAge40.backgroundColor = .white
            btnAge40.setTitleColor(.black, for: .normal)
        }
        else if(ageText == "40대"){
            btnAge20.backgroundColor = .white
            btnAge20.setTitleColor(.black, for: .normal)
            btnAge30.backgroundColor = .white
            btnAge30.setTitleColor(.black, for: .normal)
            btnAge40.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnAge40.setTitleColor(.white, for: .normal)
        }
        
    }
    
    @objc func choice_btn_year(_ sender: Any){
        
        yearText = (sender as AnyObject).currentTitle!
        if(yearText == "초반"){
            btnYearF.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnYearF.setTitleColor(.white, for: .normal)
            btnYearM.backgroundColor = .white
            btnYearM.setTitleColor(.black, for: .normal)
            btnYearL.backgroundColor = .white
            btnYearL.setTitleColor(.black, for: .normal)
        }
        else if(yearText == "중반"){
            btnYearF.backgroundColor = .white
            btnYearF.setTitleColor(.black, for: .normal)
            btnYearM.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnYearM.setTitleColor(.white, for: .normal)
            btnYearL.backgroundColor = .white
            btnYearL.setTitleColor(.black, for: .normal)
        }
        else if(yearText == "후반"){
            btnYearF.backgroundColor = .white
            btnYearF.setTitleColor(.black, for: .normal)
            btnYearM.backgroundColor = .white
            btnYearM.setTitleColor(.black, for: .normal)
            btnYearL.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnYearL.setTitleColor(.white, for: .normal)
        }
        
    }
    
    
    
    

}
