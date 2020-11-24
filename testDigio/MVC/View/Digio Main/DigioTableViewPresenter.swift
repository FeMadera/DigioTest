//
//  DigioTableViewPresenter.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import Foundation


enum collectionCellType: Int {
    case spotlights = 0
    case cash = 1
    case product = 2
    
    var digioType : String {
        switch self {
        case .spotlights:  return  "spotlights"
        case .cash: return "cash"
        case .product: return "product"
        }
    }
}

protocol DigioTableViewPresenterDelegate {
    func getProductsList( _ completion:@escaping (_ resultList: DigioCodable?) -> ())
    var products: DigioCodable? { get set}
}

class DigioTableViewPresenter: DigioTableViewPresenterDelegate {
    
    var products: DigioCodable?
    private var digioInteractor: DigioTableViewInteractor? = DigioTableViewInteractor()
    private var controllerDelegate : DigioViewControllerDelegate?
    
    //LISTA DE PRODUTOS
    func getProductsList( _ completion:@escaping (_ resultList: DigioCodable?) -> ())  {
        digioInteractor?.getProduct({ (productsResult) in
            self.products = productsResult
            self.controllerDelegate?.reloadData()
            completion(productsResult)
        })
    }
}
