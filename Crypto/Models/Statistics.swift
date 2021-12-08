//
//  Statistics.swift
//  Crypto
//
//  Created by Gael G. on 12/3/21.
//

import Foundation

struct Statistics: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
