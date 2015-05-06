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
    
<<<<<<< Updated upstream
    public static func write(realm: RLMRealm, f: (RLMRealm) -> ()) {
        realm.beginWriteTransaction()
        f(realm)
        realm.commitWriteTransaction()
=======
    public static let defaultRealm = RLMRealm.defaultRealm()
    
    public static func add(objects: RLMObject...) {
        
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        for object in objects {
            realm.addObject(object)
        }
        realm.commitWriteTransaction()
    }
    
    public static func write() {
        return defaultRealm.beginWriteTransaction()
    }
    
    public static func commit() {
        return defaultRealm.commitWriteTransaction()
>>>>>>> Stashed changes
    }

}