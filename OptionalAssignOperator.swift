//
//  OptionalAssignOperator.swift
//  
//
//  Created by Cap'n Slipp on 8/24/16.
//  Copyright © 2016 Cap'n Slipp. All rights reserved.
//



infix operator =? : AssignmentPrecedence

func =?<Wrapped>(lhs:inout Wrapped, rhs:Optional<Wrapped>) {
	if rhs != nil { lhs = rhs! }
}
