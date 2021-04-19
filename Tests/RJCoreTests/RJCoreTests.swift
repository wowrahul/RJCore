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
    
    func testRJCoreColorsAreEqual() {
        let color = RJCore.colorFromHexString("D3D3D3")
        XCTAssertEqual(color, RJCore.lightGray)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testRJCoreColorAreEqual", testRJCoreColorsAreEqual)
    ]
}
