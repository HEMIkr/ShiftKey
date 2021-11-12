//
//  APIRouter+Models.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 10/11/2021.
//

import Foundation
import Core

extension APIRouter {

    /// API documentation: https://bitbucket.org/shiftkeyllc/ios-coding-challenge/src/master/API-DOC.md
    public struct AvailableShiftsParameters {
        public init(startDate: Date?, type: String?, address: String?, radius: Double?) {
            self.startDate = startDate
            self.type = type
            self.address = address
            self.radius = radius
        }
        
        
        public let startDate: Date?
        public let type: String?
        public let address: String?
        public let radius: Double?
    
        var asQuerryItems: [URLQueryItem] {
            [
                buildQuerryItem(name: "start", value: startDate?.toString()),
                buildQuerryItem(name: "type", value: type),
                buildQuerryItem(name: "address", value: address),
                buildQuerryItem(name: "radius", value: radius?.description)
            ]
                .compactMap { $0 }
        }
    
        private func buildQuerryItem(name: String, value: String?) -> URLQueryItem? {
            guard let value = value, value.isEmpty == false else { return nil }
            return URLQueryItem(name: name, value: value)
        }
    }
}
