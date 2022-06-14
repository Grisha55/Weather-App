//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 14/06/2022.
//

import Foundation

class WeatherService {
    
    private let apiKey = "48f5e323f064a52876d82fd0b6b85a27"
    
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=
    
    func getWeatherData(city: String, completion: @escaping (DetailWeather) -> Void) {
        self.takeLocationCoordinates(from: city) { coordinates in
            self.getDataOfWeather(lat: coordinates.first?.lat ?? 0, lon: coordinates.first?.lon ?? 0, completion: { detail in
                completion(detail)
            })
        }
    }
    
    func getDataOfWeather(lat: Double, lon: Double, completion: @escaping (DetailWeather) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.openweathermap.org"
        urlConstructor.path = "/data/2.5/weather"
        urlConstructor.queryItems = [
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon)),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        
        guard let url = urlConstructor.url else { return }
        
        session.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    let detail = try JSONDecoder().decode(DetailWeather.self, from: data!)
                    completion(detail)
                }
                catch {
                    print("Error: \(error)")
                }
            }
        }.resume()
    }
    
    // First method will be to take coordinates of the city
    
    private func takeLocationCoordinates(from city: String, completion: @escaping ([WeatherCity]) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "api.openweathermap.org"
        urlConstructor.path = "/geo/1.0/direct"
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "limit", value: "5"),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        
        guard let url = urlConstructor.url else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    let coordinates = try JSONDecoder().decode([WeatherCity].self, from: data!)
                    completion(coordinates)
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}
