//
//  DigioTableViewPresenterTests.swift
//  testDigioTests
//
//  Created by Felipe madeira on 24/11/20.
//

import XCTest

@testable import testDigio

class DigioTableViewPresenterTests: XCTestCase {

    var products: DigioCodable?

    override func setUpWithError() throws {
        products = DigioListService().loadJson(filename: "DigioMockJson")
        
    }

    override func tearDownWithError() throws {
    }
    
    func testgetProductsList()  {
        let product = DigioListService().loadJson(filename: "DigioMockJson")
        XCTAssertNotNil(product)
        guard let productList = product else {return}
        XCTAssertEqual("digio Cash", productList.cash?.title)
        XCTAssertEqual(productList.spotlight?.count, 2)
        XCTAssertEqual(productList.products?.count,3)
    }
    

}
