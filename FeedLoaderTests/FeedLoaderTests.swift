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
    lazy var sut = RemoteFeedLoader(url: "a.com", client: client)
    var capturedErrors: [FeedLoaderError] = []
    
    
    
//    func test_Error() {
//        client.error = NSError(domain: "ConnectionError", code: 0) //Random HTTP Error
//        
//        sut.load { [weak self] error in
//            // If feed back loader gave an error store it
//            if let error {
//                self?.capturedErrors.append(error)
//            }
//        }
//    
//        XCTAssertEqual(capturedErrors, [FeedLoaderError.connectivity])
//    }
    
    
    func test_Error_AsyncWay() {
        
        sut.load { [weak self] error in
            if let error {
                self?.capturedErrors.append(error)
            }
        }
        
        client.completions[0](NSError(domain: "", code: 1))
        XCTAssertEqual(capturedErrors, [FeedLoaderError.connectivity])
    }
    

    // MARK: - Helpers
    
    private class HTTPClientSpy: HTTPClientProtocol {
        typealias HTTPClientCompletion = (Error?) -> Void
        
        
//        var error: Error? // Set this before test
        
        
        // These two can be used for testing
        var urlRequests: [String] = []
        var completions: [HTTPClientCompletion] = []
        
        func load(url: String, completion: @escaping HTTPClientCompletion) {
            completions.append(completion)
        }
    }

}
