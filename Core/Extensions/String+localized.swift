//
//  String+localized.swift
//  Core
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import Foundation

extension String {
    public var localized: String {
        NSLocalizedString(self, bundle: Bundle(for: BundleClass.self), comment: "")
    }
}

private class BundleClass {}
