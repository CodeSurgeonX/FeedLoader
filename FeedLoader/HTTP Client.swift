//
//  HTTP Client.swift
//  FeedLoader
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import Foundation

protocol HTTPClientProtocol {
    func load(url:String, completion: @escaping (Error?) -> Void)
}

class HTTPClient : HTTPClientProtocol {
    func load(url: String, completion: (Error?) -> Void) {
        //Real code has to do its own thing
    }
}
