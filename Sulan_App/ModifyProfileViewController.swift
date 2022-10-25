//
//  ModifyProfileViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/17.
//

import UIKit

class ModifyProfileViewController: UIViewController,
                                   UITableViewDataSource, UITableViewDelegate{
    
    

    let labet_Title = UILabel()
    let imageView = UIImageView()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath)
        
        let memoTitle = ["오늘 먹은 음식", "커피", "맛집 추천", "오늘 할 일", "과제", "스터디 날짜"]
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
    let label_profile = UILabel()
    var bbbb = UIButton()
    //var delegate: CartDelegate?
    let AD = UIApplication.shared.delegate as? AppDelegate
    
//    private let contentScrollView: UIScrollView = {
//            let scrollView = UIScrollView()
//            scrollView.translatesAutoresizingMaskIntoConstraints = false
//            scrollView.backgroundColor = .white
//            scrollView.showsVerticalScrollIndicator = false
//            
//            return scrollView
//        }()
//    
//    private let contentView: UIView = {
//            let view = UIView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
    ///////////////////////////////////////////////////////   viewDidLoad   ///////////////////////////////////////////////////////////////////
    ///
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // navigationController?.navigationBar.isHidden = true
        //선언
        self.view.addSubview(imageView)
        self.view.addSubview(labet_Title)
        self.view.addSubview(label_profile)
  
        
//        contentView.addSubview(labet_Title)
//        contentView.addSubview(imageView)
//        contentView.addSubview(label_profile)
//        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .white
        //표시될 UIImage 객체 부여
        //imageView.image = UIImage(named: "default")
        
        //둥근 원 모양 추가 하기
        imageView.contentMode = .scaleToFill
        imageView.center = view.center
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        label_profile.text = "  프로필 정보"
        label_profile.font = .boldSystemFont(ofSize: 25)
        label_profile.backgroundColor = .lightGray
        
        
        labet_Title.text = "프로필"
        labet_Title.translatesAutoresizingMaskIntoConstraints = false
        labet_Title.font = .boldSystemFont(ofSize: 30)
        
        view.addSubview(bbbb)
        print("상세프로필 == ViewDidLoad")
        bbbb.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        
        bbbb.setTitle("다음", for: .normal)
        bbbb.setTitleColor(.black, for: .normal)
        
        bbbb.backgroundColor = .orange
        bbbb.layer.cornerRadius = 25
        bbbb.addTarget(self, action: #selector(moveActive(_:))
                       , for: .touchUpInside)
    }
    
   

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let url = URL(string:"http://49.247.196.22/img/wans_profile.jpg")
        var image : UIImage?
                /* 이미지 뷰 위치 잡기 */
        //         UniqueName.jpeg
                DispatchQueue.global().async {
                           let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async { [self] in
                       image = UIImage(data: data!)
                               imageView.image = image
                           }
                       }
        
        labet_Title.frame = CGRect(x: 30, y: 100 , width: self.view.width, height: 60)
        imageView.frame = CGRect(x: (self.view.frame.size.width - 200) / 2,y:  labet_Title.frame.maxY + 30
                                 ,width: 200, height: 200)
        label_profile.frame  = CGRect(x: 0, y: imageView.frame.maxY + 30 , width: self.view.frame.width, height: 50 )
        
        tableView.frame = CGRect(x: 0, y: label_profile.frame.maxY + 10 , width: self.view.frame.width, height: 300 )
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "table")
       
        
    }

    
    @objc func moveActive(_ sender: Any){
        print("여기는 상세 프로필 클릭")
        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SettiongViewController") as! SettiongViewController
       
        self.navigationController?.pushViewController(movedVC, animated: false)
            dismiss(animated: true, completion: nil)
            //delegate?.alarmCartIsFilled(itemCount: "xxxxx")
    
    }
    
    
}
