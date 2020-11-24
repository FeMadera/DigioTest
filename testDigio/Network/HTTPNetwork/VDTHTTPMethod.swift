//
//  HTTPMethod.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import Foundation

public enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

func getUrl() -> String {
    let config = Bundle.main.object(forInfoDictionaryKey: "Stage") as? String
    switch config {
    case "Debug":
        return "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    case "Release":
        return  "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    case .none:
        return "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    case .some(_):
        return "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    }
}
