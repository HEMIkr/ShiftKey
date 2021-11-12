//
//  ShiftsRepository.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
import Combine
import Networking
import Models

protocol ShiftsRepository {
    func getAvailableShifts(
        using model: GetAvailableShifts.Request
    ) -> AnyPublisher<[Shift], Error>
}

// Note: if there'd be need to add local-storage feature, this is the place to add and manage ShiftsStorageService
final class ShiftsRepositoryImpl: ShiftsRepository {
    private let shiftsApiService: APIShiftsService

    init(service: APIShiftsService) {
        self.shiftsApiService = service
    }

    func getAvailableShifts(
        using model: GetAvailableShifts.Request
    ) -> AnyPublisher<[Shift], Error> {
        let apiModel = APIRouter.AvailableShiftsParameters(
            startDate: model.startDate,
            type: model.searchType?.rawValue,
            address: model.address,
            radius: model.radius
        )
        return shiftsApiService.getAvailableShifts(using: apiModel)
    }
}
