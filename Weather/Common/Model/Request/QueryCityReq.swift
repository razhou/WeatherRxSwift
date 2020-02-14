//
//  QueryCityModel.swift
//  Weather
//
//  Created by Jelajah Data Semesta on 15/02/20.
//  Copyright © 2020 Raju Riyanda. All rights reserved.
//

import Foundation

class QueryCityReq: NSObject{

    var appid : String!
    var q : String!
    var lang : String? = "id"


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        appid = dictionary["appid"] as? String
        lang = dictionary ["lang"] as? String
        q = dictionary["q"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if appid != nil{
            dictionary["appid"] = appid
        }
        if lang != nil {
            dictionary["lang"] = lang
        }
        if q != nil{
            dictionary["q"] = q
        }
        return dictionary
    }

 

}
