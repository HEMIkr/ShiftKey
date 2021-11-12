//
//  Date+toString.swift
//  Core
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
extension Date {
    public enum Format: String {
        case api = "YYYY-MM-DD"
    }

    public func toString(_ format: Format = .api) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
