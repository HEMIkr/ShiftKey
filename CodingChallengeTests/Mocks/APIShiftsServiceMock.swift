//
//  APIShiftsServiceMock.swift
//  CodingChallengeTests
//
//  Created by Aleksander Wędrychowski on 12/11/2021.
//

import Foundation
import Combine
import Models
@testable import CodingChallenge
@testable import Networking

class APIShiftsServiceMock: APIShiftsService {
    var getAvailableShiftsStub: (() -> AnyPublisher<[Shift], Error>)!
    func getAvailableShifts(
        using model: APIRouter.AvailableShiftsParameters
    ) -> AnyPublisher<[Shift], Error> {
        getAvailableShiftsStub()
    }
}
