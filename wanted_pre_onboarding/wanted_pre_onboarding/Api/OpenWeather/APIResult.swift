//
//  APIResponse.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation

// MARK: - APIResult
enum APIResult<Body> {
    case success(APIResponse<Body>)
    case failure(APIError)
}

// MARK: - APIResponse
struct APIResponse<Body> {
    let statusCode: Int
    let body: Body
}

// MARK: - APIResponse Extension
extension APIResponse where Body == Data? {
    func decode<T: Decodable>(to type: T.Type) throws -> APIResponse<T> {
        guard let data = body else {
            throw APIError.dataFailed
        }
        
        guard let decodedJSON = try? JSONDecoder().decode(T.self, from: data) else {
            throw APIError.decodingFailed
        }
        
        return APIResponse<T>(statusCode: self.statusCode, body: decodedJSON)
    }
}

// MARK: - APIError
enum APIError: LocalizedError {
    case invalidURL
    case requestFailed
    case networkFailed
    case decodingFailed
    case dataFailed
    
    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .requestFailed:
            return "요청 실패입니다."
        case .networkFailed:
            return "통신에 실패했습니다."
        case .decodingFailed:
            return "디코딩에 실패했습니다."
        case .dataFailed:
            return "잘못된 데이터입니다."
        }
    }
}
