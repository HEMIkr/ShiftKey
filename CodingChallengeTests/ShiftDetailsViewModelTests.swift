//
//  ShiftDetailsViewModelTests.swift
//  CodingChallengeTests
//
//  Created by Aleksander Wędrychowski on 12/11/2021.
//
import XCTest
import Combine
import Models
@testable import CodingChallenge

class ShiftDetailsViewModelTests: XCTestCase {

    var sut: ShiftDetailsViewModel!
    
    override func setUp() {
        sut = ShiftDetailsViewModel(shift: .init(id: "", title: ""))
    }

    override func tearDown() {
        sut = nil
    }

    func testTitle() {
        XCTAssert(sut.shiftDetailsText == "Shift details")
    }
}
