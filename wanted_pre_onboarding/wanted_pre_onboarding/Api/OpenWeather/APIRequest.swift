//
//  APIRequest.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation

// MARK: - APIRequest
struct APIReqeust {
    let method: HTTPMethod
    var path: String?
    var queryItems: [String: Any]?
    var header: [HTTPHeader]?
    var body: Data?
    
    init(method: HTTPMethod) {
        self.method = method
    }
    
    init(method: HTTPMethod, path: String, queryItems: [String: Any]) {
        self.method = method
        self.path = path
        self.queryItems = queryItems
    }
    
    init<Body: Encodable>(method: HTTPMethod, path: String, body: Body) throws {
        self.method = method
        self.path = path
        self.body = try? JSONEncoder().encode(body)
    }
}

