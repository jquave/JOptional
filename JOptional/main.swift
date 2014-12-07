//
//  main.swift
//  JOptional
//
//  Created by Jameson Quave on 12/6/14.
//  Copyright (c) 2014 JQ Software LLC. All rights reserved.
//

import Foundation

func == <T>(lhs: JOptional<T>, rhs: JOptional<T>) -> Bool {
    switch (lhs,rhs) {
    case (.Some(let lhsVal), .Some(let rhsVal)):
        // Both have a value, the *optionals* are equal, although the values might not be
        return true
    case (.None, .None):
        // Both are nil
        return true
    default:
        // One does not have a value, but the other does
        return false
    }
}

enum JOptional<T>: Equatable, NilLiteralConvertible {
    case None
    case Some(T)
    
    init(_ value: T) {
        self = .Some(value)
    }
    
    init() {
        self = .None
    }
    
    func unwrap() -> Any {
        switch self {
        case .Some(let x):
            return x
        default:
            fatalError("Unexpectedly found nil while unwrapping an JOptional value")
        }
    }
    
    var description: String {
        return "hi"
    }
    
    init(nilLiteral: ()) {
        self = .None
    }
    
}

postfix operator >! {}
postfix func >! <T>(value: JOptional<T> ) -> Any {
    return value.unwrap()
}

// Part1
// Instantiate some optionals
var myOptionalString = JOptional("A String!")
var a = myOptionalString.unwrap() // "A String!"
var c = myOptionalString>!     // "A String!"

println(a)
println(c)


// Part 2

// Using Swift's Optional
var myNilValue : String? = nil
if(myNilValue == nil) {
    println("This Optional is nil!")
}
else {
    println("This Optional isn't nil, carry on")
}

// Using JOptional
var x:Bool? = nil
var myNilJOptional = JOptional(x)

myNilJOptional = nil

if(myNilJOptional == nil) {
    println("This JOptional is nil!")
}
else {
    println("This JOptional isn't nil, carry on")
}

