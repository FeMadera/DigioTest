//
//  DigioProductTableViewCellPresenter.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import Foundation

protocol DigioProductTableViewCellDelegate {
    var products: DigioCodable? {get set}
    func getProductList() -> [DigioCodable.Product]?
}

class DigioProductTableViewCellPresenter: DigioProductTableViewCellDelegate {
    var products: DigioCodable?
    
    init(products: DigioCodable? ) {
        self.products = products
    }
    
    func getProductList() -> [DigioCodable.Product]? {
        guard let products = self.products else { return nil }
        return products.products
    }
    
}
