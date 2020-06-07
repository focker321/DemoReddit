//
//  RedditDataWrapper.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

struct RedditDataWrapper<T>: Codable where T: Codable {
    let kind: String
    let data: T
}

struct RedditData: Codable {
    let modhash: String
    let dist: Int
    let children: [RedditDataWrapper<RedditPost>]
}

extension RedditData {
    var posts: [RedditPost] {
        children.map { $0.data }
    }
}

struct RedditPost: Codable {
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case clicked
        case hidden
        case linkFlairText = "link_flair_text"
        case thumbnail
        case created
    }
    
    let author: String
    let title: String
    let clicked: Bool
    let hidden: Bool
    let linkFlairText: String?
    let thumbnail: String
    let created: Double
}
