//
//  JSONParsing.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-07-05.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation

protocol JSONParselable {
    static func withJSON(json: [String:AnyObject]) -> Self?
}

// The flatten(_:) function takes a double optional and removes one level of optional-ness
// The custom operator >>>= takes an optional of type A to the left, and a function that takes an A as a parameter and returns an optional B to the right.
// http://swanros.com/how-i-deal-with-json-in-swift/

func flatten <Optional> (optional: Optional??) -> Optional? {
    if let unwrappedOptional = optional {
        return unwrappedOptional
    }
    return nil
}

infix operator >>>= {}
func >>>= <A, B> (optional: A?, function: A -> B?) -> B? {
    return flatten(optional.map(function))
}

// MARK: Retrieve data from JSON structures in a type-safe manner
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
