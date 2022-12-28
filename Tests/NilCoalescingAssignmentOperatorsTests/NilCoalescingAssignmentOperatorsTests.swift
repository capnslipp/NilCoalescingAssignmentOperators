import XCTest
@testable import NilCoalescingAssignmentOperators



final class NilCoalescingAssignmentOperatorsTests : XCTestCase
{
	func testExample()
	{
		do {
			let rhsString: String = "rhs"
			
			do {
				var lhsString: String? = "A"
				lhsString ??= rhsString
				XCTAssertEqual(lhsString, "A")
			}
			do {
				var lhsString: String? = nil
				lhsString ??= rhsString
				XCTAssertEqual(lhsString, "rhs")
			}
		}
		
		do {
			let rhsStringA: String? = "A"
			let rhsStringB: String? = nil
			
			do {
				var lhsString: String? = "1"
				lhsString ??= rhsStringA
				XCTAssertEqual(lhsString, "1")
			}
			do {
				var lhsString: String? = "1"
				lhsString ??= rhsStringB
				XCTAssertEqual(lhsString, "1")
			}
			do {
				var lhsString: String? = nil
				lhsString ??= rhsStringA
				XCTAssertEqual(lhsString, "A")
			}
			do {
				var lhsString: String? = nil
				lhsString ??= rhsStringB
				XCTAssertEqual(lhsString, nil)
			}
		}
		
		do {
			let rhsStringA: String? = "A"
			let rhsStringB: String? = nil
			
			do {
				var lhsString: String? = "1"
				lhsString =?? rhsStringA
				XCTAssertEqual(lhsString, "A")
			}
			do {
				var lhsString: String? = "1"
				lhsString =?? rhsStringB
				XCTAssertEqual(lhsString, "1")
			}
			do {
				var lhsString: String? = nil
				lhsString =?? rhsStringA
				XCTAssertEqual(lhsString, "A")
			}
			do {
				var lhsString: String? = nil
				lhsString =?? rhsStringB
				XCTAssertEqual(lhsString, nil)
			}
		}
		
		do {
			let rhsStringA: String? = "A"
			let rhsStringB: String? = nil
			
			do {
				var lhsString: String = "1"
				lhsString =?? rhsStringA
				XCTAssertEqual(lhsString, "A")
			}
			do {
				var lhsString: String = "1"
				lhsString =?? rhsStringB
				XCTAssertEqual(lhsString, "1")
			}
		}
	}

	static var allTests = [
		("testExample", testExample),
	]
}
