# NilCoalescingAssignmentOperators

NilCoalescingAssignmentOperators is Swift micro-library that provides two nil-coalescing/assignment-combo operators:

## `??=`

**`aVariable ??= newValue`** performs the value assignment if `aVariable` is nil _(like Ruby's `||=` operator)_:

1. If `aVariable` is non-nil, does nothing.
2. If `aVariable` is nil but `newValue` is non-nil, does the assignment: `aVariable = newValue`
3. If `aVariable` & `newValue` are both nil, does nothing.

```swift
aVariable ??= newValue
```
is equivalent to:

```swift
// roughly:
aVariable = aVariable ?? newValue

// precisely:
if aVariable == nil { aVariable = newValue }
```

## `=??`

**`aVariable =?? newValue`** performs the value assignment if `newValue` is non-nil _(like `??=` but prefers the `newValue` over the `aVariable`)_:

1. If `newValue` is nil, does nothing.
2. If `newValue` is non-nil, does the assignment: `aVariable = newValue`
3. If `aVariable` & `newValue` are both non-nil, still does the assignment.


```swift
aVariable =?? newValue
```
is equivalent to:

```swift
// roughly:
aVariable = newValue ?? aVariable

// precisely:
if newValue != nil { aVariable = newValue }
// or
if let newValue = newValue { aVariable = newValue }
```


## Build Overlays

The master branch is Swift 5.x, and build overlays (the minimal changeset to the Package.swift, xcodeproj, and other build files) of the current library version are available on the [swift-4.2](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-4.2), [swift-4](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-4), and [swift-3](https://github.com/capnslipp/NilCoalescingAssignmentOperators/tree/swift-3) branches.  _(Note: I don't check that these are built as often as I used to when Swift 4.2 or 4.0 were the latest versions, but their changes haved worked and I've merged new library versions into them since then.)_
