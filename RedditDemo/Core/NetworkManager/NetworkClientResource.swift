//
//  NetworkClientResources.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

// TODO: Think another better name
protocol NetworkClientAccessible {
    func fetch(_ resource: NetworkClient.Resource, result: @escaping ((NetworkClient.Result<Data>) -> Void))
}

enum NetworkClient {
    struct Resource {
        let url: URL
        let method: String = "GET"
    }
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }

    enum ErrorType: Error {
        case noData
    }
}
