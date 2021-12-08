//
//  CircleButtonView.swift
//  Crypto
//
//  Created by Gael G. on 11/30/21.
//

import SwiftUI

struct IconButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 40, height: 40)
            .padding()
    }
}

struct IconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IconButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            IconButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
