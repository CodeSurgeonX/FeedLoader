//
//  FeedLoaderTests.swift
//  FeedLoaderTests
//
//  Created by Shashwat Kashyap on 29/12/23.
//

import XCTest
@testable import FeedLoader

class FeedLoaderTests: XCTestCase {
    private let client = HTTPClientSpy()
    lazy var sut = RemoteFeedLoader(url: URL(string: "a.com")!, client: client)

    func test_Error_AsyncWay_ConnectivityError() {
        var capturedErrors: [FeedLoaderError] = []

        sut.load { error in
            if let error {
                capturedErrors.append(error)
            }
        }
        
        client.completeWithError(error: NSError(domain: "HTTPError", code: 201))
        XCTAssertEqual(capturedErrors, [FeedLoaderError.connectivity])
    }
    
    
    func test_Error_AsyncWay_InvalidData() {
        var capturedErrors: [FeedLoaderError] = []

        sut.load { error in
            if let error {
                capturedErrors.append(error)
            }
        }
        
//        client.completeWithError(error: NSError(domain: "HTTPError", code: 201))
        let invalidData = Data("Invalid JSON".utf8)
        client.completeWithStatusCode(code: 201, data: invalidData)
        XCTAssertEqual(capturedErrors, [FeedLoaderError.invalidData])
    }
    

    // MARK: - Helpers
    
    private class HTTPClientSpy: HTTPClientProtocol {
        typealias HTTPClientCompletion = (Result<(res: HTTPURLResponse?, data: Data), Error>) -> Void
        
        var messages: [(url: URL, completion: HTTPClientCompletion)] = []
        
        func load(url: URL, completion: @escaping HTTPClientCompletion) {
            messages.append((url, completion))
        }
        
        func completeWithError(error: Error, index: Int = 0) {
            messages[index].completion(.failure(error))
        }
        
        func completeWithStatusCode(code: Int, data: Data, index: Int = 0) {
            let message = messages[index]
            let response = HTTPURLResponse(url: message.url, statusCode: code, httpVersion: nil, headerFields: nil)
            message.completion(.success((res: response, data: Data("invalid Data".utf8))))
        }
    }

}
