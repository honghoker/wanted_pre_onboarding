//
//  APICenter.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation

// MARK: - API KEY
let weatherAPIKey = "\(Bundle.main.OpenWeather_API_KEY)"

// MARK: - 요청할 도시 Map
let myCitiesMap: [String: String] = [
     "1842616": "공주",
     "1841811": "광주(전라남도)",
     "1842225": "구미",
     "1842025": "군산",
     "1835327": "대구",
     "1835224": "대전",
     "1841066": "목포",
     "1838524": "부산",
     "1835895": "서산",
     "1835848": "서울",
     "1836553": "속초",
     "1835553": "수원",
     "1835648": "순천",
     "1833747": "울산",
     "1843491": "익산",
     "1845457": "전주",
     "1846266": "제주시",
     "1845759": "천안",
     "1845604": "청주",
     "1845136": "춘천"
]

// MARK: - HTTPMethod
// GET, PUT, POST, DELETE
enum HTTPMethod: String {
    case get = "GET"
    case set = "SET"
    case post = "POST"
    case delete = "DELETE"
}

// MARK: - HTTPHeader
// field, value
struct HTTPHeader {
    let field: String
    let value: String
}

// MARK: - APICenter
struct APICenter {
    typealias APIClientCompletion = (APIResult<Data?>) -> Void
    
    private let session = URLSession.shared
    
    func request(urlString: String, request: APIReqeust, completion: @escaping APIClientCompletion) {
        guard let baseURL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var makeURLComponent = URLComponents()
        makeURLComponent.scheme = baseURL.scheme
        makeURLComponent.host = baseURL.host
        
        if let path = request.path {
            makeURLComponent.path = path
        }
        
        let queryItems = request.queryItems?.map({
            URLQueryItem(name: $0.key, value: "\($0.value)")
        })
        makeURLComponent.queryItems = queryItems
        
        guard let requestURL = makeURLComponent.url else {
            completion(.failure(.invalidURL))
            return
        }
        let task = session.dataTask(with: requestURL) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            completion(.success(APIResponse<Data?>(statusCode: httpResponse.statusCode, body: data)))
            
        }
        task.resume()
    }
}
