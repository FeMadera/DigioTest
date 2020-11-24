//
//  HTTPNetworkResponse.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//
import Foundation

struct HTTPNetworkResponse {
    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<String>{
        guard let res = response else { return Result.failure(HTTPNetworkError.UnwrappingError.rawValue as! Error)}
        switch res.statusCode {
        case 200...299: return Result.success(HTTPNetworkError.success.rawValue)
        case 401: return Result.failure(HTTPNetworkError.authenticationError )
        case 401...499: return Result.failure(HTTPNetworkError.badRequest)
        case 500...599: return Result.failure(HTTPNetworkError.serverSideError)
        default: return Result.failure(HTTPNetworkError.failed)
        }
    }
}
