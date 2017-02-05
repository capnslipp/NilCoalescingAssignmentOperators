/// @creator: Slipp Douglas Thompson
/// @license: WTFPL
/// @purpose: A concise operator syntax for assigning to a non-`Optional` from an `Optional`.
/// @why:
/// 	Sometimes in Swift you want to assign only if the RHS is non-`nil`.  
/// 	Say you have `someArg:Int?` and `_someIvar:Int`.  You could use a single-line `if`:  
/// 	    `if someArg != nil { _someIvar = someArg! }`  
/// 	Or you could use a ternary or nil-coalesce:  
/// 	    `_someIvar = someArg != nil ? someArg! : _someIvar`  
/// 	    `_someIvar = someArg ?? _someIvar`  
/// 	But each of those are a bit messy for a simple maybe-assignment.
/// @usage:
/// 	1. Add `NilCoalescingAssignmentOperator.swift` to your project.
/// 	2. Use like this: `_someIvar ??= someArg` (given `_someIvar:Int`/`someArg:Int?`, or given `_someIvar:Int?`/`someArg:Int`).
/// @interwebsouce: https://gist.github.com/capnslipp/9d27a8af34b6ad3402c1d5e5f2a47d0f



infix operator ??= : AssignmentPrecedence

/// Assigns only when `rhs` is non-`nil`.
/// effectively: `lhs = rhs ?? lhs`
public func ??=<Wrapped>(lhs:inout Wrapped, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	let rhs = try rhsClosure()
	if rhs != nil { lhs = rhs! }
}

/// Assigns only when `lhs` is `nil`.
/// effectively: `lhs = lhs ?? rhs`
public func ??=<Wrapped>(lhs:inout Wrapped?, rhsClosure:(@autoclosure ()throws->Wrapped)) rethrows {
	if lhs == nil { lhs = try rhsClosure() }
}
public func ??=<Wrapped>(lhs:inout Wrapped!, rhsClosure:(@autoclosure ()throws->Wrapped)) rethrows {
	if lhs == nil { lhs = try rhsClosure() }
}

/// Assigns only when `lhs` is `nil` and `rhs` is non-`nil`
/// effectively: `lhs = lhs ?? rhs ?? nil`
public func ??=<Wrapped>(lhs:inout Wrapped?, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	if lhs == nil {
		let rhs = try rhsClosure()
		if rhs != nil { lhs = rhs }
	}
}
public func ??=<Wrapped>(lhs:inout Wrapped!, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	if lhs == nil {
		let rhs = try rhsClosure()
		if rhs != nil { lhs = rhs }
	}
}
