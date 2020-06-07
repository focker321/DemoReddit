//
//  Endpoints.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

enum RedditEndpoint {
    case topList
    case detail
    
    var uri: String {
        switch self {
        case .topList:
            return "https://www.reddit.com/r/all/top/.json?t=all&limit=\(GlobalConstants.numberOfTopPost)"
        case .detail:
            return ""
        }
    }
}
