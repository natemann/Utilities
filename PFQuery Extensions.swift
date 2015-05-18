//
//  PFQuery Extensions.swift
//  Budget
//
//  Created by Nathan Mann on 2/14/15.
//  Copyright (c) 2015 Nate. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Async
import Bolts

extension PFQuery {
    

    
    public func allObjectsInBackground() -> BFTask {
        return addObjects([PFObject](), next: 0)
    }

    
    private func addObjects(var to: [PFObject], next: Int) -> BFTask {
        let task = BFTaskCompletionSource()
        orderByDescending("createdAt")
        skip  = next
        limit = 1000
        return findObjectsInBackground().continueWithBlock {
            if let objects = $0.result as? [PFObject] {
                if objects.count > 0 {
                    objects.map { to.append($0) }
                    return self.addObjects(to, next: self.skip + self.limit)
                }
                else {
                    task.setResult(to)
                    return task.task
                }
            }
            task.setResult(nil)
            return task.task
        }
    }
}