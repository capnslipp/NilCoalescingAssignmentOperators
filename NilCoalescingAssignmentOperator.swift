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



// MARK: =?? Operator

infix operator =?? : AssignmentPrecedence


/// Assigns only when `rhs` is non-`nil`..
/// - Remark: effectively `lhs = rhs ?? lhs` _(skipping same-value assignments)_
public func =??<Wrapped>(lhs:inout Wrapped, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	let rhs:Wrapped? = try rhsClosure()
	if rhs != nil {
		lhs = rhs!
	}
}
/// Assigns only when `rhs` is non-`nil`.
/// - Remark: effectively `lhs = (rhs ?? lhs) ?? nil` _(skipping same-value assignments)_
public func =??<Wrapped>(lhs:inout Wrapped?, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	let rhs:Wrapped? = try rhsClosure()
	if rhs != nil {
		lhs = rhs
	}
}
/// Assigns only when `rhs` is non-`nil`.
/// - Remark: effectively `lhs = (rhs ?? lhs) ?? nil` _(skipping same-value assignments)_
public func =??<Wrapped>(lhs:inout Wrapped!, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	let rhs:Wrapped? = try rhsClosure()
	if rhs != nil {
		lhs = rhs
	}
}



// MARK: ??= Operator

infix operator ??= : AssignmentPrecedence


// FIXME: The following two variants are commented-out because Swift (3.0.2)'s type inference will apparently auto-promote a `Wrapped` type returned from a closure to `Wrapped?`, then get confused that we have specializations for both `Wrapped` & `Wrapped?`.
// 	Without commenting these out, we're stuck with explicitly typing any closures used as the RHS.
// 	With these commented out (using the specializations with always-`Wrapped?` RHSes), we just have to deal with the additional inefficiency of promoting the RHS's `Wrapped` to `Wrapped?` then doing a superfluous `rhs != nil` check.
///// Assigns only when `lhs` is `nil`.
///// - Remark: effectively `lhs = lhs ?? rhs` _(skipping same-value assignments)_
//public func ??=<Wrapped>(lhs:inout Wrapped?, rhsClosure:(@autoclosure ()throws->Wrapped)) rethrows {
//	if lhs == nil {
//		let rhs:Wrapped = try rhsClosure()
//		lhs = rhs
//	}
//}
///// Assigns only when `lhs` is `nil`.
///// - Remark: effectively `lhs = lhs ?? rhs` _(skipping same-value assignments)_
//public func ??=<Wrapped>(lhs:inout Wrapped!, rhsClosure:(@autoclosure ()throws->Wrapped)) rethrows {
//	if lhs == nil {
//		let rhs:Wrapped = try rhsClosure()
//		lhs = rhs
//	}
//}

/// Assigns only when `lhs` is `nil` (and `rhs` is non-`nil`).
/// - Remark: effectively `lhs = (lhs ?? rhs) ?? nil` _(skipping same-value assignments)_
public func ??=<Wrapped>(lhs:inout Wrapped?, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	if lhs == nil {
		let rhs:Wrapped? = try rhsClosure()
		if rhs != nil {
			lhs = rhs
		}
	}
}
/// Assigns only when `lhs` is `nil` (and `rhs` is non-`nil`).
/// - Remark: effectively `lhs = (lhs ?? rhs) ?? nil` _(skipping same-value assignments)_
public func ??=<Wrapped>(lhs:inout Wrapped!, rhsClosure:(@autoclosure ()throws->Wrapped?)) rethrows {
	if lhs == nil {
		let rhs:Wrapped? = try rhsClosure()
		if rhs != nil {
			lhs = rhs
		}
	}
}
