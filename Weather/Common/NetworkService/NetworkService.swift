//
//  NetworkService.swift
//  Weather
//
//  Created by Jelajah Data Semesta on 14/02/20.
//  Copyright © 2020 Raju Riyanda. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import ObjectMapper
import RxSwift

final class NetworkService {
    static let shared = NetworkService()
    
    static func getNetworkManager() -> Alamofire.SessionManager {
      let configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = 40
      configuration.timeoutIntervalForResource = 40
      return Alamofire.SessionManager(configuration:configuration)
      
    }
    
      func requestApi<T: Mappable>(api: WeatherApi, subject: ReplaySubject<T>, mappableType: T.Type) {
        let networkManager = NetworkService.getNetworkManager()
        let provider = MoyaProvider<WeatherApi>(endpointClosure: api.endpointClosure, manager: networkManager)
        
        provider.request(api) { (result) in
            
            switch result {
                
            case .success(let value):
                
                do {
                    guard let jsonResponse = try value.mapJSON() as? [String: Any]else {
                               subject.onError(ApiError.invalidJSONError)
                               return
                           }
                    let map = Map(mappingType: .fromJSON, JSON: jsonResponse)
                    guard let responseObject = mappableType.init(map: map) else {
                      subject.onError(ApiError.failedMappingError)
                      return
                    }
                    
                    subject.onNext(responseObject)
                    subject.onCompleted()
                } catch  {
                     subject.onError(ApiError.invalidJSONError)
                }
            case .failure:
                subject.onError(ApiError.connectionError)
            }
        }
    }
}
