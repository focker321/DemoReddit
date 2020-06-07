//
//  RedditClient.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

final class RedditClient: NetworkClientAccessible {
    func fetch(_ resource: NetworkClient.Resource, result: @escaping ((NetworkClient.Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(NetworkClient.ErrorType.noData))
                return
            }
            
            if let `error` = error {
                result(.failure(error))
                return
            }
            
            result(.success(data))
        }
        task.resume()

    }
} 

extension RedditClient {
    func fetchObject<T>(_ resource: NetworkClient.Resource, _ completion: @escaping ((NetworkClient.Result<T>) -> Void)) where T: Codable {
        fetch(resource) { result in
            switch result {
            case .success(let serializedData):
                do {
                    let deserializedData = try JSONDecoder().decode(RedditDataWrapper<T>.self, from: serializedData)
                    completion(.success(deserializedData.data))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
} 
