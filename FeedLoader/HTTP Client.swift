//
//  HTTP Client.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation

protocol HTTPClientProtocol {
    func load(url: URL, completion: @escaping (Result<(res: HTTPURLResponse?, data: Data), Error>) -> Void)
}

class HTTPClient : HTTPClientProtocol {
    func load(url: URL, completion: (Result<(res: HTTPURLResponse?, data: Data), Error>) -> Void) {
        //Real code has to do its own thing
    }
}
