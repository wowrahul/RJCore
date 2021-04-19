import XCTest
@testable import RJCore

final class RJCoreColorTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = RJCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testLigthGrayColorsAreEqual() {
        let color = RJCore.Color.fromHexString("D3D3D3")
        XCTAssertEqual(color, RJCore.Color.lightGray)
    }
    
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testLigthGrayColorsAreEqual", testLigthGrayColorsAreEqual)
    ]
}
