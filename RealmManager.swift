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
    
    public static func add(object: RLMObject) {
        defaultRealm.beginWriteTransaction()
        defaultRealm.addObject(object)
        defaultRealm.commitWriteTransaction()
    }
}