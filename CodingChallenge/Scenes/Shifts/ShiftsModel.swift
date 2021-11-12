//
//  ShiftsModel.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation

struct GetAvailableShifts {
    struct Request {
        enum SearchType: String {
            case fourDays = "4day"
            case week
        }
        let searchType: SearchType?
        let startDate: Date?
        let radius: Double?
        let address: String?
    }
}
