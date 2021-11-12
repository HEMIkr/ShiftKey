//
//  ExtensionsTests.swift
//  NetworkingTests
//
//  Created by Aleksander Wędrychowski on 12/11/2021.
//

import XCTest
@testable import Networking

class ExtensionsTests: XCTestCase {

    func testDecodableMake() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testURLResponseIsSuccess_success() {
        let response = HTTPURLResponse(url: URL(string: "http://fakeurl.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!

        XCTAssert(response.isSuccess)
    }
    
    func testURLResponseIsSuccess_failure() {
        let response = HTTPURLResponse(url: URL(string: "http://fakeurl.com")!, statusCode: 400, httpVersion: nil, headerFields: nil)!
        
        XCTAssertFalse(response.isSuccess)
    }

}
