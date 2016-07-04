//
//  ModelObjects.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-07-04.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import Foundation

struct Review {
    let comment: String
    let reviewer: String

    init(
        comment: String,
        reviewer: String
        ) {
        self.comment  = comment
        self.reviewer = reviewer
    }
}

struct Author {
    let name: String
    let websiteURL: String
    let twitterURL: String?
    // I defined twitterURL as optional because, judging from the sample
    // JSON, it is a field that may or may not be present in
    // the response. Ideally, this would be well defined
    // on the documentation for the API I'm trying to consume.

    init(
        name: String,
        websiteURL: String,
        twitterURL: String? = nil
        ) {
        self.name       = name
        self.websiteURL = websiteURL
        self.twitterURL = twitterURL
    }
}

struct Book {
    let id: Int
    let title: String
    let numberOfPages: Int
    let authors: [Author]
    let reviews: [Review]

    init(
        id: Int,
        title: String,
        numberOfPages: Int,
        authors: [Author],
        reviews: [Review]
        ) {
        self.id            = id
        self.title         = title
        self.numberOfPages = numberOfPages
        self.authors       = authors
        self.reviews       = reviews
    }
}
