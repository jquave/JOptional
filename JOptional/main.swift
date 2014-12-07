//
//  main.swift
//  JOptional
//
//  Created by Jameson Quave on 12/6/14.
//  Copyright (c) 2014 JQ Software LLC. All rights reserved.
//

import Foundation

enum JOptional<T> {
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
            assert(true, "Unexpectedly found nil while unwrapping an JOptional value")
        }
        return JOptional.None
    }
    
}

postfix operator >! {}
postfix func >! <T>(value: JOptional<T> ) -> Any {
    return value.unwrap()
}

// Instantiate some optionals
var myOptionalString = JOptional("A String!")
var a = myOptionalString.unwrap()   // "A String!"
var c = myOptionalString>!          // "A String!"

println(a)
println(c)
