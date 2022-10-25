////
////  Unity_Swft.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/09/02.
////
//
//import SwiftUI
//
//struct Unity_Swift: View {
//    @State private var showScreen2: Bool = false
//    @State private var showModal = false //상태
//    @State var color: Color = .black
//    @State private var isStr: Bool = false
//    @State private var text: String = UnityManager.shared.messageT
//    @ObservedObject var unity = UnityManager.shared
////    @State var firstNaviLinkActive = false
//    var body: some View {
//        
//       
//        VStack {
////            ColorPicker("Choose", selection: $color).onAppear {
////            UnityManager.shared.launchUnity()
//              
////            NavigationLink(destination: SecondPage(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive) {
////                               Text("Click Here")
////                                   .foregroundColor(Color.white)
////                                   .frame(width: 100, height: 60, alignment: .center)
////                                   .background(RoundedRectangle(cornerRadius: 10)
////                                       .fill(Color.red))
////                           }
////                           .navigationBarHidden(true)
////
//
//      
//            
//            Text(self.unity.messageT).onChange(of: self.unity.messageT) { str in
//               print("BBBB")
//                self.showModal = true
//                self.text = "aaa"
//                self.unity.messageT = ""
//                sheet(isPresented: self.$showModal) {
//                    ModalView()
//        
//                }
//            
//                
//            }
//            
//           Button(action: {
//            print("hello button!!")
//           self.showModal = true
//           }){
//               Text("_")
//           }
//           .sheet(isPresented: self.$showModal) {
//               ModalView()
//           }
//       
//            
//            
//          
////            Button(action: {
////
////                //UnityManager.shared.sendMessage(toMobileApp: "ss")
////                print("클릭이 되나?\(UnityManager.shared.messageT)")
////                //self.isStr = true
////                text = "bbbbb"
////            }) {
////                Text("Launch UIkit")
////            }
//            
//                Button(action: {
//                    UnityManager.shared.launchUnity()
//                    let message = UnityMessage(gameObjectName: "EventSystem",
//                                               functionName: "SetText",
//                                               message: "닉네임!")
//                    UnityManager.shared.sendMessageToUnity(message)
//                }) {
//                    Text("1")
//                }
////
//        }
//        }
////        .background(Color.red)
//        
////        }
//        
//    }
////struct ChildView :View{
////
////    
////    //Binding Annoation을 붙이면 Binding<Bool>을 인자로받아 초기화 시킬 수 있습니다.
////    @Binding var isStr:Bool
////
////    var body: some View{
////
////        //$가 붙으면 값을 수정가능한 Binding타입 참조합니다.
////        Toggle(isOn: $isStr) {
////            //Text("글자를 가립니다")
////        }.padding()
////    }
////}
//
