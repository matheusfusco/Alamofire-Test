//
//  APIManager.swift
//  AlamofireProj
//
//  Created by Matheus Pacheco Fusco on 06/03/17.
//  Copyright © 2017 Matheus Pacheco Fusco. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    func get(completion: @escaping(Any?) -> Void){
        
        Alamofire.request("https://httpbin.org/get")
            .validate()
        .responseJSON { (response) in
            switch response.result {
                case .success:
                    
                    print("Request: \(response.request!)")
                    print("Response: \(response.response!.statusCode)")
                    print("Data: \(response.data!)")
                    print("Result: \(response.result)")
                    
                    print("----------")
                    
                    if let JSON = response.result.value as? Dictionary<String, Any> {
                        let convertedResponse : ResponseModel = JSONConverter().convertToResponse(JSON)
                        print("JSON: \(JSON)")
                        print("----------")
                        completion(convertedResponse)
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    print("----------")
                    completion(error)
                    break
            }
        }
    }
}
