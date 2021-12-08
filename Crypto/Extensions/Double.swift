//
//  Double.swift
//  Crypto
//
//  Created by Gael G. on 12/1/21.
//

import Foundation

extension Double {
    /// Converts Double into a Currency with 2 decimal places
    /// ```
    /// Converts 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts Double into a Currency with 2 decimal places as a String
    /// ```
    /// Converts 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts Double into a Currency with 2-6 decimal places
    /// ```
    /// Converts 1234.56 to $1,234.56
    /// Converts 12.3456 to $12.3456
    /// Converts 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts Double into a Currency with 2-6 decimal places as a String
    /// ```
    /// Converts 1234.56 to "$1,234.56"
    /// Converts 12.3456 to "$12.3456"
    /// Converts 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts Double into a String with 2 decimal places
    /// ```
    /// Converts 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts Double into a String representation of a percentage with 2 decimal places
    /// ```
    /// Converts 1.2345 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    /// Converts a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Converts 12 to "12.00"
    /// Converts 1234 to "1.23K"
    /// Converts 123456 to "123.45K"
    /// Converts 12345678 to "12.34M"
    /// Converts 1234567890 to "1.23Bn"
    /// Converts 123456789012 to "123.45Bn"
    /// Converts 12345678901234 to "12.34Tr"
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
