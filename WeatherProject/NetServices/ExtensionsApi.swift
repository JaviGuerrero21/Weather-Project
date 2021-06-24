//
//  ExtensionsApi.swift
//  WeatherProject
//
//  Created by Javier Guerrero on 18/6/21.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(Key)&units=imperial"
    }
    
    static func getHistoricalData(lat: Double, lon: Double, dt: Double) -> String {
        return "\(baseURLString)onecall\timemachine?lat=\(lat)&lon=\(lon)&dt=\(dt)&appid=\(Key)&units=metric"
    }
}
