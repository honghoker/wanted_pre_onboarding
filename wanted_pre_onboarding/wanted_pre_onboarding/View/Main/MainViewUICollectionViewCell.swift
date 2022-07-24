//
//  MainViewUICollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

class MainViewUICollectionViewCell: UICollectionViewCell {
    var weatherItem: GroupWeatherItem?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cityName)
        addSubview(main)
        addSubview(temp)
        
        NSLayoutConstraint.activate([
            cityName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            cityName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            
            main.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 12),
            main.leftAnchor.constraint(equalTo: cityName.leftAnchor),
            
            temp.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            temp.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 도시이름
    lazy var cityName: UILabel = {
        var label = UILabel()
        label.text = "도시"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 날씨
    lazy var main: UILabel = {
        var label = UILabel()
        label.text = "날씨"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 아이콘
    lazy var icon: UIImageView = {
        let img = UIImageView()
        return img
    }()
    // 현재기온
    lazy var temp: UILabel = {
        var label = UILabel()
        label.text = "현재기온"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 체감기온
    lazy var feelsLike: UILabel = {
        var label = UILabel()
        label.text = "체감기온"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 현재습도
    lazy var humidity: UILabel = {
        var label = UILabel()
        label.text = "현재습도"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최저기온
    lazy var tempMin: UILabel = {
        var label = UILabel()
        label.text = "최저기온"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최고기온
    lazy var tempMax: UILabel = {
        var label = UILabel()
        label.text = "최고기온"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 기압
    lazy var pressure: UILabel = {
        var label = UILabel()
        label.text = "기압"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 풍속
    lazy var windSpeed: UILabel = {
        var label = UILabel()
        label.text = "풍속"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 날씨설명
    lazy var weatherDescription: UILabel = {
        var label = UILabel()
        label.text = "날씨설명"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
