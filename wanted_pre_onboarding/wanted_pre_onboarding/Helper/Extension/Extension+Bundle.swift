//
//  Extension+Bundle.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/24.
//

import Foundation

extension Bundle {
    var OpenWeather_API_KEY: String {
        guard let file = self.path(forResource: "ApiKey", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else {
            return ""
        }
        
        guard let key = resource["OpenWeather"] as? String else {
            fatalError("OpenWeather_ApiKey Error")
        }
        return key
    }
}
