//
//  HistoricalView.swift
//  WeatherProject
//
//  Created by user195857 on 6/23/21.
//

import SwiftUI

struct HistoricalView: View {
    
    var weatherResponse: WeatherResponse
    
    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
        [
        [5,150,50,100,200,110,30,170,50],
        [200,110,30,170,50, 100,100,100,200],
        [10,20,50,100,120,90,180,200,40]
        ]
    var body: some View {
        ZStack{
            Color(.blue).edgesIgnoringSafeArea(.all)

            VStack{
                Text("Estadisticas ultimas 4 horas").foregroundColor(.white)
                    .font(.largeTitle)

                Picker(selection: $pickerSelection, label: Text("Stats"))
                    {
                    Text("Views").tag(0)
                    Text("Reads").tag(1)
                    Text("Fans").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)

                HStack(alignment: .center, spacing: 10)
                {
                    ForEach(barValues[pickerSelection], id: \.self){
                        data in
                        
                        BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                    }
                }.padding(.top, 24).animation(.default)
            }
        }
    }

    init(weatherResponse: WeatherResponse) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.weatherResponse = weatherResponse
    }
    
    struct HistoricalView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                //HistoricalView()
            }
        }
    }
}
