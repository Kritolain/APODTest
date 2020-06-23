//
//  ApodImageServiceRouter.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation

enum ApodImageServiceRouter: String {
    
    case apod
    
    var path: String {
        switch self {
        /// Apod Router
        case .apod:
            return "apod"
            
        }
    }
}

