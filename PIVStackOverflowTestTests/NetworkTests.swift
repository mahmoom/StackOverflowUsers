//
//  price_testTests.swift
//  price-testTests
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 goodrx. All rights reserved.
//

import XCTest
@testable import PIVStackOverflowTest

class NetworkTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCallToGoodRxAPICompletes() {
        // given
        let url =
            URL(string: "https://api.stackexchange.com/2.2/users?site=stackoverflow")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

}
