//
//  Shopify_Summer_2019Tests.swift
//  Shopify Summer 2019Tests
//
//  Created by Bimal Bhagrath on 2019-01-17.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import XCTest
@testable import Shopify_Summer_2019

class Shopify_Summer_2019Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPICollectionsCall() {
        let promise = expectation(description: "API did return collections")
        API.fetchCollections(complete: { collections in
            XCTAssert(collections.count > 0)
            promise.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
