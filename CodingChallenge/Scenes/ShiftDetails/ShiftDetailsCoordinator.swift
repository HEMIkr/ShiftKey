//
//  ShiftDetailsCoordinator.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
import SwiftUI
import Stinsen
import Models

final class ShiftDetailsCoordinator: NavigationCoordinatable {
    lazy var stack: NavigationStack<ShiftDetailsCoordinator> = NavigationStack(initial: \.start, shift)

    let shift: Shift
    
    @Root var start = makeStart

    init(shift: Shift) {
        self.shift = shift
    }

    @ViewBuilder private func makeStart(using shift: Shift) -> some View {
        ShiftDetailsView(
            viewModel: ShiftDetailsViewModel(shift: shift)
        )
    }
}
