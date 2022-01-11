//
//  ENUM.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(String)
}
