//
//  APIWorker.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation

class APIWorker {
    
    static func searchAnimesWith(text: String, onComplete: @escaping (_ result: NetworkResult<AnimieProtocol?>) -> Void) {
        
        let endPoint = APIEndPoint.Animie.animieList(anime: text).endPoint
        
        APIManager.shared.execute(endPoint) { (result: NetworkResult<AnimieResult>) in
            switch result {
            case .success(let data):
                onComplete(.success(data))
            case .failure(let errorString):
                onComplete(.failure(errorString))
            }
        }
    }
    
}
