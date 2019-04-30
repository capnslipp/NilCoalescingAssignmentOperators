// swift-tools-version:3.0
import PackageDescription

let package = Package(
	name: "NilCoalescingAssignmentOperators",
	targets: [
		Target(name: "NilCoalescingAssignmentOperators", dependencies: []),
	],
	dependencies: [],
	swiftLanguageVersions: [
		3,
		4,
		5,
	]
)
