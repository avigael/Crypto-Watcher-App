//
//  Color.swift
//  Crypto
//
//  Created by Gael G. on 11/30/21.
//

import Foundation
import SwiftUI

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

extension Color {
    static let theme = ColorTheme()
}