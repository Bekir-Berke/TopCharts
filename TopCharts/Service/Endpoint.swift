//
//  Endpoint.swift
//  TopCharts
//
//  Created by Bekir Berke Yılmaz on 8.12.2023.
//

import Foundation
protocol EndpointProtocol{
    var baseUrl: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    
    func request()->URLRequest
}

enum Endpoint{
    case getTopCharts
}
extension Endpoint:EndpointProtocol{
    var baseUrl: String {
        return "https://rss.applemarketingtools.com"
    }
    
    var path: String {
        switch self {
        case .getTopCharts:
            return "/api/v2/us/music/most-played/10/albums.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTopCharts: return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseUrl) else {
            fatalError("URL ERROR")
        }
        components.path = path
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        if let header = header{
            for (key, value) in header {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
}

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
}
