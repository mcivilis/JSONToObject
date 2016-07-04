//
//  Helpers.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-06-23.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation


//The flatten(_:) function takes a double optional and removes one level of optional-ness. The custom operator >>>= takes an optional of type A to the left, and a function that takes an A as a parameter and returns an optional B to the right.

//use my own verbose variables for clarity
//func flatten <OptionalType> (optional: OptionalType??) -> OptionalType? {
//    if let result = optional {
//        return result
//    }
//    return nil
//}

//use my own verbose variables for clarity

//infix operator >>>* {}
//func >>>* <OptionalType, UnwrappedOptionalType> (optional: OptionalType?, performUnwrapping: OptionalType -> UnwrappedOptionalType) -> UnwrappedOptionalType? {
//    return flatten(optional.map(performUnwrapping))
//}

func flatten<A>(x: A??) -> A? {
    if let y = x { return y }
    return nil
}

infix operator >>>= {}
func >>>= <A, B> (optional: A?, f: A -> B?) -> B? {
    return flatten(optional.map(f))
}

func number(input: [NSObject:AnyObject], key: String) -> NSNumber? {
    return input[key] >>>= { $0 as? NSNumber }
}

func int(input: [NSObject:AnyObject], key: String) -> Int? {
    return number(input, key: key).map { $0.integerValue }
}

func float(input: [NSObject:AnyObject], key: String) -> Float? {
    return number(input, key: key).map { $0.floatValue }
}

func double(input: [NSObject:AnyObject], key: String) -> Double? {
    return number(input, key: key).map { $0.doubleValue }
}

func string(input: [String:AnyObject], key: String) -> String? {
    return input[key] >>>= { $0 as? String }
}

func bool(input: [String:AnyObject], key: String) -> Bool? {
    return number(input, key: key).map { $0.boolValue }
}


//http://swanros.com/how-i-deal-with-json-in-swift/
