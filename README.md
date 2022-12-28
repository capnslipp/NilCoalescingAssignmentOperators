# NilCoalescingAssignmentOperators

NilCoalescingAssignmentOperators is Swift micro-library that provides two nil-coalescing/assignment-combo operators:

## `??=`

**`lhs ??= rhs`** works like Ruby's `||=` operator:

1. If `lhs` is non-nil, does nothing.
2. If `lhs` is nil but `rhs` is non-nil, does the assignment: `lhs = rhs`
3. If `lhs` & `rhs` are both nil, does nothing.

```swift
lhs ??= rhs
```
is equivalent to:

```swift
// roughly:
lhs = lhs ?? rhs

// precisely:
if lhs == nil { lhs = rhs }
```

## `=??`

**`lhs =?? rhs`** works similarly, but prefers the `rhs` over the `lhs`:

1. If `rhs` is nil, does nothing.
2. If `rhs` is non-nil, does the assignment: `lhs = rhs`
  * _If `lhs` & `rhs` are both non-nil, still does the assignment._


```swift
lhs =?? rhs
```
is equivalent to:

```swift
// roughly:
lhs = rhs ?? lhs

// precisely:
if rhs != nil { lhs = rhs }
// or
if let rhs = rhs { lhs = rhs }
```


## Build Overlays

The master branch is Swift 5.x, and build overlays (the minimal changeset to the Package.swift, xcodeproj, and other build files) of the current library version are available on the [swift-4.2](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-4.2), [swift-4](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-4), and [swift-3](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-3) branches.  _(Note: I don't check that these are built as often as I used to when Swift 4.2 or 4.0 were the latest versions, but their changes haved worked and I've merged new library versions into them since then.)_
