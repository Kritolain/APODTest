//
//  AlamofireApodImageService.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation

class AlamofireApodImageService: AlamofireService, ApodImageService {

  func getInfoData(imageData params: [String : Any], completion: @escaping (Bool, APIImage?, Error?) -> Void) {
      get(at: ApodImageServiceRouter.apod.path, params: params).responseJSON { (response) in
          print(response)
          switch response.result {
          case .success:
              if response.response?.statusCode != 200 {
                  completion(false, nil,nil)
              } else {
                  do {
                      let imageData = try JSONDecoder().decode(APIImage.self, from: response.data!)
                      completion(true, imageData, nil)
                  } catch let decodingError {
                      completion(false, nil, decodingError)
                  }
              }
          case .failure(let error):
              completion(false, nil, error)
          }
      }
  }
  
}
