import XCTest
@testable import HeapSort

class HeapSortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(HeapSort().text, "Hello, World!")
    }


    static var allTests : [(String, (HeapSortTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
