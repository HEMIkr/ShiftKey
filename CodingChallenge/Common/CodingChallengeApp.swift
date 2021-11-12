//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI
import Stinsen
import Networking

@main
struct CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = ShiftsRepositoryImpl(service: APIService())
            NavigationViewCoordinator(ShiftsCoordinator(repository: repository)).view()
        }
    }
}
