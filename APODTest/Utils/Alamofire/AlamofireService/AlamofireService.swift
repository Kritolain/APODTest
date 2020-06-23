//
//  AlamofireService.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireService {
    
    func get(at route: String, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .get, params: params, encoding: URLEncoding.default)
    }
    
    func request(at route: String, method: HTTPMethod, params: Parameters = [:], encoding: ParameterEncoding) -> DataRequest {
        let routeUrl = "\(requestDomain)\(route)"
        return AF.request(routeUrl, method: method, parameters: params, encoding: encoding, headers: getDefaultHeaders())
            .validate()
    }
    
    func getDefaultHeaders() -> HTTPHeaders? {
           /*if let authToken = UserDefaultHelper.getUserDefault(UserInformationKey.token.key).stringValue {
               return ["Authorization" : authToken]
           } else {
               return nil
           }*/
        return nil
       }
    
}
