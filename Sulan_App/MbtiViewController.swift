//
//  MbtiViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/12.
//

import UIKit

class MbtiViewController: UIViewController {

    var nextButton = UIButton()
    let StoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    //받아온 값
    var ageT: String?
    var yearT: String?
    var nickT: String?
    var sexT: String?
    var mbtiT: String?
    
    @IBOutlet weak var ISFP: UIButton!
    @IBOutlet weak var ISTP: UIButton!
    
    @IBOutlet weak var ISFJ: UIButton!
    
    @IBOutlet weak var ISTJ: UIButton!
    
    @IBOutlet weak var INFP: UIButton!
    
    @IBOutlet weak var ENTJ: UIButton!
    @IBOutlet weak var ENFJ: UIButton!
    @IBOutlet weak var INTP: UIButton!
    @IBOutlet weak var ENFP: UIButton!
    
    @IBOutlet weak var ENTP: UIButton!
    @IBOutlet weak var ESTJ: UIButton!
    @IBOutlet weak var ESFJ: UIButton!
    @IBOutlet weak var ESTP: UIButton!
    @IBOutlet weak var ESFP: UIButton!
    @IBOutlet weak var INTJ: UIButton!
    @IBOutlet weak var INFJ: UIButton!
    

    var btnArr: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(ageT as Any,yearT as Any,sexT as Any)
        
