//
//  CharacterViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/15.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class CharacterViewController: UIViewController , UICollectionViewDelegate,
                               UICollectionViewDataSource,
//                               UICollectionViewDelegateFlowLayout,
CHTCollectionViewDelegateWaterfallLayout{
    let AD = UIApplication.shared.delegate as? AppDelegate
    ///INTENT 받는 부분
    var ageT: String?
    var yearT: String?
    var nickT: String?
    var sexT: String?
    var mbtiT: String?
    var characT: String?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    //    var selectedIndexPath: NSIndexPath{
    //        didSet{
    //            collectionView.reloadData()
    //        }
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //            let width = collectionView.frame.width
        //            let height = collectionView.frame.height
        //            let itemsPerRow: CGFloat = 3
        //            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        //            let itemsPerColumn: CGFloat = 2
        //            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
        //            let cellWidth = (width - widthPadding) / itemsPerRow
        //            let cellHeight = (height - heightPadding) / itemsPerColumn
        //
        
        return CGSize(width: 70, height: 80)
        
        
        
        //        let width: CGFloat = collectionView.frame.width / 3 - 1.0
        //
        //               return CGSize(width: width, height: 100)
    }
    
    // CollectionView Cell의 위아래 간격
    //           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //               return 1.0
    //           }
    //
    //           // CollectionView Cell의 옆 간격
    //           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //               return 1.0
    //           }
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //            return sectionInsets
    //        }
    //
    //        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //            return sectionInsets.left
    //        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(" \(indexPath) Click")
        characT = "a\(indexPath.row + 1)"
        if(indexPath.row > 5){
            if(sexT == "남성"){
            characT = "m\(indexPath.row - 5)"
            }
            else{
            characT = "w\(indexPath.row - 5)"
            }
                
        }
       
        //        selectedIndexPath = indexPath as NSIndexPath
        if let cell = collectionView.cellForItem(at: indexPath) {
            //print("실행-------------------")
            cell.contentView.layer.borderWidth = 4.0
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderColor = UIColor.blue.cgColor
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
            //print("실행안되는 쪽")
            // cell.contentView.layer.borderWidth = 4.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    
    //콜렉션뷰 안에 들어갈 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        print(chactCollectionView.tag)
        //        print(collectionView.tag)
        if (collectionView.tag == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            for subview in cell.subviews {
                subview.removeFromSuperview()
            }
            

            let imageAnimal: UIImageView = {
                let aImageView = UIImageView()
                
                aImageView.backgroundColor = .white
                //표시될 UIImage 객체 부여
                
                    aImageView.image = UIImage(named: "a\(indexPath.row + 1)")
                if(indexPath.row > 5){
                    if(sexT == "남성"){
                    aImageView.image = UIImage(named: "m\(indexPath.row - 5)")
                    }
                    else{
                    aImageView.image = UIImage(named: "w\(indexPath.row - 5)")
                    }
                }
//                if(sexT == "여성"){
//                    aImageView.image = UIImage(named: "a\(indexPath.row + 1)")
//                    aImageView.image = UIImage(named: "w\(indexPath.row + 1)")
//                }else{
//                    aImageView.image = UIImage(named: "m\(indexPath.row + 1)")
//                }
             
                aImageView.contentMode = .scaleToFill
             
                
                //넘치는 영역 잘라내기
                aImageView.clipsToBounds = true
                
                aImageView.translatesAutoresizingMaskIntoConstraints = false
                return aImageView
            }()
            
                    
            
            cell.addSubview(imageAnimal)
           
            imageAnimal.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
         
            //lbl.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
            
            return cell
        }
        
        // 두번째 컬렉션 뷰
        //        else if(chactCollectionView.tag == 2){
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //
        //            let imageSex: UIImageView = {
        //                let aImageView = UIImageView()
        //                aImageView.backgroundColor = .white
        //                //표시될 UIImage 객체 부여
        //                aImageView.image = UIImage(named: "m\(indexPath.row + 1)")
        //                //둥근 원 모양 추가 하기
        //                aImageView.contentMode = .scaleToFill
        //                //둥근 테두리
        //
        //
        //
        //                //넘치는 영역 잘라내기
        //                aImageView.clipsToBounds = true
        //
        //                aImageView.translatesAutoresizingMaskIntoConstraints = false
        //                return aImageView
        //
        //            }()
        //
        //
        //
        //            cell.addSubview(imageSex)
        //            imageSex.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        //            return cell
        //        }
        return UICollectionViewCell()
        
        
        
    }
    
    
    
    //
    //
    let collectionView: UICollectionView = {
        //        let layout = UICollectionViewFlowLayout()
        //        layout.minimumLineSpacing = 10
        //
        //        layout.scrollDirection = .horizontal
        //        layout.sectionInset = .zero
        //        //아이템 사이즈
        //        layout.itemSize = CGSize(width: 100 , height: 70)
        let layoutz = CHTCollectionViewWaterfallLayout()
        let imgV = UIImageView()
        // Change individual layout attributes for the spacing between cells
        layoutz.minimumColumnSpacing = 1.0
        layoutz.minimumInteritemSpacing = 1.0
        layoutz.columnCount = 6
        
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoutz)
        cv.backgroundColor = .white
        
        return cv
    }()
    
//    let chactCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = .zero
//        //아이템 사이즈
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.collectionView?.backgroundColor = .orange
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .white
//
//        return cv
//    }()
    ////////////////////////////////////////////////////////////     TableView   ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    ////////////////////////////////////////////////////////////     TableView   ///////////////////////////////////////////////////////////////////////////////////////////
    let labelTitle = UILabel()
    var nextButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nextButton)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = 1
        self.view.addSubview(collectionView)
        
        
        
        self.view.addSubview(labelTitle)
        labelTitle.text = "캐릭터를 골라주세요!!!"
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = .boldSystemFont(ofSize: 30)
        labelTitle.textAlignment = .center
        //        chactCollectionView.delegate = self
        //        chactCollectionView.dataSource = self
        //        chactCollectionView.tag = 2
        //        self.view.addSubview(chactCollectionView)
        
        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        print(view.frame.height,"레이아웃 높이 입니다.")
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .orange
        nextButton.layer.cornerRadius = 25
        nextButton.addTarget(self, action: #selector(moveActive)
                             , for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        labelTitle.frame = CGRect(x: 0, y: self.view.frame.height/2 - 200 , width: self.view.frame.width, height: 70)
        collectionView.frame = CGRect(x: 0 , y: labelTitle.frame.maxY + 20 , width: self.view.frame.width, height: 300 )
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        
        
        
    }
    //화면 전환 메서드
    @objc func moveActive(_ sender: Any){
        
        
        print("닉네임 확인 \(nickT),성별확인\(sexT),나이확인\(ageT),연생확인\(yearT),mbti확인\(mbtiT),캐릭 아이디 \(characT)")
        let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "SignProfileViewController") as! SignProfileViewController
        
        movedVC.user_nick = nickT
        movedVC.sexT = sexT
        movedVC.ageT = ageT
        movedVC.yearT = yearT
        movedVC.characT = characT
        self.navigationController?.pushViewController(movedVC, animated: false)
        
    }
}


