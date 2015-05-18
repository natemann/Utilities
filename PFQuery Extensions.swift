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
        orderByDescending("createdAt")
        skip  = next
        limit = 2
        return findObjectsInBackground().continueWithBlock {
            if let objects = $0.result as? [PFObject] {
                if objects.count > 0 {
                    objects.map { to.append($0) }
                    return self.addObjects(to, next: self.skip + self.limit)
                }
                else {
                    return BFTask(result: to)
                }
            }
            return BFTask()
        }
    }
}