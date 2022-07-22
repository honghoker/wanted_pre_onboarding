//
//  MainView.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

class MainView: UIView {
    lazy var colorView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        addSubview(colorView)
        
        colorView.backgroundColor = .red
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            colorView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