        self.view.addSubview(nextButton)
      nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
      print(view.frame.height)
      nextButton.setTitle("다음", for: .normal)
      nextButton.setTitleColor(.black, for: .normal)
      nextButton.backgroundColor = .orange
      nextButton.layer.cornerRadius = 25
      nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        makeBtn()
        makeBtnLayout(btnArr: btnArr)
        /** MBTI    나중에 지워라.      =======*/
        ISFP.setTitle("ISFP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ISFP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ISFP.layer.borderColor = UIColor.black.cgColor
        ISFP.layer.cornerRadius = 15
        ISFP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ISTP.setTitle("ISTP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ISTP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ISTP.layer.borderColor = UIColor.black.cgColor
        ISTP.layer.cornerRadius = 15
        ISTP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ISFJ.setTitle("ISFJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ISFJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ISFJ.layer.borderColor = UIColor.black.cgColor
        ISFJ.layer.cornerRadius = 15
        ISFJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ISTJ.setTitle("ISTJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ISTJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ISTJ.layer.borderColor = UIColor.black.cgColor
        ISTJ.layer.cornerRadius = 15
        ISTJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        INFP.setTitle("INFP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        INFP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        INFP.layer.borderColor = UIColor.black.cgColor
        INFP.layer.cornerRadius = 15
        INFP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        INTP.setTitle("INTP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        INTP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        INTP.layer.borderColor = UIColor.black.cgColor
        INTP.layer.cornerRadius = 15
        INTP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        INFJ.setTitle("INFJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        INFJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        INFJ.layer.borderColor = UIColor.black.cgColor
        INFJ.layer.cornerRadius = 15
        INFJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        INTJ.setTitle("INTJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        INTJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        INTJ.layer.borderColor = UIColor.black.cgColor
        INTJ.layer.cornerRadius = 15
        INTJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ESFP.setTitle("ESFP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ESFP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ESFP.layer.borderColor = UIColor.black.cgColor
        ESFP.layer.cornerRadius = 15
        ESFP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ESTP.setTitle("ESTP", for: .normal)
//        ESTP.backgroundColor = .lightGray
        ESTP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ESTP.layer.borderColor = UIColor.black.cgColor
        ESTP.layer.cornerRadius = 15
        ESTP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ESFJ.setTitle("ESFJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ESFJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ESFJ.layer.borderColor = UIColor.black.cgColor
        ESFJ.layer.cornerRadius = 15
        ESFJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ESTJ.setTitle("ESTJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ESTJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ESTJ.layer.borderColor = UIColor.black.cgColor
        ESTJ.layer.cornerRadius = 15
        ESTJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ENFP.setTitle("ENFP", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ENFP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ENFP.layer.borderColor = UIColor.black.cgColor
        ENFP.layer.cornerRadius = 15
        ENFP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ENTP.setTitle("ENTP", for: .normal)
//        ENTP.backgroundColor = .lightGray
        ENTP.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ENTP.layer.borderColor = UIColor.black.cgColor
        ENTP.layer.cornerRadius = 15
        ENTP.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        ENFJ.setTitle("ENFJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ENFJ.layer.borderWidth = 1
//        ageFbtn.setTitleColor(.black, for: .normal)
        ENFJ.layer.borderColor = UIColor.black.cgColor
        ENFJ.layer.cornerRadius = 15
        ENFJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        
        ENTJ.setTitle("ENTJ", for: .normal)
//        ageFbtn.backgroundColor = .lightGray
        ENTJ.layer.borderWidth = 1
//        ESTP.setTitleColor(.black, for: .normal)
        ENTJ.layer.borderColor = UIColor.black.cgColor
        ENTJ.layer.cornerRadius = 15
        ENTJ.addTarget(self, action: #selector(choiceTapButton), for: .touchUpInside)
        
        
      }
      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("이거 언제 나옴?")
        
    }
    
    
    
      @objc func didTapButton(_ sender: UIButton) {
          let movedVC = StoryBoard.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
         // movedVC.modalPresentationStyle = .fullScreen // 전체화면 (기본은 팝업형태)
          
          movedVC.nickT = nickT
          movedVC.sexT = sexT
          movedVC.ageT = ageT
          movedVC.yearT = yearT
          self.navigationController?.pushViewController(movedVC, animated: false)
      }
    
    @objc func choiceTapButton(_ sender: UIButton) {
        mbtiT  =  sender.currentTitle
        
        print(mbtiT!)
        
        if(mbtiT == "ENFP"){
            ENFP.backgroundColor = .blue
            ENFP.setTitleColor(.white, for: .normal)
            
           
        }else if(mbtiT == "ENTP"){
            ENTP.backgroundColor = .blue
            ENTP.setTitleColor(.white, for: .normal)
        }
            
        
    }
    

    func makeBtn() {
        for index: Int in 0..<16 {
            let btn = UIButton()
            btn.tag = index
            btn.setTitle("test", for: .normal)
            self.view.addSubview(btn)
            btn.backgroundColor =  #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            btn.layer.borderColor = UIColor.black.cgColor // borderColor = CGcolor
            btn.layer.borderWidth = 1
            btnArr.append(btn)
        }
    }
        
    func makeBtnLayout(btnArr: [UIButton]) {
        for btn in btnArr {
            let index = btn.tag
            let row = index / 4 // 0, 0, 0, 1, 1, 1, 2, 2, 2
            let column = index % 4 // 0, 1, 2, 0, 1, 2, 0, 1, 2
            
            let width = self.view.frame.size.width/3
            let height = self.view.frame.size.height/3
            
            btn.frame = CGRect(x: CGFloat(column)*width, y: CGFloat(row)*height, width: width, height: height)
            btn.addTarget(self, action: #selector(MbtiViewController.switchColor), for: .touchUpInside)
        }
    }
    
    var tileCase = OnOff.on
        enum OnOff {
            case on
            case off
        }
        
        func changeColorA(_ sender: UIButton) {
            let tag = sender.tag
            if isEvenNumber(num: tag) {
                sender.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }else {
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.8193424344, blue: 0, alpha: 1)
            }
        }
        
        func changeColorB(_ sender: UIButton) {
            let tag = sender.tag
            if isEvenNumber(num: tag) {
                sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }else {
                sender.backgroundColor = #colorLiteral(red: 0.9818221927, green: 0.1470750272, blue: 1, alpha: 1)
            }
        }

        @objc func switchColor(_ sender: UIButton) {
            for btn in btnArr {
                switch tileCase {
                case .on:
                    changeColorA(btn)
                    tileCase = .off
                case .off:
                    changeColorB(btn)
                    tileCase = .on
                }
            }
        }
        
        func isEvenNumber(num: Int) -> Bool {
            if num%2 == 0 {
                return true
            }else {
                return false
            }
        }
    
    
    
}
