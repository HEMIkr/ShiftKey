//
//  ShiftsViewModel.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 10/11/2021.
//

import Foundation
import Combine
import Core
import Stinsen
import Models

final class ShiftsViewModel: ObservableObject {

    // MARK: - Properties

    @RouterObject var router: ShiftsCoordinator.Router?
    @Published var fetching: Bool = false
    @Published var showError: Bool = false
    @Published var error: LocalizedError?
    @Published var shifts: [Shift] = []
    private var cancellables: Set<AnyCancellable> = []
    private let repository: ShiftsRepository

    // MARK: Localizations
    var titleText: String { "shifts.title".localized }
    var searchAddressText: String { "shifts.address.input".localized }
    var searchDateText: String { "shifts.date.input".localized }
    var searchText: String { "shifts.search".localized }

    // MARK: Search parameters
    var searchStartDate: Date = Date()
    var searchRadius: Double?
    var searchAddress: String = ""
    
    // MARK: - Lifecycle

    init(repository: ShiftsRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods

    func showDetails(_ shift: Shift) {
        router?.route(to: \.details, shift)
    }

    func getShifts() {
        fetching = true
        
        return repository.getAvailableShifts(
            using: .init(
                searchType: .week,
                startDate: searchStartDate,
                radius: searchRadius,
                address: searchAddress
            )
        )
            .receive(on: RunLoop.main)
            .catch { [weak self] error -> AnyPublisher<[Shift], Never> in
                let error = error as? LocalizedError ?? AppError.unknown
                self?.error = error
                self?.showError = true
                return .init(Just<[Shift]>([]))
            }
            .sink { [weak self] value in
                if value.isEmpty == false {
                    self?.showError = false
                }
                self?.shifts = value
                self?.fetching = false
            }
            .store(in: &cancellables)
    }
}
