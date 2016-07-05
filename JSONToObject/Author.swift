//
//  Author.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-07-05.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation

extension Author: JSONParselable {

    static func withJSON(json: [String:AnyObject]) -> Author? {
        guard
            let name   = string(json, key: "name"),
            websiteURL = string(json, key: "website_url")
            else {
                return nil
        }

        // Since the twitterURL property is optional,
        // Call string(_:key:) and pass that value to the initializer
        return Author(name: name,
                      websiteURL: websiteURL,
                      twitterURL: string(json, key: "twitter_url"))
    }
}