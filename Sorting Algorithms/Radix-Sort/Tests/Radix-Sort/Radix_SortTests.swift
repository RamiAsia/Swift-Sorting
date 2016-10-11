import XCTest
@testable import Radix_Sort

class Radix_SortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Radix_Sort().text, "Hello, World!")
    }


    static var allTests : [(String, (Radix_SortTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
