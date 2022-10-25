//
//  SignProfileViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/01.
//

import UIKit
import PhotosUI
import AVFoundation
import Alamofire
import FMPhotoPicker
import Mantis
protocol SendDataDelegate: AnyObject {
    func receiveData(data: String)
}
class SignProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    weak var delegate: SendDataDelegate?
    let imageView: UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .red
        //표시될 UIImage 객체 부여
        aImageView.image = UIImage(named: "woman")
        //둥근 원 모양 추가 하기
        aImageView.contentMode = .scaleToFill
        //둥근 테두리
        aImageView.layer.cornerRadius = 100
        
        
        //넘치는 영역 잘라내기
        aImageView.clipsToBounds = true
        
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    let header : HTTPHeaders = [
        "Content-Type" : "*/*"
        , "Accept":"*/*"
    ]
    
    
    let fileManager = FileManager()
    let imagePickerController = UIImagePickerController()
    var nextButton = UIButton()
    var camerButton = UIButton()
    var photoButton = UIButton()
    var deleteButton = UIButton()
    var test: String?
    var title_Lable  = UILabel()
    var explain_Lable  = UILabel()
    var config = FMPhotoPickerConfig()
    
    let AD = UIApplication.shared.delegate as? AppDelegate
    var uniqueFileName: String?
    
    //인텐트로 받는값
    var user_nick: String?
    var ageT: String?
    var yearT: String?
    var nickT: String?
    var sexT: String?
    var characT: String?
    var mbtiT: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageView)
        //        self.view.addSubview(camera)
        self.view.addSubview(nextButton)
        self.view.addSubview(camerButton)
        self.view.addSubview(photoButton)
        self.view.addSubview(deleteButton)
        self.view.addSubview(title_Lable)
        self.view.addSubview(explain_Lable)
        
        print("===넘어오는 값 확인=== /n 닉네임 확인 \(nickT),성별확인\(sexT),나이확인\(ageT),연생확인\(yearT),mbti확인\(mbtiT),캐릭 아이디 \(characT)")
        
        //user_nick = "wans"
        
      
        title_Lable.text = "대표사진"
        title_Lable.translatesAutoresizingMaskIntoConstraints = false
        title_Lable.textAlignment = .center
        title_Lable.font = .boldSystemFont(ofSize: 40)
        
        explain_Lable.text = "정면이 나온 사진을 올려주세요 !"
        explain_Lable.font = .boldSystemFont(ofSize: 25)
        explain_Lable.textAlignment = .center
        
        
      
        
        nextButton.frame = CGRect(x: 10, y: self.view.frame.height - 150, width: self.view.frame.width - 20, height: 50)
        print(view.frame.height,"레이아웃 높이 입니다.")
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        
        nextButton.backgroundColor = .orange
        nextButton.layer.cornerRadius = 25
        nextButton.addTarget(self, action: #selector(save_btn)
                             , for: .touchUpInside)
        
        
        camerButton.setTitle("카메라", for: .normal)
        camerButton.setTitleColor(.black, for: .normal)
        camerButton.backgroundColor = .orange
        camerButton.layer.cornerRadius = 25
        camerButton.addTarget(self, action: #selector(camera_btn), for: .touchUpInside)
        
        photoButton.setTitle("사진", for: .normal)
        photoButton.setTitleColor(.black, for: .normal)
        photoButton.backgroundColor = .orange
        photoButton.layer.cornerRadius = 25
        photoButton.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
        
        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.backgroundColor = .blue
        deleteButton.layer.cornerRadius = 25
        deleteButton.addTarget(self, action: #selector(delete_btn), for: .touchUpInside)
        
        
        imageView.isUserInteractionEnabled = true
        let event =  UITapGestureRecognizer(target: self, action: #selector(self.imgClick))
        imageView.addGestureRecognizer(event)
        imageView.center = view.center
        
        
        //        uniqueFileName
        //                   = user_nick!+"_profile.jpg"
        
        //        if let image: UIImage
        //          = ImageFileManager.shared.getSavedImage(named: "(ProcessInfo.processInfo.globallyUniqueString).jpeg") {
        //          imageView.image = image
        //        }
        
        //checkAlbumPermission()
        //
        //
        
    }
    
    
    //화면 보여주는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        title_Lable.frame = CGRect(x: 0,y: 100
                                   ,width: self.view.frame.size.width , height: 70)
        imageView.frame = CGRect(x: (self.view.frame.size.width - 200) / 2,y:  title_Lable.frame.maxY + 30
                                 ,width: 200, height: 200)
        explain_Lable.frame = CGRect(x: 10,y:  imageView.frame.maxY + 30
                                     ,width: self.view.frame.size.width, height: 50)
        
        
        //        let url = URL(string:"http://49.247.196.22/img/"+uniqueFileName!)
        //        var image : UIImage?
        //        /* 이미지 뷰 위치 잡기 */
        ////         UniqueName.jpeg
        //        DispatchQueue.global().async {
        //                   let data = try? Data(contentsOf: url!)
        //            DispatchQueue.main.async { [self] in
        //               image = UIImage(data: data!)
        //                       imageView.image = image
        //                   }
        //               }
        
    }
    
    @objc func imgClick(){
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self //3
        //imagePicker.allowsEditing = true
        //present(imagePicker, animated: true)
        self.present(imagePicker, animated: true, completion: nil)
        
        //        var configuration = PHPickerConfiguration()
        //        configuration.selectionLimit = 1
        //
        //        configuration.filter = .images
        //        let picker = PHPickerViewController(configuration: configuration)
    }
    
    
    
    ///서버 통신 &&& 회원가입 마무리
    @objc func save_btn(_ sender: Any){
        
        
        if(uniqueFileName != nil){
            //print("이미지 데이터\(uniqueFileName!)")
            
            let image: UIImage
            = ImageFileManager.shared.getSavedImage(named: uniqueFileName!)!
            //          imageView.image = image
//
//
//            //        let image2 = UIImage(named: "(ProcessInfo.processInfo.globallyUniqueString).jpeg")
            let imageData = image.jpegData(compressionQuality: 0.5)
//            //        let imageData = aImageView.image?.pngData()

            //SuLan url 로 수정해야됌
            let url = "http://49.247.196.22/my_php/testing.php"
            
            AF.upload(
                multipartFormData: { [self] multipartFormData in
                    multipartFormData.append(imageData!, withName: "uploaded_file" , fileName: uniqueFileName, mimeType: "image/jpeg")
                },
                to: url, method: .post , headers: header)
            .response { resp in
                debugPrint(resp)
            }
            
            
            let movedVC = AD?.StoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //로그인 화면으로 가면서 회원가입이 되었다고 값을 보내면 로그인 화면에서 바로 유니티로 이동
            movedVC.signT = "값 확인입니다만"
            movedVC.nickT = user_nick
            //회원가입 완료와 함께 로그인 페이지로 이동
            self.navigationController?.pushViewController(movedVC, animated: false)
        }else{
            let alert = UIAlertController(title: "프로필 이미지를 선택해 주세요!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    
    //카메라 처리
    @objc func camera_btn(_ sender: Any){
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .front
        camera.cameraCaptureMode = .photo
        camera.delegate = self
        present(camera, animated: true, completion: nil)
        
    }
    
    //사진 불러오기 처리
    @objc func uploadPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self //3
        //imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    //저장된 이미지 삭제 처리
    @objc func delete_btn(_ sender: Any){
        ImageFileManager.shared.deleteImage(named: "(ProcessInfo.processInfo.globallyUniqueString).jpeg") { [self] onSuccess in
            print("delete = \(onSuccess)")
            imageView.image = UIImage(named: "default")
        }
        
    }
    
    
    
    //    /** 사진 가져오기 부분 */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            //            imageView.image = image // <- 삭제하고 cropViewControllerDidCrop에서 실행
            self.openCropVC(image: image)
            
            
            dismiss(animated: true) { [self] in
                self.openCropVC(image: image)
                
            }
            
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    
 
    
    //
    //    /* 퍼미션 제안 부분 */
    //    func checkCameraPermission(){
    //           AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
    //               if granted {
    //                   print("Camera: 권한 허용")
    //               } else {
    //                   print("Camera: 권한 거부")
    //               }
    //           })
    //        }
    //
    
    /* 사진 캔슬 메서드 */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //사진 권한
    func checkAlbumPermission(){
        PHPhotoLibrary.requestAuthorization( { status in
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
        })
    }
    
}



extension SignProfileViewController: CropViewControllerDelegate {
    
    func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation, cropInfo: CropInfo) {
        
        // 이미지 크롭 후 할 작업 추가
        //        let url = URL(string:"/Users/choeyeong-wan/Library/Developer/CoreSimulator/Devices/1F67E3F2-6553-4A7D-8624-3430D70A4B07/data/Containers/Data/Application/5EEC6AD6-E23B-42EB-9EA9-0AFDC45E36D4/Documents/(ProcessInfo.processInfo.globallyUniqueString).jpeg")
        //        var image : UIImage?
        imageView.image = cropped
        uniqueFileName
        = user_nick!+"_profile.jpg"
        ImageFileManager.shared
            .saveImage(image: cropped,
                       name: uniqueFileName!) { [weak self] onSuccess in
                print("saveImage onSuccess: \(onSuccess)")
                
            }
        cropViewController.dismiss(animated: true, completion: nil)
        
        
    
        
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        
        cropViewController.dismiss(animated: true, completion: nil)
    }
    
    private func openCropVC(image: UIImage) {
        
        //크롭 이미지 처리
        let cropViewController = Mantis.cropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.config.presetFixedRatioType = .alwaysUsingOnePresetFixedRatio(ratio: 1.0)
        cropViewController.modalPresentationStyle = .fullScreen
        self.present(cropViewController, animated: true)
        
        //
        
        
        
    }
    public enum CropShapeType {
        case rect
        case square
        case ellipse
        case circle(maskOnly: Bool = false)
        case diamond(maskOnly: Bool = false)
        case heart(maskOnly: Bool = false)
        case polygon(sides: Int, offset: CGFloat = 0, maskOnly: Bool = false)
        case path(points: [CGPoint], maskOnly: Bool = false)
    }
}
