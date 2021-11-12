//
//  ShiftsViewModelTests.swift
//  CodingChallengeTests
//
//  Created by Aleksander Wędrychowski on 12/11/2021.
//
import XCTest
import Combine
import Models
@testable import CodingChallenge

class ShiftsViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    var shiftsRepositoryMock: ShiftsRepositoryMock!
    var sut: ShiftsViewModel!
    
    override func setUp() {
        shiftsRepositoryMock = ShiftsRepositoryMock()
        sut = ShiftsViewModel(repository: shiftsRepositoryMock)
    }

    override func tearDown() {
        shiftsRepositoryMock = nil
        sut = nil
    }

    func testTitle() {
        XCTAssert(sut.titleText == "Shifts")
    }

    func testAddressText() {
        XCTAssert(sut.searchAddressText == "Searched address", sut.titleText)
    }

    func testDateText() {
        XCTAssert(sut.searchDateText == "Searched date", sut.titleText)
    }

    func testSearchText() {
        XCTAssert(sut.searchText == "Search", sut.titleText)
    }

    func testGetShiftsSuccess() {
        shiftsRepositoryMock.getAvailableShiftsStub = {
            Just([Shift(id: "", title: "")])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        }
        sut.getShifts()

        let exeptation = XCTestExpectation()
        sut.$shifts
            .first(where: { $0.isEmpty == false })
            .sink { value in
            XCTAssert(value.isEmpty == false)
            exeptation.fulfill()
        }.store(in: &cancellables)
        
        wait(for: [exeptation], timeout: 3)
    }

    func testGetShiftsFailure() {
        
    }
}
