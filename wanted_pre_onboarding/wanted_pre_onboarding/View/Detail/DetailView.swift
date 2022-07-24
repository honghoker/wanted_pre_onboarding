//
//  DetailView.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

class DetailView: UIView {
    var weatherItem: GroupWeatherItem?
    
    init(frame: CGRect, weatherItem: GroupWeatherItem) {
        super.init(frame: frame)
        self.weatherItem = weatherItem
        self.backgroundColor = .white
        initView()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        addSubview(cityNameKR)
        addSubview(cityNameEN)
        addSubview(iconImage)
        addSubview(weatherDescription)
        addSubview(temp)
        
        addSubview(feelsLikeTempStackView)
        feelsLikeTempStackView.addArrangedSubview(feelsLikeText)
        feelsLikeTempStackView.addArrangedSubview(feelsLikeValue)
        
        addSubview(tempStackView)
        tempStackView.addArrangedSubview(tempMinText)
        tempStackView.addArrangedSubview(tempMinValue)
        tempStackView.addArrangedSubview(stackViewSlash)
        tempStackView.addArrangedSubview(tempMaxText)
        tempStackView.addArrangedSubview(tempMaxValue)
        
        addSubview(otherStackView)
        humidityStackView.addArrangedSubview(humidityValue)
        humidityStackView.addArrangedSubview(humidityText)
        otherStackView.addArrangedSubview(humidityStackView)
        windSpeedStackView.addArrangedSubview(windSpeedValue)
        windSpeedStackView.addArrangedSubview(windSpeedText)
        otherStackView.addArrangedSubview(windSpeedStackView)
        pressureStackView.addArrangedSubview(pressureValue)
        pressureStackView.addArrangedSubview(pressureText)
        otherStackView.addArrangedSubview(pressureStackView)
        
        NSLayoutConstraint.activate([
            cityNameKR.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 48),
            cityNameKR.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityNameEN.topAnchor.constraint(equalTo: self.cityNameKR.bottomAnchor, constant: 6),
            cityNameEN.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            iconImage.topAnchor.constraint(equalTo: self.cityNameEN.bottomAnchor, constant: 0),
            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            weatherDescription.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 0),
            weatherDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            temp.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            temp.topAnchor.constraint(equalTo: self.weatherDescription.bottomAnchor, constant: 6),
            
            feelsLikeTempStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            feelsLikeTempStackView.topAnchor.constraint(equalTo: self.temp.bottomAnchor, constant: 2),
            
            tempStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempStackView.topAnchor.constraint(equalTo: self.feelsLikeTempStackView.bottomAnchor, constant: 12),
            
            otherStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            otherStackView.topAnchor.constraint(equalTo: self.tempStackView.bottomAnchor, constant: 48)
        ])
    }
    
    func setData() {
        if let mainValue = weatherItem?.weather[0].main {
            let imageView = UIImageView(frame: self.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.center = self.center
            imageView.image = UIImage(named: mainValue == "Clear" ? "sunny.jpg" : "cloud.jpg")
            addSubview(imageView)
            sendSubviewToBack(imageView)
        }
        if let idValue = weatherItem?.id {
            cityNameKR.text = String(describing: myCitiesMap["\(idValue)"]!)
        }
        if let nameENValue = weatherItem?.name {
            cityNameEN.text = String(describing: nameENValue)
        }
        if let feelsLike = weatherItem?.main.feelsLike {
            feelsLikeValue.text = "\(String(describing: feelsLike))°)"
        }
        if let iconValue = weatherItem?.weather[0].icon {
            let imageUrl = "http://openweathermap.org/img/wn/\(iconValue)@4x.png" // 4배 크기
            iconImage.setImageUrl(imageUrl)
        }
        if let tempValue = weatherItem?.main.temp {
            temp.text = "\(String(describing: tempValue))°"
        }
        if let tempMin = weatherItem?.main.tempMin {
            tempMinValue.text = "\(String(describing: tempMin))°"
        }
        if let tempMax = weatherItem?.main.tempMax {
            tempMaxValue.text = "\(String(describing: tempMax))°"
        }
        if let humidity = weatherItem?.main.humidity {
            humidityValue.text = "\(String(describing: humidity))%"
        }
        if let windSpeed = weatherItem?.wind.speed {
            windSpeedValue.text = "\(String(describing: windSpeed))m/s"
        }
        if let pressure = weatherItem?.main.pressure {
            pressureValue.text = "\(String(describing: pressure))hPa"
        }
        if let description = weatherItem?.weather[0].weatherDescription {
            weatherDescription.text = "\(String(describing: description))"
        }
    }
    
    // 도시이름(KR)
    lazy var cityNameKR: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 도시이름(EN)
    lazy var cityNameEN: UILabel = {
        var label = UILabel()
        label.font = .italicSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 날씨 아이콘
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // 현재기온
    lazy var temp: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 48)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 체감기온 Text
    lazy var feelsLikeText: UILabel = {
        var label = UILabel()
        label.text = "(체감"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 체감기온 Value
    lazy var feelsLikeValue: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 체감 기온 stackView
    lazy var feelsLikeTempStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    // 최저기온 Text
    lazy var tempMinText: UILabel = {
        var label = UILabel()
        label.text = "최저"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최저기온 Value
    lazy var tempMinValue: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .blue.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최고기온 Text
    lazy var tempMaxText: UILabel = {
        var label = UILabel()
        label.text = "최고"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최고기온 Value
    lazy var tempMaxValue: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .red.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 최저 최고 기온 stackView
    lazy var tempStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    // 최저 최고 기온 구분 label
    lazy var stackViewSlash: UILabel = {
        var label = UILabel()
        label.text = "/"
        label.textColor = .white
        return label
    }()
    // 습도 Text
    lazy var humidityText: UILabel = {
        var label = UILabel()
        label.text = "습도"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 습도 Value
    lazy var humidityValue: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 습도 StackView
    lazy var humidityStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black.withAlphaComponent(0.6)
        stackView.layer.cornerRadius = 4
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    // 기압 Text
    lazy var pressureText: UILabel = {
        var label = UILabel()
        label.text = "기압"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 기압 Value
    lazy var pressureValue: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 기압 StackView
    lazy var pressureStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black.withAlphaComponent(0.6)
        stackView.layer.cornerRadius = 4
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    // 풍속 Text
    lazy var windSpeedText: UILabel = {
        var label = UILabel()
        label.text = "풍속"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 풍속 value
    lazy var windSpeedValue: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 풍속 StackView
    lazy var windSpeedStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black.withAlphaComponent(0.6)
        stackView.layer.cornerRadius = 4
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    // 날씨설명
    lazy var weatherDescription: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 습도, 풍속, 기압 stackView
    lazy var otherStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
}
