//
//  ApiService.swift
//  Weather
//
//  Created by Jelajah Data Semesta on 14/02/20.
//  Copyright © 2020 Raju Riyanda. All rights reserved.
//

import Foundation
import Moya



let urlWeather = URL(string: Constants.baseUrl ?? "")!
let imageUrlWeather = URL(string: Constants.imageUrl ?? "")!
   
    
enum WeatherApi {
    case getWeatherCity(query: QueryCityReq )
    case getWeatherLatLong(latlong: LatLongReq)
}


extension WeatherApi: TargetType{
    
    var endpointClosure: (WeatherApi) -> Endpoint {
      return { _ in
        return MoyaProvider.defaultEndpointMapping(for: self).adding(newHTTPHeaderFields: self.headers!)
      }
    }
   
    var sampleData: Data {
       return Data()
     }
    
    var baseURL: URL {
        return urlWeather
    }
    
    var path: String {
        return "weather"
    }
    
    var method: Moya.Method {
        return .get
    }
    

    
    var task: Task {
        switch self {
        case .getWeatherCity(let query):
            return .requestParameters(parameters: query.toDictionary(), encoding: URLEncoding.queryString)
        case .getWeatherLatLong(let latlong):
              return .requestParameters(parameters: latlong.toDictionary(), encoding: URLEncoding.queryString)
        default:
            break
            
        }
    }
    
    var headers: [String : String]? {
       
        return ["Authorization" : "application/json"]
    }
    
    
}



