//
//  RemoteFeedLoader.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation
class RemoteFeedLoader {
    let url: URL
    let client: HTTPClientProtocol
    
    
    init(url: URL, client: HTTPClientProtocol) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping (FeedLoaderError?) -> Void) {
        client.load(url: self.url) { result in
            switch result {
            case .success(let response):
                // Deal with response and data
                print(response.res)
                print(response.data)
                
                //Lets say data conversion failed
                completion(.invalidData)
            case .failure(let error):
                // Deal with error
                print(error)
                completion(.connectivity)
            }
        }
    }
}

public enum FeedLoaderError: Error {
    case connectivity
    case invalidData
}
