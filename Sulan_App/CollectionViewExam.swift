////
////  CollectionViewExam.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/10/25.
////
//
//import UIKit
//import SwiftUI
//
//class CSCollectionViewCell : UICollectionViewCell {
//
//    var label: UILabel!
//    var mbtibtn : UIButton!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupView() {
//        label = UILabel()
//        mbtibtn = UIButton()
//        //... add your custom character
//        contentView.addSubview(label)
//        contentView.addSubview(mbtibtn)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        mbtibtn.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//            //label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
////            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
//}
//
//class CollectionViewExam: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//
//    var list = ["ISFP", "ISTP","ISFJ", "ISTJ", "INFP","INTP","INFJ","INTJ",
//                "ESFP", "ESTP","ESFJ", "ESTJ", "ENFP","ENTP", "ENFJ","ENTJ"]
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: "cell" ,
//            for: indexPath) as! CSCollectionViewCell
//        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 25
//        cell.layer.borderWidth = 1.5
//        cell.label.text = self.list[indexPath.row]
//        cell.label.textColor = .black
//        //        cell.label.backgroundColor = .black
//        return cell
//    }
//    // 컬렉션 뷰의  샤이즈
//    //       func collectionView(
//    //            _ collectionView: UICollectionView,
//    //            layout collectionViewLayout: UICollectionViewLayout,
//    //            sizeForItemAt indexPath: IndexPath
//    //       ) -> CGSize {
//    //            return CGSize(width: 300, height: 100)
//    //       }
//    // 위 아래 간격
//    //        func collectionView(
//    //            _ collectionView: UICollectionView,
//    //            layout collectionViewLayout: UICollectionViewLayout,
//    //            minimumLineSpacingForSectionAt section: Int
//    //            ) -> CGFloat {
//    //            return 5
//    //        }
//    //
//    //        // 옆 간격
//    //        func collectionView(
//    //          _ collectionView: UICollectionView,
//    //          layout collectionViewLayout: UICollectionViewLayout,
//    //          minimumInteritemSpacingForSectionAt section: Int
//    //          ) -> CGFloat {
//    //              return 3
//    //          }
//
//    // 위 아래 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    // 옆 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
//
//    // cell 사이즈( 옆 라인을 고려하여 설정 )
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width / 4 - 2 ///  4등분하여 배치, 옆 간격이 1이므로 1을 빼줌
//        print("collectionView width=\(collectionView.frame.width)")
//        print("cell하나당 width=\(width)")
//        print("root view width = \(self.view.frame.width)")
//
//        let size = CGSize(width: width, height: 50)
//        return size
//    }
//
//    //// change background color when user touches cell
////    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
////        let cell = collectionView.cellForItem(at: indexPath)
////        cell?.backgroundColor = UIColor.red
////    }
////
////    // change background color back when user releases touch
////    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
////        let cell = collectionView.cellForItem(at: indexPath)
////        cell?.backgroundColor = UIColor.cyan
////    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CSCollectionViewCell {
//            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//
//        }
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CSCollectionViewCell {
//            cell.backgroundColor = UIColor.white
//        }
//    }
//
//
//
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let lavel = UILabel()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(CSCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//        //cv.backgroundColor = .blue
//        return cv
//    }()
//
//    let AD = UIApplication.shared.delegate as? AppDelegate
//    var nextButton = UIButton()   ///다음으로 넘어가는 버튼
//    var labet_Title = UILabel()   ///타이틀 라벨
//    ///
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(collectionView)
//        self.view.addSubview(labet_Title)
//        self.view.addSubview(nextButton)
//
//
//        collectionView.backgroundColor = .white
//        //  컬렉션 뷰의 기능을 누가 사용하지는지 ? 👉 self 즉, 나 자신 클래스인 MainViewController
//        collectionView.delegate = self
//        //  컬렉션 뷰의 데이타 제공자는 ? 👉  self 즉, 나 자신 클래스인 MainViewController
//        collectionView.dataSource = self
//
//
//        labet_Title.text = "당신의 MBTI는??"
//        labet_Title.translatesAutoresizingMaskIntoConstraints = false
//        labet_Title.font = .boldSystemFont(ofSize: 30)
//
//
//        //다음으로 가는 버튼
//        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
//        print(view.frame.height)
//        nextButton.setTitle("다음", for: .normal)
//        nextButton.setTitleColor(.black, for: .normal)
//        nextButton.layer.cornerRadius = 25
//        nextButton.addTarget(self, action: #selector(moveActive), for: .touchUpInside)
//        nextButton.backgroundColor = .orange
//        //        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
////        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
////        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
////        collectionView.heightAnchor.constraint(equalToConstant:  view.frame.height/2).isActive = true
//
//
//    }
//    //화면 보여주는 메서드
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        labet_Title.frame = CGRect(x: 30, y: 100 , width: view.frame.width, height: 70)
//        collectionView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 400)
//
//
//
//    }
//
//    //인텐트로 보내는 값
//    @objc func moveActive(_ sender: Any){
//
//        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
//
//        self.navigationController?.pushViewController(movedVC, animated: false)
//
//    }
//
//
//
//}
//
////// change background color when user touches cell
////func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
////    let cell = collectionView.cellForItem(at: indexPath)
////    cell?.backgroundColor = UIColor.red
////}
////
////// change background color back when user releases touch
////func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
////    let cell = collectionView.cellForItem(at: indexPath)
////    cell?.backgroundColor = UIColor.cyan
////}
