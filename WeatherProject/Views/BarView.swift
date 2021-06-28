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

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 40, height: 100).foregroundColor(.black)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 40, height: value).foregroundColor(.white)
                
            }.padding(.bottom, 8)
        }
    }
}
