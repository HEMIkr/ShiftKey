//
//  Decodable+make.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation

extension Decodable {
    public static func make(from data: Data) throws -> Self {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print(json)
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
