//
//  RealmManager.swift
//  TotalPlantAssessment
//
//  Created by Nathan Mann on 4/14/15.
//  Copyright (c) 2015 Nathan Mann. All rights reserved.
//

import Foundation
import Realm

public struct Realm {
    
    public static let defaultRealm = RLMRealm.defaultRealm()
    
    public static func add(objects: RLMObject...) {
        RLMRealm.defaultRealm().beginWriteTransaction()
        for object in objects {
            defaultRealm.addObject(object)
        }
        RLMRealm.defaultRealm().commitWriteTransaction()
    }
    
    public static func write() {
        return defaultRealm.beginWriteTransaction()
    }
    
    public static func commit() {
        return defaultRealm.commitWriteTransaction()
    }
}