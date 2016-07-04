//
//  ViewController.swift
//  JSONToObject
//
//  Created by Maria Civilis on 2016-06-23.
//  Copyright © 2016 Maria Civilis. All rights reserved.
//

import UIKit

protocol JSONParselable {
    static func withJSON(json: [String:AnyObject]) -> Self?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = NSBundle.mainBundle().pathForResource("Freakonomics", ofType: "json")
        let data = NSData.init(contentsOfFile: filePath!)

        let jsonDict: Dictionary <String, AnyObject>!
        do {
            jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? Dictionary
        } catch {
            print(error)
        }


    }




}

