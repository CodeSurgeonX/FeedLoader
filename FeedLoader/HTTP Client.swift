//
//  HTTP Client.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation

protocol HTTPClientProtocol {
    typealias HTTPClientCompletion = (Result<(res: HTTPURLResponse?, data: Data), Error>) -> Void
    
    func load(url: URL, completion: @escaping HTTPClientCompletion)
}

class HTTPClient : HTTPClientProtocol {
    func load(url: URL, completion: HTTPClientCompletion) { }
}
