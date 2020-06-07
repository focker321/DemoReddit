//
//  URLRequest+Resource.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

extension URLRequest {
    init(_ resource: NetworkClient.Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
}
