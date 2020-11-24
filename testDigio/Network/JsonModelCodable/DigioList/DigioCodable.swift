//
//  DigioCodable.swift
//  TestGitHub
//
//  Created by Felipe madeira on 14/11/20.
//

import Foundation

struct DigioCodable: Codable {

    struct Cash: Codable {

        let description: String?
        let title: String?
        let bannerURL: String?
    
    }

    let cash: Cash?

    struct spotlight: Codable {

        let description: String?
        let name: String?
        let bannerURL: String?
    
    }

    let spotlight: [spotlight]?

    struct Product: Codable {

        let description: String?
        let name: String?
        let imageURL: String?
    
    }

    let products: [Product]?

}


