//
//  Review.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-07-05.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation

extension Review: JSONParselable {
    
    static func withJSON(json: [String:AnyObject]) -> Review? {
        guard
            let comment = string(json, key: "comment"),
            reviewer    = string(json, key: "reviewer")
            else {
                return nil
                // A valid Review always has a comment and a
                // reviewer.
        }

        return Review(comment: comment,
                      reviewer: reviewer)
    }
}