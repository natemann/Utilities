//
//  PFQuery Extensions.swift
//  Budget
//
//  Created by Nathan Mann on 2/14/15.
//  Copyright (c) 2015 Nate. All rights reserved.
//

import Foundation

extension PFQuery {
    
//    public class func incomeCategoryQuery() -> PFQuery {
//        return Category.query()!.whereKey("name", equalTo: "Income")
//    }
    
    public func allObjectsInBackground(callBack: [PFObject] -> ()) {
        var objects = [PFObject]()
        Async.background {
            objects = self.addObjects(0)
            callBack(objects)
        }
    }

    
    private func addObjects(next: Int) -> [PFObject] {
        orderByDescending("createdAt")
        skip  = next
        limit = 1000
        if var objects = findObjects() as? [PFObject] {
            if objects.count > 0 {
                return objects + addObjects(skip + limit)
            }
            else {
                return objects
            }
        }
        else {
            return []
        }
    }
}