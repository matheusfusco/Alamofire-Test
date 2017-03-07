//
//  JSONConverter.swift
//  AlamofireProj
//
//  Created by Matheus Pacheco Fusco on 07/03/17.
//  Copyright © 2017 Matheus Pacheco Fusco. All rights reserved.
//

import UIKit

class JSONConverter: NSObject {
    func convertToResponse(_ dict : Dictionary<String, Any>) -> ResponseModel {
        var responseModel = ResponseModel()
        
        if let origin = dict["origin"] as? String {
            responseModel.origin = origin
        }
        
        if let headers = dict["headers"] as? NSDictionary {
            if let encoding = headers["Accept-Encoding"] as? String {
                responseModel.encoding = encoding
            }
            
            if let language = headers["Accept-Language"] as? String {
                responseModel.language = language
            }
            
            if let host = headers["Host"] as? String {
                responseModel.host = host
            }
            
            if let userAgent = headers["User-Agent"] as? String {
                responseModel.userAgent = userAgent
            }
        }
        
        if let url = dict["url"] as? String {
            responseModel.url = url
        }
        
        return responseModel
    }
}
