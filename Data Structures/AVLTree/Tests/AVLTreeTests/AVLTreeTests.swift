import XCTest
@testable import AVLTree

class AVLTreeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(AVLTree().text, "Hello, World!")
    }


    static var allTests : [(String, (AVLTreeTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
