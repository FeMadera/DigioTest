//
//  testDigioTests.swift
//  testDigioTests
//
//  Created by Felipe madeira on 20/11/20.
//

import XCTest
@testable import testDigio

class testDigioTests: XCTestCase {
    
    var products: DigioCodable?

    override func setUpWithError() throws {
        products = DigioListService().loadJson(filename: "DigioMockJson")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testgetProducts()  {
        let product = DigioListService().loadJson(filename: "DigioMockJson")
        XCTAssertNotNil(product)
    }
    
    func testgetSpotlight()   {
        guard let product = self.products else { return  }
        XCTAssertNotNil(product.spotlight)
        XCTAssertEqual(product.spotlight?.count, 2)
    }
    
    func testgetCash()  {
        guard let product = self.products else { return  }
        XCTAssertNotNil(product.cash)
        XCTAssertEqual(product.cash?.title, "digio Cash")
    }
    
    func testgetProduct() {
        guard let product = self.products else { return  }
        XCTAssertNotNil(product.products)
        XCTAssertEqual(product.products?.count,3)
    }
  

}
