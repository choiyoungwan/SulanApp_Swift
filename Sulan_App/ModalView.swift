//
//  ModalView.swift
//  Swift_Ex
//
//  Created by 최영완 on 2022/09/01.
//

import SwiftUI

struct ModalView: View {
    @State private var firstName = "고은"
    @State private var lastName = "20대 여성"
    @State private var company = "ENFP"

    
  var body: some View {
      NavigationView {
    VStack {
        ProfileImage(imageName: "woman")
            .padding()
//            .offset(y: -100)
//            .padding(.bottom, -130)
//                       Form {
//                           Section(header: Text("프로필")) {
//                           }}
        Text("그웬, 20대 중반").font(.title).bold()
        Divider()
        List {
//        VStack(alignment:.trailing){
            Text("사는곳").bold()
//            Divider()
            Text("서울 사당동")
//            Divider()
            Text("MBTI").bold()
//            Divider()
            Text("ENFP")
            Text("이상형").bold()
//            Divider()
            Text("귀엽운")
            Text("내 관심사").bold()
//            Divider()
            Text("코딩")
            Text("나의 성격").bold()
//            Divider()
            Text("활기찬")
//                }
        }
       
//                               TextField("닉네임 :", text: $firstName)
//                               TextField("나이 :", text: $lastName)
//                               TextField("MBTI : ", text: $company)
//                           }
        
        
//      Text("Modal view")
      Button(action: {
        
      }) {
        Text("닫기")
      }
//    }
  }.navigationTitle("Profile")
  }
}
    struct ProfileImage: View {
        var imageName: String
        
        var body: some View {
            Image(imageName)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        }
    }
}
