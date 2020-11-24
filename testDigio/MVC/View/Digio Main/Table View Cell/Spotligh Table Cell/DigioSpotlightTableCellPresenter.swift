//
//  DigioTableCellPresenter.swift
//  testDigio
//
//  Created by Felipe madeira on 22/11/20.
//

import Foundation

protocol DigioSpotlightTableCellPresenterDelegate {
    var products: DigioCodable? {get set}
    func getSpotlightList() -> [DigioCodable.spotlight]?
}


class DigioSpotlightTableCellPresenter: DigioSpotlightTableCellPresenterDelegate {
    var products: DigioCodable?
    
    init(products: DigioCodable? ) {
        self.products = products
    }
    
    func getSpotlightList() -> [DigioCodable.spotlight]?  {
        guard let products = self.products else { return nil }
        return products.spotlight
    }
    
}
