//
//  ExamImgViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/10.
//

import UIKit
import PhotosUI
import AVFoundation
import Alamofire
import SwiftyJSON


class ExamImgViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
   
    let AD = UIApplication.shared.delegate as? AppDelegate
    
    let aImageView = UIImageView()
   

    let fileManager = FileManager()
    
    //이거는 지워도 됌
    let picker = UIImagePickerController()
    
    let serverButton = UIButton()
    
    struct Login: Encodable {
        let test: String
        let password: String
    }
    var test11: String?
    let header : HTTPHeaders = [
                "Content-Type" : "*/*"
                , "Accept":"*/*"
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(aImageView)
        self.view.addSubview(serverButton)
        
        picker.delegate = self
        
        //이미지 정의
        aImageView.backgroundColor = .red
        //표시될 UIImage 객체 부여
        aImageView.image = UIImage(named: "default")
        //둥근 원 모양 추가 하기
        aImageView.contentMode = .scaleToFill
        //둥근 테두리
        aImageView.layer.cornerRadius = 100
        //넘치는 영역 잘라내기
        aImageView.clipsToBounds = true
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        aImageView.isUserInteractionEnabled = true
        let event =  UITapGestureRecognizer(target: self, action: #selector(self.imgClick))
        aImageView.addGestureRecognizer(event)
        
        //권한 설정
        checkCameraPermission()
        
        
        serverButton.setTitle("사진 저장하기", for: .normal)
        serverButton.setTitleColor(.black, for: .normal)
        serverButton.backgroundColor = .orange
        serverButton.layer.cornerRadius = 25
        serverButton.addTarget(self, action: #selector(server_btn), for: .touchUpInside)
       
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        aImageView.frame = CGRect(x: 70, y: 300  ,width: 200, height: 200)
        serverButton.frame = CGRect(x: view.width/2 , y: view.height/2 + 200
                                    ,width: 150, height: 100)
    }
    
    
    @objc func imgClick(sender: UITapGestureRecognizer)
    {
        
     //카메라 사진 기능 구별하는 알러트로 바꾸기
        let alert = UIAlertController(title: "프로필 사진을 선택 하시겠습니까?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default,
                                      handler: { action in self.imgPhoto()
    }))
        alert.addAction(UIAlertAction(title: "취소", style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
        
    }
    
    func imgPhoto(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self //3
        imagePicker.allowsEditing = true
        present(imagePicker, animated: false)
    }
    
    @objc func server_btn22(_ sender: Any)
    {
        
        
        let param: [String: [String]] = [
            "user_nickname": ["루루"],
            "password": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]
        AF.request("http://49.247.196.22/my_php/testing.php"
                   , method: .post,parameters: param).response {
            response in
            debugPrint("Response: \(response)")

        }
//        let name = "abcabac"
//
//        let url = "https://www.sulan.site/app/v1/user/nicknamecheck?user_nickname=\(name)"
//        AF.request(url
//                   ,  method: .get, headers: header)
//        .response{
//            response in
//            debugPrint("Response: \(response)")
//            print(response)
//            switch response.result {
//
//            case .success(let value):
//
//                print(value as Any)
//
//                let jsonValue = JSON(value as Any)
//                print("통신 성공")
//            print(jsonValue)
//
//            case .failure(let error):
//
//            print(error)
//
//            }
//        }
    
    }
    

   


    
    
    
    @objc func server_btn(sender: UITapGestureRecognizer)
    {
//
//
//
//
        let image2 = UIImage(named: "default")
        let imageData = image2!.jpegData(compressionQuality: 0.5)
//        let imageData = aImageView.image?.pngData()
        
//
       AF.upload(
    multipartFormData: { multipartFormData in
    multipartFormData.append(imageData!, withName: "uploaded_file" , fileName: "imgs.jpg", mimeType: "image/jpeg")
    },
    to: "http://49.247.196.22/my_php/testing.php", method: .post , headers: header)
    .response { resp in
    debugPrint(resp)
    }
        
        
        
    }
    
    

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        //이미지 가져와서 붙이기
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            aImageView.image = image
            print("이미지 선택")

            
            
            }
        //이미지 선택 취소
            dismiss(animated: true, completion: nil)
            print("이미지 선택 취소 됌")
        }
    
    
    func checkCameraPermission(){
        ///
        //권한 체크
        PHPhotoLibrary.requestAuthorization { status in
            switch status{
                            case .authorized:
                                print("Album: 권한 허용")
                            case .denied:
                                print("Album: 권한 거부")
                            case .restricted, .notDetermined:
                               print("Album: 선택하지 않음")
                           default:
                               break
                           }
            }
        
        
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                       if granted {
                           print("Camera: 권한 허용")
                       } else {
                           print("Camera: 권한 거부")
                       }
                   })
    ///
    }
    
    
    
}
