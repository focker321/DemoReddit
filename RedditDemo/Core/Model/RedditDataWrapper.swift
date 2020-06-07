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

struct ReditData: Codable {
    let modhash: String
    let dist: Int
    let children: [RedditDataWrapper<RedditPost>]
}

struct RedditPost: Codable {
    let subreddit: String
    // TODO: Improve using coding keys
    let author_fullname: String
    let saved: Bool
    let gilded: Int
    let clicked: Bool
    let title: String
}
