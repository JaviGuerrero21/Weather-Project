//
//  BarView.swift
//  WeatherProject
//
//  Created by user195857 on 6/23/21.
//

import SwiftUI

struct BarView: View {
    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            Text("\(String(format: "%.1f", value))")
                .font(.footnote)
                .rotationEffect(.degrees(-90))
                .offset(y: 0)
                .zIndex(1)
                .foregroundColor(Color.black)
            Rectangle()
                .fill(Color.white)
                .frame(width: 30, height: value * 2)
            Text("\(1)")
                .font(.footnote)
                .frame(height: 20)
        }
    }
}
