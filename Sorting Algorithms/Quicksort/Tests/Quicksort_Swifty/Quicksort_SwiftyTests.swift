import XCTest
@testable import Quicksort_Swifty

class Quicksort_SwiftyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Quicksort_Swifty().text, "Hello, World!")
    }


    static var allTests : [(String, (Quicksort_SwiftyTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
