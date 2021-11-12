//
//  APIService.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation
import Combine

public struct APIService {
    var manager: URLSession {
        return URLSession.shared
    }

    public init() {}
}
