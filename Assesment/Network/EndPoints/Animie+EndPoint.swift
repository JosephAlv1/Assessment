//
//  Animie+EndPoint.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation

extension APIEndPoint {
    
    enum Animie {
        case animieList(anime: String)
        
        var endPoint: Endpoint {
            
            switch self {
            case .animieList(let anime):
                return APIEndPoint.init(method: .get, resourcePath: "search/anime", parameters: ["q": "\(anime)"], version: .v3)
            }
        }
    }
    
}
