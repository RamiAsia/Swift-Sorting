import XCTest
@testable import Queue

class QueueTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Queue().text, "Hello, World!")
    }


    static var allTests : [(String, (QueueTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
