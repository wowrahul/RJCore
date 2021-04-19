//
//  RJCoreNetworkingTests.swift
//  RJCoreTests
//
//  Created by Rahul Joshi on 4/18/21.
//

import XCTest
@testable import RJCore

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}


final class RJCoreNetworkingTests: XCTestCase {

    func loadDataCall() {
        let manager = RJCore.Networking.Manager()
        let session = NetworkSessionMock()
        manager.urlSession = session
        
        let expectation = XCTestExpectation(description: "Called for Data")
        let data = Data([0,1,0,1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        
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
