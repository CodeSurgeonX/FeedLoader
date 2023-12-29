//
//  RemoteFeedLoader.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation
class RemoteFeedLoader {
    let url: String
    let client: HTTPClientProtocol
    
    
    init(url: String, client: HTTPClientProtocol) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping (FeedLoaderError?) -> Void) {
        client.load(url: self.url) { error in
            
            if let error {
                completion(.connectivity)
            } else {
                completion(nil)
            }
            
        }
    }
}

public enum FeedLoaderError: Error {
    case connectivity
}
