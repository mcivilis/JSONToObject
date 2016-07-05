//
//  ViewController.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-06-23.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = NSBundle.mainBundle().pathForResource("Freakonomics", ofType: "json")
        let jsonData = NSData.init(contentsOfFile: filePath!)

        if let data = jsonData {
            self.dataTaskFinishedWithData(data)
        }

        //Basic JSON parsing in swift that gives only a type-safe JSON type that still needs to be parsed into data models
        let jsonDict: Dictionary <String, AnyObject>!
        do {
            jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions()) as? Dictionary
            print(jsonDict)
        } catch {
            print(error)
        }

        


    }

    func dataTaskFinishedWithData(data: NSData) {
        do {
            guard
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject],
                book = Book.withJSON(json)
                else {
                    return
            }
            // Fully-packaged, type-safe, valid instance of Book, with nested models
            print(book)
        } catch {
            print(error)
        }
    }

}

