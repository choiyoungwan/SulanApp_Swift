////
////  SwiftUIView.swift
////  Sulan_App
////
////  Created by 최영완 on 2022/08/25.
////
//
//import SwiftUI
////struct ViewControllerRepresentation: UIViewControllerRepresentable {
////    func makeUIViewController(context: Context) -> ViewController {
////        UIStoryboard(name: "Main", bundle: nil)
////      .instantiateViewController(withIdentifier: "ViewController")
////      as! ViewController
////    }
////    
////    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
////        
////    }
////}
//struct SwiftUIView: View {
//    @State var color: Color = .black
////    @State var showController = false
//
//    var body: some View {
//  
////        NavigationLink(destination: SwiftExam()) {
////                 Text("Move to UIViewController")
////           }
//        ZStack {
//            ColorPicker("Choose foreground color", selection: $color).onAppear {
//                        // in half a second...
////                Button("Show Controller"){
////                    showController = true
////                }
//                           UnityManager.shared.launchUnity()
//
//
//            }
////
//        }
////        .sheet(isPresented: $showController){
////            SwiftExam()
////        }
////                       let api = UnityBridge.getInstance()
////                       api.show()
////                       print("여기서 유니티가 보여진다.")
////                       DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
////
////
////                       if let window = api.view?.window {
////                           print("윈도우 레벨 설정")
////                           // Set Unity drawing order to a lower number.
////                           window.windowLevel = .normal - 10000.0
////                           // Updates the background of the UIHostingView.
////
////
////
////                               print("v we there yet4444?")
////                           let windowUI = UIApplication.shared.windows[1]
////                           if let controller = windowUI.rootViewController {
////                               ColorPicker("Choose foreground color", selection: $color, supportsOpacity: false)
//////                                       .pickerStyle(.inline)
//////                                       .font(.title)
//////                                       .padding(.horizontal)
////
////                               controller.view.isOpaque = false
////                               controller.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
////                           }
////                       }
////                       }
////                   }
////               } .frame(maxWidth: .infinity, maxHeight: .infinity)
////            .background(color)
//          
//
//
//}
//}
////윈도우 레벨 확인
////print(self.window?.windowLevel)
//
////struct SwiftUIView_Previews: PreviewProvider {
////    static var previews: some View {
////        SwiftUIView()
////    }
////}
