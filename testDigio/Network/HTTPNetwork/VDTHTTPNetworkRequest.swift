//
//  HTTPNetworkRequest.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import Foundation

public typealias HTTPParameters = [String: Any]?

public typealias HTTPHeader = [String: Any]?

struct HTTPNetworkRequest {
    
    
    static func configureHTTPRequest(from route: String, with parameters: HTTPParameters, includes headers: HTTPHeader? = ["":""] , contains body: Data?, and method: HTTPMethod, timeoutInterval: Double = 60.0) throws -> URLRequest {
        
        guard let url = URL(string: "\(getUrl())\(route)") else { throw HTTPNetworkError.missingURL}
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        
        try configureParametersAndHeaders(headers: headers, parameters: parameters, request: &request)
        
        return request
        
    }
    
    static func configureParametersAndHeaders( headers: HTTPHeader?,
                                               parameters: HTTPParameters?,
                                               request: inout URLRequest) throws {
        
        do {
            
            if let headers = headers, let parameters = parameters {
                try URLEncoder.setHeaders(for: &request, with: headers)
                try URLEncoder.encodeParameters(for: &request, with: parameters)
                
            }
        } catch {
            throw HTTPNetworkError.encodingFailed
        }
    }
}
