//
//  ExamMbti.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/10/24.
//

import UIKit
//import CHTCollectionViewWaterfallLayout


class ExamMbti: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                UICollectionViewDelegateFlowLayout{
    var list = ["1", "2", "3", "4" ,"5", "6", "7", "8", "9", "10"]
    
    let collectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
               cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mainCellId")
        cv.backgroundColor = .systemPink
        return cv
    }()
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        print("여기서 안되는 거가?")
        //self.view.addSubview(collectionView)
        collectionView.register(ExamMbti.self, forCellWithReuseIdentifier: "mainCellId")
        // 컬렉션 뷰의 기능을 누가 사용하지는지 ? 👉 self 즉, 나 자신 클래스인 MainViewController
        collectionView.delegate = self
        //  컬렉션 뷰의 데이타 제공자는 ? 👉  self 즉, 나 자신 클래스인 MainViewController
        collectionView.dataSource = self
        // defalt cell
        //collectionView.backgroundColor = .blue
     
}
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "mainCellId" ,
                    for: indexPath) 
//        else {
//
//                    }
        return cell
        //cell.backgroundColor = .blue
//        cell.lbl.text = list[indexPath.row]
//        cell.lbl.backgroundColor = .yellow
        
//        return cell
    }
    // 컬렉션 뷰의  샤이즈
       func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
       ) -> CGSize {
            return CGSize(width: 300, height: 100)
       }
    // 위 아래 간격
        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumLineSpacingForSectionAt section: Int
            ) -> CGFloat {
            return 5
        }

        // 옆 간격
        func collectionView(
          _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          minimumInteritemSpacingForSectionAt section: Int
          ) -> CGFloat {
              return 3
          }

       
    // 위 아래 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    // 옆 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    // cell 사이즈( 옆 라인을 고려하여 설정 )
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width / 3 - 1 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
//        print("collectionView width=\(collectionView.frame.width)")
//        print("cell하나당 width=\(width)")
//        print("root view width = \(self.view.frame.width)")
//
//        let size = CGSize(width: width, height: width)
//        return size
//    }
    
}
    
 



//    var btnArr: [UIButton] = []
//    var stackArr: [UIStackView] = []
//    var btnAge20 = UIButton()
//    var ttitle = UILabel()
//    //한번에 다 만들기
//    let stackView_V: UIStackView = {
//        let stackView = UIStackView()
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = .blue
//        stackView.spacing = 8
//        return stackView
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.addSubview(btnAge20)
//        self.view.addSubview(ttitle)
//        self.view.addSubview(self.stackView_V)
//
//        ttitle.text = "MBTI"
//        ttitle.backgroundColor = .orange
//        ttitle.translatesAutoresizingMaskIntoConstraints = false
//        ttitle.font = .boldSystemFont(ofSize: 30)
//
//
////        makeBtn()
//        makeStackView()
//        //makeStackLayout(stackArr: stackArr)
////        makeBtnLayout(btnArr:btnArr)
//        //버튼 정의
//        btnAge20.setTitle("Enfp", for: .normal)
//        btnAge20.setTitleColor(.black, for: .normal)
//
//        btnAge20.layer.cornerRadius = 25
//        btnAge20.layer.borderColor = UIColor.black.cgColor
//        btnAge20.layer.borderWidth = 1.0
//        btnAge20.backgroundColor = .white
//        btnAge20.addTarget(self, action: #selector(choice_btn), for: .touchUpInside)
//
//
//    }
//    //화면 보여주는 메서드
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        ttitle.frame = CGRect(x: 20, y: view.safeAreaLayoutGuide.layoutFrame.minY + 50 , width: self.view.width - 40, height: 70)
//
//
//        stackView_V.frame = CGRect(x: 20, y: ttitle.frame.minY + 100 , width: self.view.frame.size.width - 40, height: self.view.frame.size.height - 400)
//
//
//
//
//    }
//
//    @objc func choice_btn(_ sender: Any){
//        print("클릭이 되었습니다")
//    }
//
//    func makeStackView(){
//        for index:Int in 0..<4{
//            print("값 확인: \(index)")
//            let stackView_H = UIStackView()
//            stackView_H.tag = index
//            self.view.addSubview(stackView_H)
//            stackView_H.backgroundColor =  #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
//            stackView_H.layer.borderColor = UIColor.black.cgColor
//            stackView_H.distribution = .equalSpacing
//            stackView_H.layer.borderWidth = 1
//            stackView_H.layer.cornerRadius = 20
//            stackView_H.frame = CGRect(x: 20, y: ttitle.frame.minY + 100 , width: self.view.frame.size.width - 40, height: self.view.frame.size.height - 400)
//            let btn = UIButton()
//            btn.tag = index
//            self.view.addSubview(btn)
//            btn.backgroundColor =  #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
//            btn.layer.borderColor = UIColor.black.cgColor // borderColor = CGcolor
//            btn.layer.borderWidth = 1
//            btn.layer.cornerRadius = 20
//
//            stackView_H.addArrangedSubview(btn)
//            print("스택뷰에 담는 중....")
//            stackView_V.addArrangedSubview(stackView_H)
//
//        }
//    }
//
//    func makeStackLayout(stackArr: [UIStackView]) {
//        print(stackArr.count)
//        for stackView_H in stackArr {
//            let index = stackView_H.tag
//            let row = index / 4
//            let column = index % 4
//
//            let width = self.view.frame.size.width/4
//            let height = self.view.frame.size.height/4
//            stackView_H.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
//            stackView_V.addArrangedSubview(stackView_H)
//        }
//    }
//
//    func makeBtn() {
//        for index: Int in 0..<6 {
//            let btn = UIButton()
//            btn.tag = index
//            self.view.addSubview(btn)
//            btn.backgroundColor =  #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
//            btn.layer.borderColor = UIColor.black.cgColor // borderColor = CGcolor
//            btn.layer.borderWidth = 1
//            btn.layer.cornerRadius = 20
//            //btnArr.append(btn)
//            stackView_V.addArrangedSubview(btn)
//        }
//    }
//
//
//    func makeBtnLayout(btnArr: [UIButton]) {
//        for btn in btnArr {
//            let index = btn.tag
//            let row = index / 4
//            let column = index % 4
//
//            let width = self.view.frame.size.width/4
//            let height = self.view.frame.size.height/4
//            btn.frame = CGRect(x: CGFloat(column)*width, y: CGFloat(row)*height, width: width, height: height)
////            btn.addTarget(self, action: #selector(ViewController.switchColor), for: .touchUpInside)
//        }
//    }
//}
