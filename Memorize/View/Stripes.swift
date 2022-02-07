//
//  Stripes.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 7/2/2565 BE.
//

import SwiftUI

struct StripeView<SymbolShape>: View where SymbolShape: Shape {
    let numberOfStripes: Int = 8
    let borderLineWidth: CGFloat = 1.3
    
    let shape: SymbolShape
    let color: Color
    let spacingColor = Color.white
    
    var body: some View {
        VStack(spacing: 0.5) {
            ForEach(0..<numberOfStripes) { _ in
                spacingColor
                color
            }
            spacingColor
        }
        .mask(shape)
        .overlay(shape.stroke(color, lineWidth: borderLineWidth))
    }
}
