import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RJCoreColorTests.allTests),
        testCase(RJCoreNetworkingTests.allTests)
    ]
}
#endif
