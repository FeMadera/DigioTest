//
//  DigioCashTableViewCellPresenterTests.swift
//  testDigioTests
//
//  Created by Felipe madeira on 24/11/20.
//

import XCTest

@testable import testDigio

class DigioCashTableViewCellPresenterTests: XCTestCase {
    
    
    var products: DigioCodable?

    override func setUpWithError() throws {
        products = DigioListService().loadJson(filename: "DigioMockJson")
    }

    override func tearDownWithError() throws {
    }
    
    func testgetCashList() {
        let product = DigioListService().loadJson(filename: "DigioMockJson")
        guard let products = self.products else { return  }
        XCTAssertNotNil(products)
        guard let productList = product else {return}
        XCTAssertNotNil(productList.cash)
        XCTAssertEqual("digio Cash", productList.cash?.title)
    }
}
