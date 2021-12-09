//
//  String.swift
//  Crypto
//
//  Created by Gael G. on 12/6/21.
//

import Foundation

extension String {
    /// Removes HTML code in a String
    var removeHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
