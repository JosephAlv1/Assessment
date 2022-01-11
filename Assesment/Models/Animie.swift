//
//  Animie.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation

protocol AnimieProtocol: Decodable {
    var requestHash: String? { get set }
    var requestCached: Bool? { get set }
    var requestCacheExpiry: Double? { get set }
    var results: [Animie]? { get set }
    var lastPage: Int? { get set }
}

struct AnimieResult: AnimieProtocol {
    var requestHash: String?
    var requestCached: Bool?
    var requestCacheExpiry: Double?
    var results: [Animie]?
    var lastPage: Int?
    
    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case results
        case lastPage = "last_page"
    }
}

// MARK: - Result
struct Animie: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url
        case imageURL = "image_url"
        case title, airing, synopsis, type, episodes, score
        case startDate = "start_date"
        case endDate = "end_date"
        case members, rated
    }
}
