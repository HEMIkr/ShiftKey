//
//  NetworkingError.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
import Core

enum NetworkingError: LocalizedError {
    case invalidRequest
    case unableToDecodeRequestedType
    case unknown
    case other(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidRequest: return "networking.error.badRequest".localized
        case .unableToDecodeRequestedType: return "networking.error.unableToDecode".localized
        case .unknown: return "networking.error.unknown".localized
        case .other(let errorDescription): return errorDescription
        }
    }
}
