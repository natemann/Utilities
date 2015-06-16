//
//  PFQuery Extensions.swift
//  Budget
//
//  Created by Nathan Mann on 2/14/15.
//  Copyright (c) 2015 Nate. All rights reserved.
//

import Parse
import Bolts
import ReactiveCocoa

extension PFObject {
    
    public func racSave() -> SignalProducer<PFObject, NSError> {
        return SignalProducer { sink, disposable in
            self.saveInBackgroundWithBlock { (success, error) in
                if let error = error {
                    sendError(sink, error)
                }
                else {
                    sendNext(sink, self)
                    sendCompleted(sink)
                }
            }
        }
    }
    
    
    public func racDelete() -> SignalProducer<Bool, NSError> {
        return SignalProducer { sink, disposable in
            self.deleteInBackgroundWithBlock { (success, error) in
                if let error = error {
                    sendError(sink, error)
                }
                else {
                    sendNext(sink, true)
                    sendCompleted(sink)
                }
            }
        }
    }
    
}



extension PFQuery {
    
    public func racFindObjects() -> SignalProducer<[PFObject]?, NSError> {
        return SignalProducer { sink, _ in
            self.findObjectsInBackgroundWithBlock { (objects, error) in
                if let error = error {
                    sendError(sink, error)
                }
                else {
                    if let objects = objects as? [PFObject] {
                        sendNext(sink, objects)
                        sendCompleted(sink)
                    }
                    else {
                        sendNext(sink, nil)
                        sendCompleted(sink)
                    }
                }
            }
        }
    }
    
    
    public func allObjectsInBackground() -> BFTask {
        return addObjects([PFObject](), next: 0)
    }

    
//    public func racAllObjects() -> SignalProducer<[PFObject]?, NSError> {
//        return racAddObjects([PFObject](), next: 0)
//    }
    
    
   
    
    
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