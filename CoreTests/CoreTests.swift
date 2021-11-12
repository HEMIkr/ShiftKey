//
//  CoreTests.swift
//  CoreTests
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import XCTest
@testable import Core

class CoreTests: XCTestCase {
    func testDateToString() {
        let date = Date(timeIntervalSince1970: 0)
        let string = date.toString(.api)
    
        XCTAssert(string == "1970-01-01")
    }

    func testLocalization() {
        let textKey = "ok"
        let string = textKey.localized

        XCTAssert(string == "OK")
    }
}
