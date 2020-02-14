//
//  Constants.swift
//  Weather
//
//  Created by Jelajah Data Semesta on 14/02/20.
//  Copyright © 2020 Raju Riyanda. All rights reserved.
//

import Foundation

struct Constants {
    
    // MARK: Main Endpoints
    static let baseUrl = Bundle.main.infoDictionary!["Base Url"] as? String
    
    // MARK: Image Url
    static let imageUrl = Bundle.main.infoDictionary!["Image Url"] as? String
    
    // MARK: App ID Open Weather
    static let appId = Bundle.main.infoDictionary!["App Id"] as? String
}
