//
//  SettiongViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/19.
//

import UIKit

class SettiongViewController: UIViewController,
                              UITableViewDataSource, UITableViewDelegate {
    
   let labelT = UILabel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath)
        
        let memoTitle = ["계정관리", "앱 튜토리어", "피드백", "서비스 이용약관", "개인정보 처리방침", "커뮤니티 가이드라인", "라이선스"]
        //        let memoContent = ["등촌칼국수, 너무 맛있다!!", "오늘은 커피를 안 마셨다.", "마늘 닭볶음탕 먹어보고 싶다. 궁금해", "오늘 테이블 뷰 블로그에 업로드하기 목표", "휴학해서 과제 없다. 부럽지", "매주 월요일 오후 4시에 시작합니다."]
        //
        //
        
        cell.textLabel?.text  = memoTitle[indexPath.row]
        //        cell.textLabel?.text = memoContent[indexPath.row]
        return cell
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        //        tableView.register(UICollectionViewCell.self, forCellReuseIdentifier: "table")
        return tableView
    }()
    
//    private let contentScrollView: UIScrollView = {
//            let scrollView = UIScrollView()
//            scrollView.translatesAutoresizingMaskIntoConstraints = false
//            scrollView.backgroundColor = .white
//            scrollView.showsVerticalScrollIndicator = false
//
//            return scrollView
//        }()
    
//    private let contentView: UIView = {
//            let view = UIView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
    
  
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = "Scroll Bottom"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor =  .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(labelT)
        
//        self.view.addSubview(contentView)
        labelT.text = "설정"
        labelT.font = .boldSystemFont(ofSize: 30)
        labelT.textAlignment = .center
        self.view.backgroundColor = .white
          self.view.addSubview(scrollView)
        //스크롤뷰
//        NSLayoutConstraint.activate([
//                   scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
//                   scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//                   scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//                   scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//
//
//       ])
       

          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
          scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

          scrollView.addSubview(labelOne)

          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

//          scrollView.addSubview(labelTwo)
//
//          labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
//          labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        scrollView.addSubview(tableView)

        
        tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        tableView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "table")
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
//        labelT.frame = CGRect(x: 0, y: self.view.frame.minY + 50 , width: self.view.width, height: 60)
//        tableView.frame = CGRect(x: 0, y: labelT.frame.maxY + 30 , width: self.view.frame.width, height: 300 )
//        tableView.register(UITableViewCell.self,
//                           forCellReuseIdentifier: "table")
        
                    
    }
    private func setUpUIConstraints() {
      NSLayoutConstraint.activate([
       
//        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
////        imageView.leading.constraint(equalTo: contentView.topAnchor, constant: 50),
////        imageView.trailing.constraint(equalTo: contentView.topAnchor, constant: -50),
//        imageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
//        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        labelT.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)
      ])
      
    }
}
