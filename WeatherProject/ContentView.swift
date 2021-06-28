//
//  ContentView.swift
//  WeatherProject
//
//  Created by Javier Guerrero on 18/6/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = weatherViewModel()
    @State var isModal: Bool = false
    
    var body: some View {
            ZStack(alignment: .bottom){
                VStack(spacing: 0){
                    MenuHeaderView(cityVM: cityVM)
                    ScrollView(showsIndicators: false){
                        CityView(cityVM: cityVM)
                    }
                    Button("Historico"){
                        self.isModal = true
                    }.sheet(isPresented: $isModal, content: {
                        HistoricalView(weatherResponse: cityVM.historicalWeather)
                    }).foregroundColor(.white).font(.title)
                }.padding(.bottom, 40)
            }.background(LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.blue)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
