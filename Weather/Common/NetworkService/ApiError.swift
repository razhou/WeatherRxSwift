//
//  ApiError.swift
//  Weather
//
//  Created by Jelajah Data Semesta on 15/02/20.
//  Copyright © 2020 Raju Riyanda. All rights reserved.
//

import Foundation

enum ApiError: Error {
case connectionError
case invalidJSONError
case failedMappingError

var localizedDescription: String {
  switch self {
  case .connectionError:   //Connection erroe
    return "Connection Error"
  case .invalidJSONError:         //Invalid JSON
    return "Json Error"
  case .failedMappingError:           //Invalid object
    return "failed_mapping"
 
    }
  }
}
