//
//  ServiceStructs.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 14/06/2022.
//

import Foundation

struct DetailWeather: Decodable {
    var weather: [Weather]
    var main: WeatherTemperature
}

struct WeatherTemperature: Decodable {
    var temp: Double
}

struct Weather: Decodable {
    var main: String
    var description: String
    var icon: String
}

struct WeatherCity: Decodable {
    var lat: Double
    var lon: Double
}

/*
 {
     country = RU;
     lat = "57.6263877";
     "local_names" =     {
         ar = "\U064a\U0627\U0631\U0648\U0633\U0644\U0627\U0641\U0644";
         ascii = Yaroslavl;
         cs = Jaroslavl;
         de = Jaroslawl;
         en = Yaroslavl;
         et = Jaroslavl;
         "feature_name" = Yaroslavl;
         fi = Jaroslavl;
         fr = Iaroslavl;
         hr = Jaroslavlj;
         hu = Jaroszlavl;
         ko = "\Uc57c\Ub85c\Uc2ac\Ub77c\Ube14";
         lt = Jaroslavlis;
         pl = "Jaros\U0142aw";
         ro = Iaroslavl;
         ru = "\U042f\U0440\U043e\U0441\U043b\U0430\U0432\U043b\U044c";
         sk = "Jaroslav\U013e";
         sr = "\U0408\U0430\U0440\U043e\U0441\U043b\U0430\U0432\U0459";
         uk = "\U042f\U0440\U043e\U0441\U043b\U0430\U0432\U043b\U044c";
         zh = "\U96c5\U7f57\U65af\U62c9\U592b\U5c14";
     };
     lon = "39.8933705";
     name = Yaroslavl;
     state = "Yaroslavl Oblast";
 },
 */
