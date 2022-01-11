//
//  MasterViewModels.swift
//  Assesment
//
//  Created by IQ Solutions on 11/01/2022.
//

import Foundation

enum Master {
    
    struct Animie {
        var malID: Int?
        var url: String?
        var imageURL: String?
        var title: String?
        var airing: Bool?
        var synopsis: String?
        var type: String?
        var episodes: Int?
        var score: Double?
        var startDate, endDate: String?
        var members: Int?
        var rated: String?
        
    }
    
    struct ViewData {
        let animies: [Animie]
    }
    
}
