//
//  Shift.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 10/11/2021.
//

import Foundation

public struct Shift: Codable, Identifiable {
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    public let id: String
    public let title: String
}
