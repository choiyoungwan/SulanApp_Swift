//
//  SwiftExam.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/29.
//

import UIKit
import SwiftUI
struct SwiftExam: UIViewControllerRepresentable {
    
    
    func makeUIViewController(context: Context) -> ViewController {
        UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "ViewController")
      as! ViewController
    }
    
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}
