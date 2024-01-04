//
//  RemoteFeedLoader.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation
class RemoteFeedLoader {
    typealias RemoteFeedLoaderCompletion = (FeedLoaderError?) -> Void
    let url: URL
    let client: HTTPClientProtocol
    
    init(url: URL, client: HTTPClientProtocol) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping RemoteFeedLoaderCompletion) {
        client.load(url: self.url) { result in
            switch result {
            case .success(let response):
                completion(.invalidData)
            case .failure(let error):
                completion(.connectivity)
            }
        }
    }
}

public enum FeedLoaderError: Error {
    case connectivity
    case invalidData
}
