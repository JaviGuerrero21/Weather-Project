//
//  HistoricalView.swift
//  WeatherProject
//
//  Created by user195857 on 6/23/21.
//

import SwiftUI

struct HistoricalView: View {
    
    @ObservedObject var cityVM = weatherViewModel()
    
    @State var pickerSelection = 0
    var barValues = [[HistoricalBar]]()
    var cantidad = 0
    
    /*
    @State var barValues : [[CGFloat]] =
        [
        [5,150,50,100,200,110,30,170,50],
        [200,110,30,170,50, 100,100,100,200],
        [10,20,50,100,120,90,180,200,40]
        ]
    */
    
    var body: some View {
        ZStack{
            Color(.blue).edgesIgnoringSafeArea(.all)

            VStack{
                Text("Estadisticas ultimas \(cantidad) horas").foregroundColor(.white)
                    .font(.largeTitle)

                Picker(selection: $pickerSelection, label: Text("Stats"))
                    {
                    Text("Temp").tag(0)
                    Text("Humidity").tag(1)
                    Text("Clouds").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)
                HStack(alignment: .bottom, spacing: 10)
                {
                    ForEach(self.barValues[pickerSelection], id: \.self){ data in
                        BarView(value: CGFloat(data.value), cornerRadius: CGFloat(integerLiteral: 1), hour: cityVM.getTimeFor(timestamp: data.dt))
                    }
                }.padding(.top, 24).animation(.default)
            }
        }
    }

    init(weatherResponse: WeatherResponse) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        //cityVM.getHistoricalWeather()
        print("Cantidad de datos historicos diarios \(weatherResponse.hourly.count)")
        setBarValues(weatherResponse: weatherResponse)
    }
    
    private mutating func setBarValues(weatherResponse: WeatherResponse){
        
        var temps = [HistoricalBar]()
        var humidity = [HistoricalBar]()
        var clouds = [HistoricalBar]()
        
        for weather in weatherResponse.hourly.reversed(){
            
            temps.append(HistoricalBar(dt: weather.dt, value: weather.temp))
            humidity.append(HistoricalBar(dt: weather.dt, value: Double(weather.humidity)))
            clouds.append(HistoricalBar(dt: weather.dt, value: Double(weather.clouds)))
            cantidad += 1
            //print("Prueba is \(weather.temp)")
            if(cantidad == 8){
                break
            }
        }
        
        self.barValues.append(temps)
        self.barValues.append(humidity)
        self.barValues.append(clouds)
        print("\nGrupo de estadisticas:", self.barValues)
    }
    
    struct HistoricalView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                //HistoricalView()
            }
        }
    }
}
