//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView() {
        let mainView = MainView(frame: self.view.frame)
        self.view.addSubview(mainView)
    }
}

