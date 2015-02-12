//
//  QuoteGenerator.swift
//  Quotely
//
//  Created by Yangzi He on 2/10/15.
//  Copyright (c) 2015 Yangzi He. All rights reserved.
//

import Foundation
import UIKit


class QuoteGenerator {
    var joke: String = ""
    
    func retrieveJoke() {
        var url: String = "http://api.icndb.com/jokes/random"
        var request: NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
        let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
        
        if (jsonResult != nil) {
        // process jsonResult
            if let value: NSDictionary = jsonResult["value"] as? NSDictionary {
                if let retrievedJoke: String = value["joke"] as? String {
                    self.joke = retrievedJoke
                }
            }
        } else {
        // couldn't load JSON, look at error

        }
        
        
        })
        
    }

    
}