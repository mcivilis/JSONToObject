//
//  Book.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-07-05.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation

extension Book: JSONParselable {

    static func withJSON(json: [String:AnyObject]) -> Book? {
        // #1 Make sure that the required data is in the JSON dictionary, and extract it accordingly.
        guard
            let id        = int(json, key: "id"),
            title         = string(json, key: "title"),
            numberOfPages = int(json, key: "number_of_pages")
            else {
                return nil
        }

        // #2 Extract the dictionaries for authors and reviews respectively.
        let authorsDicts = json["authors"] as? [[String:AnyObject]]
        let reviewsDicts = json["reviews"] as? [[String:AnyObject]]

        func sanitizedAuthors(dicts: [[String:AnyObject]]?) -> [Author] {
            guard let dicts = dicts else {
                return [Author]()
            }
            return dicts.flatMap { Author.withJSON($0) }
        }

        func sanitizedReviews(dicts: [[String:AnyObject]]?) -> [Review] {
            guard let dicts = dicts else {
                return [Review]()
            }
            return dicts.flatMap { Review.withJSON($0) }
        }

        // #3 Return a new instance of Book passing the required data first.
        return Book(
            id: id,
            title: title,
            numberOfPages: numberOfPages,
            // #4 For authors and reviews, just .flatMap the array of dictionaries, and construct an array of only valid Authors and Reviews.
            authors: sanitizedAuthors(authorsDicts),
            reviews: sanitizedReviews(reviewsDicts)
        )
    }
}