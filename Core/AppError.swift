//
//  UnknownError.swift
//  Core
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation

public enum AppError: LocalizedError {
    case unknown

    public var errorDescription: String? {
        switch self {
        case .unknown: return "networking.error.unknown".localized
        }
    }
}
