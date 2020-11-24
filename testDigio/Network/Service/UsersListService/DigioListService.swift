//
//  GitUsersService.swift
//  TestGitHub
//
//  Created by Felipe madeira on 14/11/20.
//

import Foundation

struct DigioListService {
    let postSession = URLSession(configuration: .default)
    
    func makeRequestProduct(_ completion: @escaping (Result<DigioCodable>, _ resultList: DigioCodable?) -> ()) {
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: HTTPNetworkRoute.productsList.rawValue, with: nil, includes: nil , contains: nil, and: .get)
            postSession.dataTask(with: request) { (data, res, err) in
                if let response = res as? HTTPURLResponse, let _ = data {
                    let results = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch results {
                    case .success:
                        guard let data = data else { return  }
                        do {
                            let decoder = JSONDecoder()
                            let jsonData = try decoder.decode(DigioCodable.self, from: data)
                            completion(Result.success(jsonData),jsonData)
                        } catch let err {
                            debugPrint("Err", err)
                        }
                    case .failure:
                        completion(Result.failure(HTTPNetworkError.decodingFailed), nil)
                    }
                } else {
                    completion(Result.failure(HTTPNetworkError.badRequest), nil)
                }
            }.resume()
        } catch {
            completion(Result.failure(HTTPNetworkError.badRequest), nil)
        }
    }
    
    func loadJson(filename fileName: String) -> DigioCodable? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DigioCodable.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
