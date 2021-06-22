//
//  MenuHeaderView.swift
//  WeatherProject
//
//  Created by Javier Guerrero on 20/6/21.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: weatherViewModel
    
    @State private var searchTerm = "San Francisco"
    
    var body: some View{
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            Button {
                cityVM.city = searchTerm
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
