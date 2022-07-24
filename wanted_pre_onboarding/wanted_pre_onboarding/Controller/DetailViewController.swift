//
//  DetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var weatherItem: GroupWeatherItem!
    
    override func viewDidLoad() {
        let detailView = DetailView(frame: self.view.frame, weatherItem: weatherItem)
        self.view.addSubview(detailView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .white
    }
}
