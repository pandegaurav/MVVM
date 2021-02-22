//
//  BayutNetworkTesting.swift
//  BayutTests
//
//  Created by Pande, Gaurav on 20/02/21.
//

import XCTest

@testable import Bayut

class BayutNetworkTesting: XCTestCase {
    
    var apiService : APIService = APIService()

    func test_API_BaseURLString_IsCorrect() {
        let baseURLString = apiService.sourcesURL.absoluteString
            let expectedBaseURLString = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
            XCTAssertEqual(baseURLString, expectedBaseURLString, "Base URL does not match expected base URL. Expected base URLs to match.")
        }
   
}
