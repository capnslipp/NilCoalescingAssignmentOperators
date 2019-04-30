// swift-tools-version:4.2
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
		.version("3"),
		.version("4"),
		.version("4.2"),
		.version("5"),
	]
)
