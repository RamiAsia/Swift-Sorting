import XCTest
@testable import BinarySearchTree

class BinarySearchTreeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(BinarySearchTree().text, "Hello, World!")
    }


    static var allTests : [(String, (BinarySearchTreeTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
