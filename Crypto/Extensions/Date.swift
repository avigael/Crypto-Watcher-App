//
//  Date.swift
//  Crypto
//
//  Created by Gael G. on 12/6/21.
//

import Foundation

extension Date {
    
    /// Creates a date from a CoinGecko API String date
    /// - Parameter coinGeckoDate: String date used by CoinGecko API
    init(coinGeckoDate: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoDate) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    /// Converts a Date to a short date style as a String
    /// ```
    /// Converts 2021-12-09 12:34:56 +0000 to "12/09/2021"
    /// ```
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
}
