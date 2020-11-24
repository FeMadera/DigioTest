//
//  DigioProductTableViewCellPresenterTests.swift
//  testDigioTests
//
//  Created by Felipe madeira on 24/11/20.
//

import XCTest
@testable import testDigio

class DigioProductTableViewCellPresenterTests: XCTestCase {

   
    var products: DigioCodable?

    override func setUpWithError() throws {
        products = DigioListService().loadJson(filename: "DigioMockJson")
    }

    override func tearDownWithError() throws {
    }
    
    func testgetProductList() {
        let product = DigioListService().loadJson(filename: "DigioMockJson")
        guard let products = self.products else { return  }
        XCTAssertNotNil(products)
        guard let productList = product else {return}
        XCTAssertNotNil(productList.products)
        XCTAssertEqual(productList.products?.count,3)
        XCTAssertEqual("XBOX", productList.products?[0].name)
    }
}
