//
//  MyAnimeTests.swift
//  MyAnimeTests
//
//  Created by Garry on 04/07/22.
//

import XCTest
import Moya
@testable import MyAnime

class MyAnimeRemoteRepositoryTests: XCTestCase {

    private let helper = MyAnimeRemoteRepositoryHelper()
    
    func test_success_getAnimeList() async throws {
        
        let expectation = XCTestExpectation(description: "AnimeListEndpointSuccess")
        
        do {
            let result = try await helper.stubGetAnimeList()
            
            XCTAssertEqual((result.top?.count).orZero(), 1)
            
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }
        
        wait(for: [expectation], timeout: 10)
    }

}
