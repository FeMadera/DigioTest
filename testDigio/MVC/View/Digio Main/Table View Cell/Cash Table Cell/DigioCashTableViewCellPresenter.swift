//
//  DigioCashTableViewCellPresenter.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import Foundation

protocol DigioCashTableViewCellPresenterDelegate: class {
    var products: DigioCodable? { get set}
    func getCashList() -> DigioCodable.Cash?
}


class DigioCashTableViewCellPresenter:  DigioCashTableViewCellPresenterDelegate {
    var products: DigioCodable?
    
    init(products: DigioCodable? ) {
        self.products = products
    }
    
    func getCashList() -> DigioCodable.Cash?  {
        guard let products = self.products else { return nil }
        return products.cash
    }
    
}
