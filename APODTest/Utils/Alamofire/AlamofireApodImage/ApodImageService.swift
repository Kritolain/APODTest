//
//  ApodImageService.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation


protocol ApodImageService {
    
    typealias ApodImageResponse = (Bool, APIImage?, Error?) -> Void
    
    func getInfoData(imageData params: [String : Any], completion: @escaping ApodImageService.ApodImageResponse)
}
