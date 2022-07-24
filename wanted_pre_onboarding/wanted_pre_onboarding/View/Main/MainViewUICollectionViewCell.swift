//
//  MainViewUICollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

class MainViewUICollectionViewCell: UICollectionViewCell {
    var weatherItem: GroupWeatherItem? {
        didSet { setData() }
    }
        
    private func setData() {
        if let idValue = weatherItem?.id {
            cityNameKR.text = String(describing: myCitiesMap["\(idValue)"]!)
        }
        
        if let nameENValue = weatherItem?.name {
            cityNameEN.text = String(describing: nameENValue)
        }
        
        if let mainValue = weatherItem?.weather[0].main {
            let imageView = UIImageView(frame: self.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.center = self.center
            imageView.image = UIImage(named: mainValue == "Clear" ? "sunny.jpg" : "cloud.jpg")
            self.backgroundView = imageView
        }
        if let iconValue = weatherItem?.weather[0].icon {
            let imageUrl = "http://openweathermap.org/img/wn/\(iconValue).png"
            iconImage.setImageUrl(imageUrl)
        }
        if let temp = weatherItem?.main.temp {
            tempValue.text = "\(String(describing: temp))°"
        }
        if let humidity = weatherItem?.main.humidity {
            humidityValue.text = "\(String(describing: humidity))%"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(cityNameKR)
        addSubview(cityNameEN)
        addSubview(tempText)
        addSubview(tempValue)
        addSubview(humidityText)
        addSubview(humidityValue)
        addSubview(iconImage)
        
        NSLayoutConstraint.activate([
            cityNameKR.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            cityNameKR.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -4),

            cityNameEN.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2),
            cityNameEN.leftAnchor.constraint(equalTo: cityNameKR.leftAnchor),

            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            tempText.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -4),
            tempText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0 - (self.bounds.width / 5.2)),
            tempValue.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -4),
            tempValue.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            
            humidityText.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 4),
            humidityText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0 - (self.bounds.width / 5.2)),
            humidityValue.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 4),
            humidityValue.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 도시이름 한글
    lazy var cityNameKR: UILabel = {
        var label = UILabel()
        label.text = "도시(KR)"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 도시이름 영어
    lazy var cityNameEN: UILabel = {
        var label = UILabel()
        label.text = "도시(EN)"
        label.font = .italicSystemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 아이콘
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    // 현재기온 Text
    lazy var tempText: UILabel = {
        var label = UILabel()
        label.text = "기온"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 현재기온 Value
    lazy var tempValue: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 현재습도 Text
    lazy var humidityText: UILabel = {
        var label = UILabel()
        label.text = "습도"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 현재습도 Value
    lazy var humidityValue: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}
