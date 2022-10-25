//
//  Unity_GameViewController.swift
//  Sulan_App
//
//  Created by 최영완 on 2022/08/18.
//

import UIKit

class Unity_GameViewController: UIViewController {

    @IBOutlet weak var btnGame: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func moveUnit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
