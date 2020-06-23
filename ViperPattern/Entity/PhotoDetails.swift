//
//  PhotoDetails.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation


// MARK: - PeopleImages
struct PhotoDetail: Codable {
    let meta: Meta
    let result: [Result]

    enum CodingKeys: String, CodingKey {
        case meta = "_meta"
        case result
    }
}

// MARK: - Meta
struct Meta: Codable {
    let success: Bool
    let code: Int
    let message: String
    let totalCount, pageCount, currentPage, perPage: Int
    let rateLimit: RateLimit
}

// MARK: - RateLimit
struct RateLimit: Codable {
    let limit, remaining, reset: Int
}

// MARK: - Result
struct Result: Codable {
    let id, albumID, title: String
    let url, thumbnail: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case title, url, thumbnail
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, edit: Edit

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case edit
    }
}

// MARK: - Edit
struct Edit: Codable {
    let href: String
}
