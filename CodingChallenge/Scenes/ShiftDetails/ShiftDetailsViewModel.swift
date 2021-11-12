//
//  ShiftDetailsViewModel.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
import Combine
import Models

final class ShiftDetailsViewModel: ObservableObject {
    @Published var shift: Shift

    var shiftDetailsText: String { "details.title".localized }
    init(shift: Shift) {
        self.shift = shift
    }
}
