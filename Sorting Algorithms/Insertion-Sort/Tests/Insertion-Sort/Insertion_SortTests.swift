import XCTest
@testable import Insertion_Sort

class Insertion_SortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Insertion_Sort().text, "Hello, World!")
    }


    static var allTests : [(String, (Insertion_SortTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
