//
//  RJCoreNetworkingTests.swift
//  RJCoreTests
//
//  Created by Rahul Joshi on 4/18/21.
//

import XCTest
@testable import RJCore

final class RJCoreNetworkingTests: XCTestCase {

    func loadDataCall() {
        let manager = RJCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for Data")
        
        guard let url = URL(string: "https://google.com") else {
            return XCTFail("Could not create URL")
        }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData)
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error forming error")
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
    static var allTests =  [
        ("loadDataCall", loadDataCall)
    ]
}
