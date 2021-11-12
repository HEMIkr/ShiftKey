//
//  ShiftsRepositoryTests.swift
//  CodingChallengeTests
//
//  Created by Aleksander Wędrychowski on 12/11/2021.
//

import XCTest
import Combine
import Models
@testable import CodingChallenge

class ShiftsRepositoryTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    var apiShiftsServiceMock: APIShiftsServiceMock!
    var sut: ShiftsRepository!
    
    override func setUp() {
        apiShiftsServiceMock = APIShiftsServiceMock()
        sut = ShiftsRepositoryImpl(service: apiShiftsServiceMock)
    }
    
    override func tearDown() {
        cancellables = []
        apiShiftsServiceMock = nil
        sut = nil
    }
    
    func testShiftsFetchFailure() {
        apiShiftsServiceMock.getAvailableShiftsStub = { Fail(error: MockedError.error).eraseToAnyPublisher() }
        let exceptation = XCTestExpectation()
        sut.getAvailableShifts(using: .init(searchType: .fourDays, startDate: nil, radius: nil, address: nil))
            .mapError { error -> Error in
                exceptation.fulfill()
                return error
            }.sink(
                receiveCompletion: { _ in },
                receiveValue: { _ in
                    XCTFail()
                })
            .store(in: &cancellables)
        wait(for: [exceptation], timeout: 3)
    }
    
    func testShiftsFetchSuccess() {
        apiShiftsServiceMock.getAvailableShiftsStub = {
            Just([Shift.init(id: "", title: "")])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        let exceptation = XCTestExpectation()
        sut.getAvailableShifts(using: .init(searchType: .fourDays, startDate: nil, radius: nil, address: nil))
            .mapError { error -> Error in
                XCTFail()
                return error
            }.sink(
                receiveCompletion: { _ in },
                receiveValue: {
                    XCTAssert($0.isEmpty == false)
                    exceptation.fulfill()
                })
            .store(in: &cancellables)
        wait(for: [exceptation], timeout: 3)
    }
}
