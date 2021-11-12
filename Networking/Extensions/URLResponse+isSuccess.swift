//
//  URLResponse+isSuccess.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation

extension URLResponse {
    private static let successStatusCodes = (200...299)
    var isSuccess: Bool {
        guard let response = self as? HTTPURLResponse else {
            assertionFailure()
            return false
        }
        return URLResponse.successStatusCodes.contains(response.statusCode)
    }
}
