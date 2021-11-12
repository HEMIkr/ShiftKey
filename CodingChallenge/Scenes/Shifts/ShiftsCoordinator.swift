//
//  ShiftsCoordinator.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 10/11/2021.
//

import SwiftUI
import Stinsen
import Models

final class ShiftsCoordinator: NavigationCoordinatable {
    var stack: NavigationStack<ShiftsCoordinator> = NavigationStack(initial: \.start)
    let shiftsRepository: ShiftsRepository

    @Root var start = makeStart
    @Route(.modal) var details = makeDetails

    init(repository: ShiftsRepository) {
        self.shiftsRepository = repository
    }

    @ViewBuilder private func makeStart() -> some View {
        let viewModel = ShiftsViewModel(repository: shiftsRepository)
        ShiftsView(viewModel: viewModel)
    }

    private func makeDetails(using shift: Shift) -> ShiftDetailsCoordinator {
        ShiftDetailsCoordinator(shift: shift)
    }
}
