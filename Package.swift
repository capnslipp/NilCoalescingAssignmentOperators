// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "NilCoalescingAssignmentOperators",
	products: [
		.library(name: "NilCoalescingAssignmentOperators", targets: [ "NilCoalescingAssignmentOperators" ]),
	],
	dependencies: [],
	targets: [
		.target(name: "NilCoalescingAssignmentOperators", dependencies: [], path: "Sources/"),
	],
	swiftLanguageVersions: [
		3,
		4,
		5,
	]
)
