//
//  APIShiftsService.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Combine
import Foundation
import Models

public protocol APIShiftsService {
    func getAvailableShifts(
        using model: APIRouter.AvailableShiftsParameters
    ) -> AnyPublisher<[Shift], Error>
}

extension APIService: APIShiftsService {
    public func getAvailableShifts(
        using model: APIRouter.AvailableShiftsParameters
    ) -> AnyPublisher<[Shift], Error> {
        guard let request = APIRouter.getAvailableShifts(model).asURLRequest else {
            return Fail<[Shift], Error>(error: NetworkingError.invalidRequest).eraseToAnyPublisher()
        }
        return manager
            .dataTaskPublisher(for: request)
            .mapError { NetworkingError.other($0.localizedDescription) }
            .map(\.data)
            .decode(type: [Shift].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
