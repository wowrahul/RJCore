import XCTest
@testable import RJCore

final class RJCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(RJCore().text, "Hello, World!")
    }

    func testColorRedEqual() {
        let color = RJCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
