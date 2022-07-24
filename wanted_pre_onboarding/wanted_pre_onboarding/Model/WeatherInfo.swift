//
//  Weather.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation

// MARK: - GroupWeatherInfo
// 그룹 요청 시
struct GroupWeatherInfo: Codable {
    let cnt: Int
    let GroupWeatherItem: [GroupWeatherItem]
    
    enum CodingKeys: String, CodingKey {
        case cnt
        case GroupWeatherItem = "list"
    }
}

// MARK: - SingleWeatherInfo
// 단일 요청 시
struct SingleWeatherInfo: Codable {
    let coord: [String: Double]
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: [String: Int]
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

// MARK: - List
struct GroupWeatherItem: Codable {
    let coord: Coord
    let sys: Sys
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure: Int
    let seaLevel, grndLevel: Int?
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp // 현재기온
        case feelsLike = "feels_like" // 체감기온
        case tempMin = "temp_min" // 최저기온
        case tempMax = "temp_max" // 최고기온
        case pressure // 기압
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity // 습도
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
    let timezone, sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description" // 날씨설명
        case icon // 아이콘
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double // 풍속
    let deg: Int
}
