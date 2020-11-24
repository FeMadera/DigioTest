//
//  DigioTableCellInteractor.swift
//  testDigio
//
//  Created by Felipe madeira on 22/11/20.
//

import Foundation

class DigioTableViewInteractor: NSObject {
       
    private var services: DigioListService? = DigioListService()
    
     func getProduct(_ completion: @escaping (_ resultList: DigioCodable?) -> ()) {
        services?.makeRequestProduct({ (result, products) in
            completion(products)
        })
    }
}
