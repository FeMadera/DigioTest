//
//  DigioSpotlightTableCellPresenterTests.swift
//  testDigioTests
//
//  Created by Felipe madeira on 24/11/20.
//

import XCTest

@testable import testDigio

class DigioSpotlightTableCellPresenterTests: XCTestCase {
    
    var products: DigioCodable?

    override func setUpWithError() throws {
        products = DigioListService().loadJson(filename: "DigioMockJson")
        
    }

    override func tearDownWithError() throws {
    }
    
    func testgetSpotlightList()  {
        let product = DigioListService().loadJson(filename: "DigioMockJson")
        XCTAssertNotNil(product)
        guard let productList = product else {return}
        XCTAssertEqual("Recarga", productList.spotlight?[0].name)
        XCTAssertEqual(productList.spotlight?.count, 2)
    }
    

}
